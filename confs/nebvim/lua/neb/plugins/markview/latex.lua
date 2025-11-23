-- LaTeX configuration for markview.nvim
-- Covers: math blocks, inline math, symbols, operators, fonts, subscripts/superscripts

return {
  enable = true,

  -- Block-level LaTeX ($$...$$)
  blocks = {
    enable = true,
    hl = "MarkviewLatexBlock",
    pad_amount = 1,
    pad_char = " ",
    text = "LaTeX",
    text_hl = "MarkviewLatexBlockLabel",
    text_direction = "right",
  },

  -- Inline LaTeX ($...$)
  inline = {
    enable = true,
    hl = "MarkviewLatexInline",
    corner_left = " ",
    corner_left_hl = "MarkviewLatexInlineCorner",
    corner_right = " ",
    corner_right_hl = "MarkviewLatexInlineCorner",
    padding_left = "",
    padding_left_hl = "MarkviewLatexInline",
    padding_right = "",
    padding_right_hl = "MarkviewLatexInline",
  },

  -- LaTeX operators and commands
  operators = {
    enable = true,
    hl = "MarkviewLatexOperator",

    -- Common operators
    configs = {
      -- Trigonometric functions
      { name = "sin", hl = "MarkviewLatexFunction" },
      { name = "cos", hl = "MarkviewLatexFunction" },
      { name = "tan", hl = "MarkviewLatexFunction" },
      { name = "cot", hl = "MarkviewLatexFunction" },
      { name = "sec", hl = "MarkviewLatexFunction" },
      { name = "csc", hl = "MarkviewLatexFunction" },

      -- Hyperbolic functions
      { name = "sinh", hl = "MarkviewLatexFunction" },
      { name = "cosh", hl = "MarkviewLatexFunction" },
      { name = "tanh", hl = "MarkviewLatexFunction" },

      -- Inverse functions
      { name = "arcsin", hl = "MarkviewLatexFunction" },
      { name = "arccos", hl = "MarkviewLatexFunction" },
      { name = "arctan", hl = "MarkviewLatexFunction" },

      -- Limits and calculus
      { name = "lim", hl = "MarkviewLatexFunction" },
      { name = "limsup", hl = "MarkviewLatexFunction" },
      { name = "liminf", hl = "MarkviewLatexFunction" },
      { name = "sup", hl = "MarkviewLatexFunction" },
      { name = "inf", hl = "MarkviewLatexFunction" },
      { name = "max", hl = "MarkviewLatexFunction" },
      { name = "min", hl = "MarkviewLatexFunction" },

      -- Exponential and logarithmic
      { name = "exp", hl = "MarkviewLatexFunction" },
      { name = "log", hl = "MarkviewLatexFunction" },
      { name = "ln", hl = "MarkviewLatexFunction" },
      { name = "lg", hl = "MarkviewLatexFunction" },

      -- Roots and powers
      { name = "sqrt", hl = "MarkviewLatexFunction" },

      -- Fractions
      { name = "frac", hl = "MarkviewLatexFunction" },

      -- Sums and products
      { name = "sum", hl = "MarkviewLatexFunction" },
      { name = "prod", hl = "MarkviewLatexFunction" },

      -- Integrals
      { name = "int", hl = "MarkviewLatexFunction" },
      { name = "iint", hl = "MarkviewLatexFunction" },
      { name = "iiint", hl = "MarkviewLatexFunction" },
      { name = "oint", hl = "MarkviewLatexFunction" },

      -- Set operations
      { name = "cup", hl = "MarkviewLatexOperator" },
      { name = "cap", hl = "MarkviewLatexOperator" },
      { name = "setminus", hl = "MarkviewLatexOperator" },

      -- Logic
      { name = "forall", hl = "MarkviewLatexOperator" },
      { name = "exists", hl = "MarkviewLatexOperator" },
      { name = "nexists", hl = "MarkviewLatexOperator" },
      { name = "neg", hl = "MarkviewLatexOperator" },
      { name = "land", hl = "MarkviewLatexOperator" },
      { name = "lor", hl = "MarkviewLatexOperator" },

      -- Relations
      { name = "equiv", hl = "MarkviewLatexOperator" },
      { name = "approx", hl = "MarkviewLatexOperator" },
      { name = "cong", hl = "MarkviewLatexOperator" },
      { name = "sim", hl = "MarkviewLatexOperator" },
      { name = "propto", hl = "MarkviewLatexOperator" },

      -- Arrows
      { name = "to", hl = "MarkviewLatexOperator" },
      { name = "rightarrow", hl = "MarkviewLatexOperator" },
      { name = "leftarrow", hl = "MarkviewLatexOperator" },
      { name = "leftrightarrow", hl = "MarkviewLatexOperator" },
      { name = "Rightarrow", hl = "MarkviewLatexOperator" },
      { name = "Leftarrow", hl = "MarkviewLatexOperator" },
      { name = "Leftrightarrow", hl = "MarkviewLatexOperator" },
      { name = "mapsto", hl = "MarkviewLatexOperator" },

      -- Delimiters
      { name = "left", hl = "MarkviewLatexDelimiter" },
      { name = "right", hl = "MarkviewLatexDelimiter" },
      { name = "big", hl = "MarkviewLatexDelimiter" },
      { name = "Big", hl = "MarkviewLatexDelimiter" },
      { name = "bigg", hl = "MarkviewLatexDelimiter" },
      { name = "Bigg", hl = "MarkviewLatexDelimiter" },

      -- Styles
      { name = "text", hl = "MarkviewLatexText" },
      { name = "textit", hl = "MarkviewLatexText" },
      { name = "textbf", hl = "MarkviewLatexText" },
      { name = "textrm", hl = "MarkviewLatexText" },

      -- Miscellaneous
      { name = "vec", hl = "MarkviewLatexFunction" },
      { name = "hat", hl = "MarkviewLatexFunction" },
      { name = "bar", hl = "MarkviewLatexFunction" },
      { name = "dot", hl = "MarkviewLatexFunction" },
      { name = "ddot", hl = "MarkviewLatexFunction" },
      { name = "overline", hl = "MarkviewLatexFunction" },
      { name = "underline", hl = "MarkviewLatexFunction" },
      { name = "overbrace", hl = "MarkviewLatexFunction" },
      { name = "underbrace", hl = "MarkviewLatexFunction" },
      { name = "widetilde", hl = "MarkviewLatexFunction" },
      { name = "widehat", hl = "MarkviewLatexFunction" },

      -- Modular arithmetic
      { name = "mod", hl = "MarkviewLatexFunction" },
      { name = "bmod", hl = "MarkviewLatexFunction" },
      { name = "pmod", hl = "MarkviewLatexFunction" },

      -- Determinants and matrices
      { name = "det", hl = "MarkviewLatexFunction" },
      { name = "dim", hl = "MarkviewLatexFunction" },
      { name = "ker", hl = "MarkviewLatexFunction" },

      -- Probability
      { name = "Pr", hl = "MarkviewLatexFunction" },

      -- Argument
      { name = "arg", hl = "MarkviewLatexFunction" },

      -- GCD
      { name = "gcd", hl = "MarkviewLatexFunction" },

      -- Degree
      { name = "deg", hl = "MarkviewLatexFunction" },

      -- Hom
      { name = "hom", hl = "MarkviewLatexFunction" },
    },
  },

  -- LaTeX symbols
  symbols = {
    enable = true,
    hl = "MarkviewLatexSymbol",

    -- Override specific symbols for better visual representation
    overrides = {
      -- Greek letters (lowercase)
      { symbol = "alpha", hl = "MarkviewLatexGreek" },
      { symbol = "beta", hl = "MarkviewLatexGreek" },
      { symbol = "gamma", hl = "MarkviewLatexGreek" },
      { symbol = "delta", hl = "MarkviewLatexGreek" },
      { symbol = "epsilon", hl = "MarkviewLatexGreek" },
      { symbol = "zeta", hl = "MarkviewLatexGreek" },
      { symbol = "eta", hl = "MarkviewLatexGreek" },
      { symbol = "theta", hl = "MarkviewLatexGreek" },
      { symbol = "iota", hl = "MarkviewLatexGreek" },
      { symbol = "kappa", hl = "MarkviewLatexGreek" },
      { symbol = "lambda", hl = "MarkviewLatexGreek" },
      { symbol = "mu", hl = "MarkviewLatexGreek" },
      { symbol = "nu", hl = "MarkviewLatexGreek" },
      { symbol = "xi", hl = "MarkviewLatexGreek" },
      { symbol = "pi", hl = "MarkviewLatexGreek" },
      { symbol = "rho", hl = "MarkviewLatexGreek" },
      { symbol = "sigma", hl = "MarkviewLatexGreek" },
      { symbol = "tau", hl = "MarkviewLatexGreek" },
      { symbol = "upsilon", hl = "MarkviewLatexGreek" },
      { symbol = "phi", hl = "MarkviewLatexGreek" },
      { symbol = "chi", hl = "MarkviewLatexGreek" },
      { symbol = "psi", hl = "MarkviewLatexGreek" },
      { symbol = "omega", hl = "MarkviewLatexGreek" },

      -- Greek letters (uppercase)
      { symbol = "Gamma", hl = "MarkviewLatexGreek" },
      { symbol = "Delta", hl = "MarkviewLatexGreek" },
      { symbol = "Theta", hl = "MarkviewLatexGreek" },
      { symbol = "Lambda", hl = "MarkviewLatexGreek" },
      { symbol = "Xi", hl = "MarkviewLatexGreek" },
      { symbol = "Pi", hl = "MarkviewLatexGreek" },
      { symbol = "Sigma", hl = "MarkviewLatexGreek" },
      { symbol = "Upsilon", hl = "MarkviewLatexGreek" },
      { symbol = "Phi", hl = "MarkviewLatexGreek" },
      { symbol = "Psi", hl = "MarkviewLatexGreek" },
      { symbol = "Omega", hl = "MarkviewLatexGreek" },

      -- Common mathematical symbols
      { symbol = "infty", hl = "MarkviewLatexSymbol" },
      { symbol = "partial", hl = "MarkviewLatexSymbol" },
      { symbol = "nabla", hl = "MarkviewLatexSymbol" },
      { symbol = "pm", hl = "MarkviewLatexSymbol" },
      { symbol = "mp", hl = "MarkviewLatexSymbol" },
      { symbol = "times", hl = "MarkviewLatexSymbol" },
      { symbol = "div", hl = "MarkviewLatexSymbol" },
      { symbol = "cdot", hl = "MarkviewLatexSymbol" },
      { symbol = "circ", hl = "MarkviewLatexSymbol" },
      { symbol = "bullet", hl = "MarkviewLatexSymbol" },

      -- Set theory
      { symbol = "emptyset", hl = "MarkviewLatexSymbol" },
      { symbol = "in", hl = "MarkviewLatexSymbol" },
      { symbol = "notin", hl = "MarkviewLatexSymbol" },
      { symbol = "subset", hl = "MarkviewLatexSymbol" },
      { symbol = "supset", hl = "MarkviewLatexSymbol" },
      { symbol = "subseteq", hl = "MarkviewLatexSymbol" },
      { symbol = "supseteq", hl = "MarkviewLatexSymbol" },

      -- Common constants
      { symbol = "aleph", hl = "MarkviewLatexSymbol" },
      { symbol = "hbar", hl = "MarkviewLatexSymbol" },
      { symbol = "ell", hl = "MarkviewLatexSymbol" },
    },
  },

  -- Math fonts
  fonts = {
    enable = true,

    -- Bold math
    mathbf = {
      enable = true,
      hl = "MarkviewLatexMathBold",
    },

    -- Calligraphic
    mathcal = {
      enable = true,
      hl = "MarkviewLatexMathCal",
    },

    -- Fraktur
    mathfrak = {
      enable = true,
      hl = "MarkviewLatexMathFrak",
    },

    -- Blackboard bold
    mathbb = {
      enable = true,
      hl = "MarkviewLatexMathBB",
    },

    -- Typewriter
    mathtt = {
      enable = true,
      hl = "MarkviewLatexMathTT",
    },

    -- Sans-serif
    mathsf = {
      enable = true,
      hl = "MarkviewLatexMathSF",
    },

    -- Roman
    mathrm = {
      enable = true,
      hl = "MarkviewLatexMathRM",
    },

    -- Italic
    mathit = {
      enable = true,
      hl = "MarkviewLatexMathIt",
    },
  },

  -- Subscripts
  subscripts = {
    enable = true,
    hl = "MarkviewLatexSubscript",
  },

  -- Superscripts
  superscripts = {
    enable = true,
    hl = "MarkviewLatexSuperscript",
  },

  -- Brackets and delimiters
  brackets = {
    enable = true,
    hl = "MarkviewLatexBracket",
  },
}
