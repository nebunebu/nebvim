(heading) @markup.heading

(h1) @markup.heading.1
(h2) @markup.heading.2
(h3) @markup.heading.3
(h4) @markup.heading.4
(h5) @markup.heading.5
(h6) @markup.heading.6

(wikilink) @markup.link
(wikilink (linktarget) @markup.link.url)
(wikilink (linklabel) @markup.link.label)

(extlink) @markup.link
(extlink (url) @markup.link.url)
(extlink (linklabel) @markup.link.label)

(template) @markup.italic
(template (templatename) @function)
(templateparam (templatekey) @variable.parameter)

(parameter) @markup.italic
(parameter (paramname) @variable)

(htmltag) @tag
(tagname) @tag

(htmlentity) @string.special

(comment) @comment
