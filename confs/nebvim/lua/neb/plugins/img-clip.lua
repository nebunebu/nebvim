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
	-- filetypes = {
	--   asciidoc = {
	--     template = 'image::$FILE_PATH[width=80%, alt="$CURSOR"]'
	--   },
	--   html = {
	--     template = '<img src="$FILE_PATH" alt="$CURSOR">'
	--   },
	--   markdown = {
	--     download_images = false,
	--     template = "![$CURSOR]($FILE_PATH)",
	--     url_encode_path = true
	--   },
	--   md = <table 1>,
	--   org = {
	--     template = "#+BEGIN_FIGURE\n[[file:$FILE_PATH]]\n#+CAPTION: $CURSOR\n#+NAME: fig:$LABEL\n#+END_FIGURE\n    "
	--   },
	--   plaintex = <2>{
	--     relative_template_path = false,
	--     template = "\\begin{figure}[h]\n  \\centering\n  \\includegraphics[width=0.8\\textwidth]{$FILE_PATH}\n  \\caption{$CURSOR}\n  \\label{fig:$LABEL}\n\\end{figure}\n    "
	--   },
	--   rmd = <table 1>,
	--   rst = {
	--     template = ".. image:: $FILE_PATH\n   :alt: $CURSOR\n   :width: 80%\n    "
	--   },
	--   tex = <table 2>,
	--   typst = {
	--     template = '#figure(\n  image("$FILE_PATH", width: 80%),\n  caption: [$CURSOR],\n) <fig-$LABEL>\n    '
	--   },
	--   vimwiki = {
	--     download_images = false,
	--     template = "![$CURSOR]($FILE_PATH)",
	--     url_encode_path = true
	--   }
	-- }
})
