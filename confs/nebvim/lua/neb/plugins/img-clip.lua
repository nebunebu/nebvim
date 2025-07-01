return {
	"img-clip",
	cmd = "PasteImage",
	after = function()
		require("img-clip").setup({
			custom = {},
			default = {
				copy_images = false,
				dir_path = "assets",
				download_images = true,
				drag_and_drop = {
					enabled = true,
					insert_mode = false,
				},
				embed_image_as_base64 = false,
				extension = "png",
				file_name = "%Y-%m-%d-%H-%M-%S",
				insert_mode_after_paste = true,
				max_base64_size = 10,
				process_cmd = "",
				prompt_for_file_name = true,
				relative_template_path = true,
				relative_to_current_file = false,
				show_dir_path_in_prompt = false,
				template = "$FILE_PATH",
				url_encode_path = false,
				use_absolute_path = false,
				use_cursor_in_template = true,
			},
			dirs = {},
			files = {},
		})
	end,
}
