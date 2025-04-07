local M = {}

function M.apply_patch()
	local status_ok_snacks, snacks = pcall(require, "snacks")
	local status_ok_dashboard, dashboard = pcall(require, "snacks.dashboard")
	local status_ok_util, util = pcall(require, "snacks.util")
	local status_ok_image, image = pcall(require, "snacks.image")

	if not (status_ok_snacks and status_ok_dashboard and status_ok_util and status_ok_image) then
		vim.notify("Failed to load required snacks modules for patching image section", vim.log.levels.WARN)
		return
	end

	---@diagnostic disable-next-line: duplicate-set-field
	---@param opts {source:(string|fun(): string), height?:number, width?:number, align?: "left"|"center"|"right", hl?:string}|snacks.dashboard.Item
	---@return snacks.dashboard.Gen
	dashboard.sections.image = function(opts)
		local source = type(opts.source) == "function" and opts.source() or opts.source
		local conversion_status = 0

		local convertor = image.convert.convert({
			src = source,
			on_done = function(convert)
				if convert:error() then
					conversion_status = 2
					vim.notify("Failed to convert dashboard image to PNG file", vim.log.levels.ERROR)
				else
					conversion_status = 1
				end
			end,
		})

		convertor:run()
		vim.wait(10000, function()
			return conversion_status > 0
		end, 200, false)

		if conversion_status ~= 1 then
			return function(_)
				return {
					action = nil,
					key = nil,
					label = nil,
					render = function(_, _) end,
					text = "",
				}
			end
		end

		return function(self)
			local width = opts.width or (self.opts and self.opts.width) or vim.fn.winwidth(0)
			local height = opts.height or 20
			local cells = image.util.fit(convertor.file, { width = width, height = height }, { full = true })

			local indent = 0
			if opts.align == "center" then
				indent = math.floor((width - cells.width) / 2)
			elseif opts.align == "right" then
				indent = width - cells.width
			end

			local buf = vim.api.nvim_create_buf(false, true)

			return {
				action = nil,
				key = nil,
				label = nil,
				render = function(_, pos)
					local win = vim.api.nvim_open_win(buf, false, {
						relative = "win",
						win = self.win,
						bufpos = { pos[1], pos[2] }, -- Align with the start of placeholder text
						col = indent,
						row = 0,
						width = cells.width, -- Use the calculated cell width
						height = cells.height + 1, -- Use the calcula
						style = "minimal",
						focusable = false,
						noautocmd = true,
						zindex = (snacks.config and snacks.config.styles.dashboard.zindex or 50) + 1,
					})

					local hl = opts.hl or "NormalFloat"
					util.wo(win, { winhighlight = "Normal:" .. hl .. ",NormalFloat:" .. hl .. ",FloatBorder:" .. hl })
					util.bo(buf, { filetype = snacks.config.styles.dashboard.bo.filetype or "snacks-dashboard" })

					image.placement.new(buf, source, {})

					local close = vim.schedule_wrap(function()
						if vim.api.nvim_win_is_valid(win) then
							pcall(vim.api.nvim_win_close, win, true)
						end
						if vim.api.nvim_buf_is_valid(buf) then
							pcall(vim.api.nvim_buf_delete, buf, { force = true })
						end
						return true
					end)

					self.on("UpdatePre", close, self.augroup)
					self.on("Closed", close, self.augroup)
				end,
				text = ("\n"):rep(cells.height - 1),
			}
		end
	end
end

return M
