-- YAML configuration for markview.nvim
-- Covers: property icons, decorations, frontmatter rendering

return {
	enable = true,

	-- Property configurations
	properties = {
		-- Data type defaults
		text = {
			text = "󰗊 ",
			hl = "MarkviewYamlText",
		},
		list = {
			text = "󰝖 ",
			hl = "MarkviewYamlList",
		},
		number = {
			text = " ",
			hl = "MarkviewYamlNumber",
		},
		date = {
			text = "󰃭 ",
			hl = "MarkviewYamlDate",
		},
		datetime = {
			text = "󰥔 ",
			hl = "MarkviewYamlDateTime",
		},
		boolean = {
			text = "󰨙 ",
			hl = "MarkviewYamlBoolean",
		},
		null = {
			text = "󰟢 ",
			hl = "MarkviewYamlNull",
		},

		-- Checkbox type
		checkbox = {
			checked = {
				text = "󰄲 ",
				hl = "MarkviewYamlCheckboxChecked",
			},
			unchecked = {
				text = "󰄱 ",
				hl = "MarkviewYamlCheckboxUnchecked",
			},
		},

		-- Common frontmatter properties
		overrides = {
			-- Document metadata
			{
				name = "title",
				text = "󰓹 ",
				hl = "MarkviewYamlTitle",
				use_types = true,
			},
			{
				name = "author",
				text = "󰀉 ",
				hl = "MarkviewYamlAuthor",
				use_types = true,
			},
			{
				name = "date",
				text = "󰃭 ",
				hl = "MarkviewYamlDate",
				use_types = false,
			},
			{
				name = "modified",
				text = "󰥔 ",
				hl = "MarkviewYamlModified",
				use_types = true,
			},
			{
				name = "created",
				text = "󰃰 ",
				hl = "MarkviewYamlCreated",
				use_types = true,
			},

			-- Classification
			{
				name = "tags",
				text = "󰓹 ",
				hl = "MarkviewYamlTags",
				use_types = true,
				border_top = "╭",
				border_middle = "│",
				border_bottom = "╰",
				border_hl = "MarkviewYamlTagsBorder",
			},
			{
				name = "categories",
				text = "󰉋 ",
				hl = "MarkviewYamlCategories",
				use_types = true,
			},
			{
				name = "aliases",
				text = "󱞫 ",
				hl = "MarkviewYamlAliases",
				use_types = true,
			},
			{
				name = "keywords",
				text = "󰌋 ",
				hl = "MarkviewYamlKeywords",
				use_types = true,
			},

			-- Content description
			{
				name = "description",
				text = "󰋼 ",
				hl = "MarkviewYamlDescription",
				use_types = true,
			},
			{
				name = "summary",
				text = "󰨸 ",
				hl = "MarkviewYamlSummary",
				use_types = true,
			},
			{
				name = "excerpt",
				text = "󰷐 ",
				hl = "MarkviewYamlExcerpt",
				use_types = true,
			},

			-- Publishing
			{
				name = "draft",
				text = "󰏪 ",
				hl = "MarkviewYamlDraft",
				use_types = true,
			},
			{
				name = "published",
				text = "󰆓 ",
				hl = "MarkviewYamlPublished",
				use_types = true,
			},
			{
				name = "publish",
				text = "󰅧 ",
				hl = "MarkviewYamlPublish",
				use_types = true,
			},
			{
				name = "status",
				text = "󰐗 ",
				hl = "MarkviewYamlStatus",
				use_types = true,
			},

			-- Links and references
			{
				name = "permalink",
				text = " ",
				hl = "MarkviewYamlPermalink",
				use_types = true,
			},
			{
				name = "url",
				text = "󰌷 ",
				hl = "MarkviewYamlUrl",
				use_types = true,
			},
			{
				name = "link",
				text = "󰌷 ",
				hl = "MarkviewYamlLink",
				use_types = true,
			},
			{
				name = "source",
				text = "󰘬 ",
				hl = "MarkviewYamlSource",
				use_types = true,
			},

			-- Visual elements
			{
				name = "image",
				text = "󰋫 ",
				hl = "MarkviewYamlImage",
				use_types = true,
			},
			{
				name = "cover",
				text = "󰹉 ",
				hl = "MarkviewYamlCover",
				use_types = true,
			},
			{
				name = "banner",
				text = "󰸉 ",
				hl = "MarkviewYamlBanner",
				use_types = true,
			},
			{
				name = "thumbnail",
				text = "󰋩 ",
				hl = "MarkviewYamlThumbnail",
				use_types = true,
			},
			{
				name = "icon",
				text = "󰀻 ",
				hl = "MarkviewYamlIcon",
				use_types = true,
			},

			-- CSS and styling (for web publishing)
			{
				name = "cssclasses",
				text = "󰌜 ",
				hl = "MarkviewYamlCssClasses",
				use_types = true,
			},
			{
				name = "cssclass",
				text = "󰌜 ",
				hl = "MarkviewYamlCssClass",
				use_types = true,
			},

			-- Layout and template
			{
				name = "layout",
				text = "󰕮 ",
				hl = "MarkviewYamlLayout",
				use_types = true,
			},
			{
				name = "template",
				text = "󰈙 ",
				hl = "MarkviewYamlTemplate",
				use_types = true,
			},
			{
				name = "type",
				text = "󰀘 ",
				hl = "MarkviewYamlType",
				use_types = true,
			},

			-- Localization
			{
				name = "lang",
				text = "󰗊 ",
				hl = "MarkviewYamlLang",
				use_types = true,
			},
			{
				name = "language",
				text = "󰗊 ",
				hl = "MarkviewYamlLanguage",
				use_types = true,
			},

			-- Version control
			{
				name = "version",
				text = "󰓼 ",
				hl = "MarkviewYamlVersion",
				use_types = true,
			},
			{
				name = "revision",
				text = "󰯃 ",
				hl = "MarkviewYamlRevision",
				use_types = true,
			},

			-- Priority and importance
			{
				name = "priority",
				text = "󰚥 ",
				hl = "MarkviewYamlPriority",
				use_types = true,
			},
			{
				name = "importance",
				text = "󰓎 ",
				hl = "MarkviewYamlImportance",
				use_types = true,
			},
			{
				name = "weight",
				text = "󰗊 ",
				hl = "MarkviewYamlWeight",
				use_types = true,
			},

			-- Notes and annotations
			{
				name = "note",
				text = "󰎞 ",
				hl = "MarkviewYamlNote",
				use_types = true,
			},
			{
				name = "notes",
				text = "󰎞 ",
				hl = "MarkviewYamlNotes",
				use_types = true,
			},
			{
				name = "comment",
				text = "󰆈 ",
				hl = "MarkviewYamlComment",
				use_types = true,
			},
			{
				name = "comments",
				text = "󰆈 ",
				hl = "MarkviewYamlComments",
				use_types = true,
			},

			-- Project management
			{
				name = "project",
				text = "󰚔 ",
				hl = "MarkviewYamlProject",
				use_types = true,
			},
			{
				name = "area",
				text = "󰙅 ",
				hl = "MarkviewYamlArea",
				use_types = true,
			},
			{
				name = "context",
				text = "󰋗 ",
				hl = "MarkviewYamlContext",
				use_types = true,
			},

			-- Time tracking
			{
				name = "due",
				text = "󰃰 ",
				hl = "MarkviewYamlDue",
				use_types = true,
			},
			{
				name = "deadline",
				text = "󰃮 ",
				hl = "MarkviewYamlDeadline",
				use_types = true,
			},
			{
				name = "start",
				text = "󰐊 ",
				hl = "MarkviewYamlStart",
				use_types = true,
			},
			{
				name = "end",
				text = "󰐋 ",
				hl = "MarkviewYamlEnd",
				use_types = true,
			},

			-- Relations
			{
				name = "parent",
				text = "󰙅 ",
				hl = "MarkviewYamlParent",
				use_types = true,
			},
			{
				name = "children",
				text = "󰙆 ",
				hl = "MarkviewYamlChildren",
				use_types = true,
			},
			{
				name = "related",
				text = "󰌷 ",
				hl = "MarkviewYamlRelated",
				use_types = true,
			},
			{
				name = "links",
				text = "󰌷 ",
				hl = "MarkviewYamlLinks",
				use_types = true,
			},

			-- Bibliography
			{
				name = "bibliography",
				text = "󰂺 ",
				hl = "MarkviewYamlBibliography",
				use_types = true,
			},
			{
				name = "references",
				text = "󰈙 ",
				hl = "MarkviewYamlReferences",
				use_types = true,
			},
			{
				name = "citation",
				text = "󱆨 ",
				hl = "MarkviewYamlCitation",
				use_types = true,
			},

			-- Academic
			{
				name = "abstract",
				text = "󰨸 ",
				hl = "MarkviewYamlAbstract",
				use_types = true,
			},
			{
				name = "institution",
				text = "󰳋 ",
				hl = "MarkviewYamlInstitution",
				use_types = true,
			},
			{
				name = "journal",
				text = "󰂺 ",
				hl = "MarkviewYamlJournal",
				use_types = true,
			},

			-- Custom properties
			{
				name = "id",
				text = "󰗜 ",
				hl = "MarkviewYamlId",
				use_types = true,
			},
			{
				name = "uuid",
				text = "󰗜 ",
				hl = "MarkviewYamlUuid",
				use_types = true,
			},
			{
				name = "index",
				text = " ",
				hl = "MarkviewYamlIndex",
				use_types = true,
			},
		},
	},

	-- Scope decorations (border guides)
	decorations = {
		enable = true,
		default_border = "│",
		default_border_hl = "MarkviewYamlBorder",
	},
}
