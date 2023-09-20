return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'neovim/nvim-lspconfig',
'hrsh7th/cmp-nvim-lsp',
'hrsh7th/cmp-buffer',
'hrsh7th/cmp-path',
'hrsh7th/cmp-cmdline',
'hrsh7th/cmp-vsnip',
'hrsh7th/vim-vsnip',
},
init = function()
    local cmp = require('cmp')

    local border_opts = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      }
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered(border_opts),
            documentation = cmp.config.window.bordered(border_opts),
        },
mapping = {
          ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
          ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ["<S-TAB>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
          ["<TAB>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<CR>"] = cmp.mapping.confirm { select = true},
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp', priority = 1000 },
            { name = 'vsnip', priority = 750},
            { name = 'buffer', priority = 500 },
            { name = 'path', priority = 500 },
        }),
    })

    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'git' },
        }, {{name = 'buffer'},})
    })
    
    cmp.setup.cmdline({'/','?'}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer'}
        }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({{ name = 'path'}, {name = 'cmdline'}}),
    })
end
    }
