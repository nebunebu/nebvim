local M = {}

function M.apply_patch()
	-- Ensure snacks and necessary submodules are loaded/available
	local status_ok_snacks, snacks = pcall(require, "snacks")
	local status_ok_dashboard, dashboard = pcall(require, "snacks.dashboard")
	local status_ok_util, util = pcall(require, "snacks.util")
	local status_ok_image, image = pcall(require, "snacks.image")

	if not (status_ok_snacks and status_ok_dashboard and status_ok_util and status_ok_image) then
		vim.notify("Failed to load required snacks modules for patching image section", vim.log.levels.WARN)
		return -- Stop if modules aren't ready
	end

	-- vim.notify("Patching snacks.nvim dashboard with custom image section...", vim.log.levels.INFO)

	---@diagnostic disable-next-line: duplicate-set-field
	---@param opts {source:(string|fun(): string), height?:number, width?:number, indent?:number, hl?:string, align?: "left"|"center"|"right"}|snacks.dashboard.Item
	---@return snacks.dashboard.Gen
	dashboard.sections.image = function(opts) -- Directly assign the new function
		return function(self) -- The generator function expected by the dashboard system
			-- Resolve source if it's a function
			local source = type(opts.source) == "function" and opts.source() or opts.source
			if not source then
				vim.notify("Dashboard image section: 'source' is missing or returned nil.", vim.log.levels.WARN)
				return nil -- Return nil if source is invalid to prevent errors
			end

			local height = opts.height or 10 -- Default height if not specified
			local indent = opts.indent or 0 -- Default indent

			-- Use the dashboard window's width as the reference for alignment calculations.
			-- Use self.win which should be the dashboard window handle.
			local dashboard_total_width = self.win and vim.api.nvim_win_get_width(self.win) or vim.fn.winwidth(0)

			-- Determine the actual width the image floating window should have.
			-- If opts.width is specified, use that, otherwise use the available space minus indents.
			local available_content_width = dashboard_total_width - (2 * indent)
			available_content_width = math.max(1, available_content_width) -- Ensure at least 1

			local image_render_width = opts.width or available_content_width
			-- Ensure the specified/calculated width doesn't exceed the available space
			image_render_width = math.min(image_render_width, available_content_width)
			image_render_width = math.max(1, image_render_width) -- Ensure at least 1

			local buf = vim.api.nvim_create_buf(false, true)

			return {
				-- Set alignment hint for the placeholder text layout (less critical now for image positioning)
				align = opts.align or "left",
				-- Placeholder text determines the vertical space, height must be > 0
				text = ("\
"):rep(math.max(0, height - 1)),
				-- Image doesn't typically have direct actions/keys
				action = nil,
				key = nil,
				label = nil,
				-- The core logic: render the image in a separate floating window
				render = function(_, pos)
					-- pos[1] = row (0-indexed from buffer top where placeholder starts)
					-- pos[2] = col (0-indexed from buffer left edge where placeholder starts)

					-- Base row calculation (0-indexed)
					local win_row = pos[1]

					-- Calculate the target column for the floating window based on alignment
					local win_col
					local align = opts.align or "left"

					if align == "center" then
						-- Calculate the starting column to center the 'image_render_width'
						-- within the 'available_content_width', then add the left 'indent'.
						local center_offset = math.floor((available_content_width - image_render_width) / 2)
						win_col = indent + center_offset
					elseif align == "right" then
						-- Align the right edge of the image window with the right edge of the content area.
						-- Right edge of content area = indent + available_content_width = dashboard_total_width - indent
						-- win_col + image_render_width = dashboard_total_width - indent
						win_col = dashboard_total_width - indent - image_render_width
					else -- Default: "left" alignment
						-- Align the left edge of the image window with the left edge of the content area.
						win_col = indent
					end

					-- Ensure the calculated column isn't negative or pushing the window off-screen right
					-- (though the min check on image_render_width should mostly prevent the latter)
					win_col = math.max(0, win_col)
					win_col = math.min(win_col, dashboard_total_width - image_render_width) -- Prevent going past right edge
					win_col = math.max(0, win_col) -- Re-check lower bound after potential adjustment

					-- Create the floating window for the image
					local win = vim.api.nvim_open_win(buf, false, {
						relative = "win", -- Relative to the main dashboard window
						win = self.win, -- Anchor to the dashboard window
						bufpos = { win_row, win_col }, -- Position using CALCULATED row/col
						width = image_render_width, -- Use CALCULATED width
						height = height,
						style = "minimal",
						focusable = false,
						noautocmd = true,
						zindex = (snacks.config and snacks.config.styles.dashboard.zindex or 50) + 1,
					})

					-- Apply highlighting and buffer settings
					local hl = opts.hl or "NormalFloat" -- Use specified highlight or default
					util.wo(win, { winhighlight = "Normal:" .. hl .. ",NormalFloat:" .. hl .. ",FloatBorder:" .. hl })
					util.bo(buf, { filetype = snacks.config.styles.dashboard.bo.filetype or "snacks-dashboard" })

					-- Use Snacks internal image placement function
					image.placement.new(buf, source, {})

					-- Cleanup function to close window and delete buffer
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
			}
		end
	end
	vim.notify("snacks.nvim dashboard image section patched successfully.", vim.log.levels.INFO)
end

