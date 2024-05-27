return {
  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      -- suggested keymap
      { '<leader>wp', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' },
      { '<leader>wid', '<cmd>ImgClipDebug<cr>', desc = 'Image debug info' },
      { '<leader>wic', '<cmd>ImgClipConfig<cr>', desc = 'Image current configuration' },
    },
  },
  {
    'JuanZoran/Trans.nvim',
    event = 'VeryLazy',
    build = function()
      require('Trans').install()
    end,
    keys = {
      { '<leader>wt', '<Cmd>Translate<CR>', desc = '󰊿 Translate' },
      { '<leader>wk', '<Cmd>TransPlay<CR>', desc = ' Auto Play' },
      -- { '<leader>wi', '<Cmd>TranslateInput<CR>', desc = '󰊿 Translate From Input' },
    },
    dependencies = { 'kkharji/sqlite.lua' },
    opts = {
      theme = 'tokyonight',
    },
  },
  -- markdown render
  {
    'MeanderingProgrammer/markdown.nvim',
    -- ft = 'md',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('render-markdown').setup {}
    end,
    keys = {
      { '<leader>wr', '<cmd>RenderMarkdownToggle<cr>', desc = 'Render markdown file switch' },
    },
  },
  -- image render
  {
    'vhyrro/luarocks.nvim',
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { 'magick' },
    },
  },
  {
    '3rd/image.nvim',
    -- ft = 'md',
    dependencies = { 'luarocks.nvim' },
    opts = {
      integrations = {
        markdown = {
          resolve_image_path = function(document_path, image_path, fallback)
            -- Individually handle blog imgs path
            if string.sub(image_path, 1, 1) == '/' then
              local blog_dir = vim.fn.fnamemodify(document_path, ':h:h:h')
              local absolute_path = blog_dir .. '/static' .. image_path
              absolute_path = vim.fn.fnamemodify(absolute_path, ':p')
              return absolute_path
            else
              return fallback(document_path, image_path)
            end
          end,
        },
      },
    },
  },
}
