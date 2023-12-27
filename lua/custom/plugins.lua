local plugins = {
  -- Mason lsp's
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",

        "typescript-language-server",
        "eslint-lsp",
        "prettierd",


        "tailwindcss-language-server",

        --"clangd",

        --"pyright",
        --"mypy",
        --"ruff",
        --"black",

        --"rust-analyzer",
      }
    }
  },
  -- ChatGPT ai
  --[[{
    "dreamsofcode-io/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("chatgpt").setup({
        async_api_key_cmd = "echo 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",
      })
    end,
  },]]--
  -- lsp config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- null-ls config
  {
    --"jose-elias-alvarez/null-ls.nvim",
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    --ft={ "go", "python" },
    --ft="go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  -- autoformatting rust
  --[[{
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },]]--
  -- auto tags
  {
    "windwp/nvim-ts-autotag",
    ft = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- eslint for ts and js
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },
  -- formatter for ts and js
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },
  -- go extra tooling features
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  --[[{
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  -- Debugging in go
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },]]--
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      local opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "go"
      }
      return opts
    end,
  }
}

return plugins
