vim.lsp.config["harper"] = {
	cmd = { "harper-ls", "--stdio" },
	filetypes = { "markdown", "markdown.md" },
	root_markers = { ".marksman.toml", ".git" },
	settings = {
		["harper-ls"] = {
			userDictPath = "",
			workspaceDictPath = "",
			fileDictPath = "",
			linters = {
				SpellCheck = true,
				SpelledNumbers = true,
				AnA = true,
				SentenceCapitalization = true,
				UnclosedQuotes = true,
				WrongQuotes = false,
				LongSentences = true,
				RepeatedWords = true,
				Spaces = true,
				Matcher = true,
				CorrectNumberSuffix = true,
			},
			codeActions = {
				ForceStable = false,
			},
			markdown = {
				IgnoreLinkTitle = false,
			},
			diagnosticSeverity = "hint",
			isolateEnglish = false,
			dialect = "American",
			maxFileLength = 120000,
			ignoredLintsPath = "",
			excludePatterns = {},
		},
	},
}
