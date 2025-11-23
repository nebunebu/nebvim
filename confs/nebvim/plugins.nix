{ pkgs, lib, ... }:
let
  treesitter-kulala-http-grammar = pkgs.stdenv.mkDerivation {
    pname = "kulala_http-grammar";
    version = "5.3.3";
    src = pkgs.fetchFromGitHub {
      owner = "mistweaverco";
      repo = "kulala.nvim";
      rev = "902fc21e8a3fee7ccace37784879327baa6d1ece";
      hash = "sha256-whQpwZMEvD62lgCrnNryrEvfSwLJJ+IqVCywTq78Vf8=";
    };

    buildInputs = [ pkgs.tree-sitter ];

    buildPhase = ''
      cd lua/tree-sitter
      HOME=$(pwd) ${pkgs.tree-sitter}/bin/tree-sitter build -o kulala_http.so
    '';

    installPhase = ''
      mkdir -p $out/parser
      mv kulala_http.so $out/parser/
    '';
  };

  nvim-treesitter-with-kulala =
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars.overrideAttrs
      (finalAttrs: rec {
        postInstall = finalAttrs.postInstall or "" + ''
          mkdir -p $out/parser
          ln -s ${treesitter-kulala-http-grammar}/parser/kulala_http.so $out/parser/
        '';
      });

  vimPlugins = lib.lz.fromVimPlugins [
    "urlview-nvim"
    "triptych-nvim"
    "cellular-automaton-nvim"
    "helpview-nvim"
    "nvim-dap-ui"
    "nvim-nio"
    "grug-far-nvim"
    "oil-nvim"
    "rustaceanvim"
    "nui-nvim"
    "gitsigns-nvim"
    "outline-nvim"
    "fidget-nvim"
    "fortune-nvim"
    "nvim-highlight-colors"
    "comment-nvim"
    "lz-n"
    "rose-pine"
    "which-key-nvim"
    "vim-tmux-navigator"
    "lualine-nvim"
    "barbecue-nvim"
    "blink-cmp"
    "conform-nvim"
    "dressing-nvim"
    "img-clip-nvim"
    "indent-blankline-nvim"
    "luasnip"
    "marks-nvim"
    "markview-nvim"
    "nerdy-nvim"
    "rainbow-delimiters-nvim"
    "nvim-autopairs"
    "nvim-lint"
    "nvim-navic"
    "nvim-surround"
    "nvim-treesitter-endwise"
    "nvim-web-devicons"
    "one-small-step-for-vimkind"
    "debugmaster-nvim"
    "plenary-nvim"
    "snacks-nvim"
    "spellwarn-nvim"
    "tiny-code-action-nvim"
    "tiny-devicons-auto-colors-nvim"
    "tiny-inline-diagnostic-nvim"
    "todo-comments-nvim"
    "kulala-nvim"
    "neotest"
    "neotest-python"
    "neotest-plenary"
    "neotest-go"
    "neotest-haskell"
    "neotest-bash"
    "neotest-busted"
  ];

  extraPlugins = lib.lz.fromExtraVimPlugins [
    "direnv-nvim"
  ];

  customPlugins = [
    (lib.lz.build {
      pname = "neowiki-nvim";
      version = "unstable-2025-06-27";
      src = pkgs.fetchFromGitHub {
        owner = "echaya";
        repo = "neowiki.nvim";
        rev = "411766d31c76dc2613fca6ec45d025bac7ee1ac4";
        hash = "sha256-soMQN7oDx9HVS/crNcu6ilYoOtGXP/aMk7NfPYUjsXg=";
      };
    })
    (lib.lz.build {
      pname = "snipbrowzurr-nvim";
      version = "stable-2024-10-16";
      src = pkgs.fetchFromGitHub {
        owner = "blaze-d83";
        repo = "snipbrowzurr.nvim";
        rev = "b32aa902a8b9fd2adf0b11215b9a1523baba4526";
        hash = "sha256-aDd2bpnWYEOvgpKn+wn0tdf9jM8mVyAOwE0q2sH85Cw=";
      };
    })
  ];

  optionalPlugins = vimPlugins ++ extraPlugins ++ customPlugins ++ [ nvim-treesitter-with-kulala ];
in
lib.lz.mkOptional optionalPlugins
