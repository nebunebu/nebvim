{ pkgs, ... }:
{
  inherit (pkgs)
    vscode-langservers-extracted# jsonls
    jq-lsp# jqls
    yaml-language-server# yamlls
    ;
}
