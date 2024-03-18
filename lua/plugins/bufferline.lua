vim.opt.termguicolors = true

require("bufferline").setup{
  options = {
    --使用nvim内置lsp
    diagnostics = "nvim_lsp",
    --左侧让出nvim-tree的位置
    offsets = {{
      filetype = "NeoTree",
      text = "File Exporter",
      highlight = "Directory",
      text_align = "left"
    }}
  }
}
