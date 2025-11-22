--[[
  Nix-specific snippets

  Usage:
    These snippets are only available in Nix files (.nix)

  Examples:
    - "let" → let-in expression
    - "pkg" → package derivation
    - "shell" → shell.nix template
    - "flake" → flake.nix template
--]]

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
	-- Let-in expression
	s(
		"let",
		fmt(
			[[
		let
		  {} = {};
		in
		{}
	]],
			{
				i(1, "name"),
				i(2, "value"),
				i(3, "expression"),
			}
		)
	),

	-- With expression
	s(
		"with",
		fmt(
			[[
		with {}; {}
	]],
			{
				i(1, "pkgs"),
				i(2, "expression"),
			}
		)
	),

	-- Attribute set
	s(
		"attr",
		fmt(
			[[
		{{
		  {} = {};
		}}
	]],
			{
				i(1, "name"),
				i(2, "value"),
			}
		)
	),

	-- Function definition
	s(
		"func",
		fmt(
			[[
		{}: {}
	]],
			{
				i(1, "args"),
				i(2, "body"),
			}
		)
	),

	-- Function with @args
	s(
		"funca",
		fmt(
			[[
		{{ {} }}@{}: {}
	]],
			{
				i(1, "arg1, arg2"),
				i(2, "args"),
				i(3, "body"),
			}
		)
	),

	-- Package derivation
	s(
		"pkg",
		fmt(
			[[
		stdenv.mkDerivation {{
		  pname = "{}";
		  version = "{}";

		  src = fetchFromGitHub {{
		    owner = "{}";
		    repo = "{}";
		    rev = "{}";
		    hash = "{}";
		  }};

		  {}
		}}
	]],
			{
				i(1, "package-name"),
				i(2, "version"),
				i(3, "owner"),
				i(4, "repo"),
				i(5, "rev"),
				i(6, "hash"),
				i(7, "# build inputs, phases, etc."),
			}
		)
	),

	-- shell.nix template
	s(
		"shell",
		fmt(
			[[
		{{ pkgs ? import <nixpkgs> {{}} }}:

		pkgs.mkShell {{
		  buildInputs = with pkgs; [
		    {}
		  ];

		  shellHook = ''
		    {}
		  '';
		}}
	]],
			{
				i(1, "# packages"),
				i(2, "# initialization commands"),
			}
		)
	),

	-- flake.nix template
	s(
		"flake",
		fmt(
			[[
		{{
		  description = "{}";

		  inputs = {{
		    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		    {}
		  }};

		  outputs = {{ self, nixpkgs, ... }}@inputs: {{
		    {}
		  }};
		}}
	]],
			{
				i(1, "Flake description"),
				i(2, "# additional inputs"),
				i(3, "# outputs"),
			}
		)
	),

	-- Flake package output
	s(
		"flakepkg",
		fmt(
			[[
		packages.{}.default = pkgs.{}({});
	]],
			{
				c(1, {
					t("x86_64-linux"),
					t("aarch64-linux"),
					t("x86_64-darwin"),
					t("aarch64-darwin"),
				}),
				i(2, "callPackage"),
				i(3, "./default.nix"),
			}
		)
	),

	-- Overlay
	s(
		"overlay",
		fmt(
			[[
		final: prev: {{
		  {} = prev.{}.overrideAttrs (oldAttrs: {{
		    {}
		  }});
		}}
	]],
			{
				i(1, "package"),
				rep(1),
				i(2, "# overrides"),
			}
		)
	),

	-- NixOS module
	s(
		"module",
		fmt(
			[[
		{{ config, lib, pkgs, ... }}:

		with lib;

		{{
		  options.{} = {{
		    enable = mkEnableOption "{}";
		    {}
		  }};

		  config = mkIf config.{}.enable {{
		    {}
		  }};
		}}
	]],
			{
				i(1, "services.myservice"),
				i(2, "my service"),
				i(3, "# additional options"),
				rep(1),
				i(4, "# configuration"),
			}
		)
	),

	-- mkOption
	s(
		"mkopt",
		fmt(
			[[
		{} = mkOption {{
		  type = types.{};
		  default = {};
		  description = "{}";
		}};
	]],
			{
				i(1, "option"),
				c(2, {
					t("str"),
					t("int"),
					t("bool"),
					t("listOf str"),
					t("attrsOf str"),
					t("path"),
					t("package"),
				}),
				i(3, "default-value"),
				i(4, "Option description"),
			}
		)
	),

	-- fetchFromGitHub
	s(
		"fetch",
		fmt(
			[[
		fetchFromGitHub {{
		  owner = "{}";
		  repo = "{}";
		  rev = "{}";
		  hash = "{}";
		}}
	]],
			{
				i(1, "owner"),
				i(2, "repo"),
				i(3, "rev"),
				i(4, "hash"),
			}
		)
	),

	-- Import
	s(
		"import",
		fmt(
			[[
		import {} {{}}
	]],
			{
				i(1, "./path.nix"),
			}
		)
	),

	-- Inherit
	s(
		"inh",
		fmt(
			[[
		inherit ({}) {};
	]],
			{
				i(1, "pkgs"),
				i(2, "stdenv lib"),
			}
		)
	),

	-- buildInputs
	s(
		"buildinputs",
		fmt(
			[[
		buildInputs = with pkgs; [
		  {}
		];
	]],
			{
				i(1, "# packages"),
			}
		)
	),

	-- nativeBuildInputs
	s(
		"nativebuildinputs",
		fmt(
			[[
		nativeBuildInputs = with pkgs; [
		  {}
		];
	]],
			{
				i(1, "# packages"),
			}
		)
	),
}
