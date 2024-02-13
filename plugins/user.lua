return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      {
        "<leader>D",
        "<cmd>TodoTelescope<cr>",
        desc = "Open TODOs in Telescope",
      },
    },
  },
  { "hrsh7th/cmp-cmdline", dependencies = { "hrsh7th/cmp-buffer" } },
  {
    "Exafunction/codeium.vim",
    event = "Bufenter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
    end,
  },
  {
    "leoluz/nvim-dap-go",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function() require("dap-go").setup() end,
    keys = {
      {
        "<leader>Td",
        "<cmd>lua require('dap-go').debug_test()<cr>",
        desc = "Debug Test",
      },
      {
        "<leader>Tf",
        "<cmd>lua require('dap-go').debug_last_test()<cr>",
        desc = "Debug Last Test",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
    },
    opts = function()
      return {
        adapters = {
          require "neotest-go",
        },
      }
    end,
    config = function(_, opts)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup(opts)
    end,
    keys = {
      { "<leader>T", "", desc = "Run Tests" },
      {
        "<leader>Tt",
        "<cmd>lua require('neotest').run.run()<cr>",
        desc = "Run Current Test",
      },
      {
        "<leader>TA",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%:p:h'))<cr>",
        desc = "Run All Tests",
      },
      {
        "<leader>Tf",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
        desc = "Test Current File",
      },
      {
        "<leader>Ts",
        "<cmd>lua require('neotest').summary.toggle()<cr>",
        desc = "Toggle Summary",
      },
      {
        "<leader>Tj",
        "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>",
        desc = "Next Failed Test",
      },
      {
        "<leader>TJ",
        "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>",
        desc = "Previous Failed Test",
      },
      {
        "<leader>Tn",
        "<cmd>lua require('neotest').jump.next({ status = 'running' })<cr>",
        desc = "Next Running Test",
      },
      {
        "<leader>TN",
        "<cmd>lua require('neotest').jump.prev({ status = 'running' })<cr>",
        desc = "Previous Running Test",
      },
      {
        "<leader>Tp",
        "<cmd>lua require('neotest').jump.next({ status = 'passed' })<cr>",
        desc = "Next Passed Test",
      },
      {
        "<leader>TP",
        "<cmd>lua require('neotest').jump.prev({ status = 'passed' })<cr>",
        desc = "Previous Passed Test",
      },
      {
        "<leader>To",
        "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>",
        desc = "Open Test Output",
      },
      {
        "<leader>TO",
        "<cmd>lua require('neotest').output_panel.toggle({ enter = true, auto_close = true })<cr>",
        desc = "Toggle Test Output Panel",
      },
      {
        "<leader>Tl",
        "<cmd>lua require('neotest').run.run_last()<cr>",
        desc = "Run Last Test",
      },
      {
        "<leader>Te",
        "<cmd>lua require('neotest').run.stop()<cr>",
        desc = "Stop Test",
      },
      {
        "<leader>Ta",
        "<cmd>lua require('neotest').run.attach()<cr>",
        desc = "Attach Test",
      },
    },
  },
}
