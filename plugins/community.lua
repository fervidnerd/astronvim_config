return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  {
    import = "astrocommunity.project.project-nvim",
    opts = {
      detection_methods = { "pattern", "manual" },
      patterns = { "go.mod", "package.json" },
      silent_chdir = false,
    },
  },
}