return M
-- local M = {}
--
-- function M.apply_patch()
-- 	-- Ensure snacks and necessary submodules are loaded/available
-- 	local status_ok_snacks, snacks = pcall(require, "snacks")
-- 	local status_ok_dashboard, dashboard = pcall(require, "snacks.dashboard")
-- 	local status_ok_util, util = pcall(require, "snacks.util")
-- 	local status_ok_image, image = pcall(require, "snacks.image")
--
-- 	if not (status_ok_snacks and status_ok_dashboard and status_ok_util and status_ok_image) then
-- 		vim.notify("Failed to load required snacks modules for patching image section", vim.log.levels.WARN)
-- 		return -- Stop if modules aren't ready
-- 	end
--
-- 	-- vim.notify("Patching snacks.nvim dashboard with custom image section...", vim.log.levels.INFO)
--
-- 	---@diagnostic disable-next-line: duplicate-set-field
-- 	---@param opts {source:(string|fun(): string), height?:number, width?:number, indent?:number, hl?:string, align?: "left"|"center"|"right"}|snacks.dashboard.Item
-- 	---@return snacks.dashboard.Gen
-- 	dashboard.sections.image = function(opts) -- Directly assign the new function
-- 		return function(self) -- The generator function expected by the dashboard system
-- 			-- Resolve source if it's a function
-- 			local source = type(opts.source) == "function" and opts.source() or opts.source
-- 			if not source then
-- 				vim.notify("Dashboard image section: 'source' is missing or returned nil.", vim.log.levels.WARN)
-- 				return nil -- Return nil if source is invalid to prevent errors
-- 			end
--
-- 			local height = opts.height or 10 -- Default height if not specified
-- 			-- Calculate width, considering dashboard options and potential indent
-- 			-- Use the main dashboard's configured width as the reference for centering.
-- 			local dashboard_item_width = self.opts and self.opts.width or vim.fn.winwidth(0)
-- 			local image_win_width = opts.width or (dashboard_item_width - (opts.indent or 0))
-- 			-- Ensure width is at least 1
-- 			image_win_width = math.max(1, image_win_width)
--
-- 			local buf = vim.api.nvim_create_buf(false, true)
--
-- 			return {
-- 				-- Set alignment for the placeholder text layout within the main dashboard buffer
-- 				align = opts.align or "left", -- Default to left if not specified
-- 				-- The placeholder text itself doesn't need alignment, but D:format uses item.align
-- 				text = ("\n"):rep(height - 1),
-- 				-- Image doesn't typically have direct actions/keys
-- 				action = nil,
-- 				key = nil,
-- 				label = nil,
-- 				-- The core logic: render the image in a separate floating window
-- 				render = function(_, pos)
-- 					-- pos[1] = row (0-indexed from buffer top)
-- 					-- pos[2] = col (0-indexed from buffer left edge) where the placeholder text starts
--
-- 					-- Base row calculation (0-indexed)
-- 					local win_row = pos[1]
--
-- 					-- Calculate column based on alignment
-- 					local win_col
-- 					local base_col = pos[2] -- Starting column calculated by D:format based on item.align
--
-- 					if opts.align == "center" then
-- 						-- For center alignment, the placeholder starts near the center (base_col).
-- 						-- We want to position the image window so *its* center aligns with base_col.
-- 						-- So, shift the window's left edge leftwards by half its width.
-- 						win_col = base_col - math.floor(image_win_width / 2)
-- 					elseif opts.align == "right" then
-- 						-- For right alignment, the placeholder starts near the right edge (base_col).
-- 						-- We want the image window's right edge to align with base_col.
-- 						-- So, shift the window's left edge leftwards by its full width.
-- 						win_col = base_col - image_win_width
-- 					else -- Default: "left" alignment
-- 						-- For left alignment, the placeholder starts at base_col.
-- 						-- We position the image window starting at base_col, respecting indent.
-- 						win_col = base_col + (opts.indent or 0)
-- 					end
--
-- 					-- Ensure the calculated column isn't negative
-- 					win_col = math.max(0, win_col)
--
-- 					-- Create the floating window for the image
-- 					local win = vim.api.nvim_open_win(buf, false, {
-- 						relative = "win", -- Relative to the main dashboard window
-- 						win = self.win, -- Anchor to the dashboard window
-- 						bufpos = { win_row, win_col }, -- Position using calculated row/col
-- 						width = image_win_width,
-- 						height = height,
-- 						style = "minimal",
-- 						focusable = false,
-- 						noautocmd = true,
-- 						zindex = (snacks.config and snacks.config.styles.dashboard.zindex or 50) + 1,
-- 					})
--
-- 					-- Apply highlighting and buffer settings
-- 					local hl = opts.hl or "NormalFloat" -- Use specified highlight or default
-- 					util.wo(win, { winhighlight = "Normal:" .. hl .. ",NormalFloat:" .. hl .. ",FloatBorder:" .. hl })
-- 					util.bo(buf, { filetype = snacks.config.styles.dashboard.bo.filetype or "snacks-dashboard" })
--
-- 					-- Use Snacks internal image placement function
-- 					-- Ensure the image module is correctly referenced
-- 					image.placement.new(buf, source, {})
--
-- 					-- Cleanup function to close window and delete buffer
-- 					local close = vim.schedule_wrap(function()
-- 						if vim.api.nvim_win_is_valid(win) then
-- 							pcall(vim.api.nvim_win_close, win, true)
-- 						end
-- 						if vim.api.nvim_buf_is_valid(buf) then
-- 							pcall(vim.api.nvim_buf_delete, buf, { force = true })
-- 						end
-- 						return true
-- 					end)
--
-- 					self.on("UpdatePre", close, self.augroup)
-- 					self.on("Closed", close, self.augroup)
-- 				end,
-- 			}
-- 		end
-- 	end
-- end
--
-- return M
