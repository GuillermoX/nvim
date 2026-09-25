return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- 1. CABECERA ASCII (Puedes cambiar el texto interno o probar este estilo)
    dashboard.section.header.val = {
      [[                                                     ]],
      [[  ███╗   ██╗███████╗ █████╗ ██╗   ██╗██╗███╗   ███╗  ]],
      [[  ████╗  ██║██╔════╝██╔══██╗██║   ██║██║████╗ ████║  ]],
      [[  ██╔██╗ ██║█████╗  ██║  ██║██║   ██║██║██╔████╔██║  ]],
      [[  ██║╚██╗██║██╔══╝  ██║  ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
      [[  ██║ ╚████║███████╗ █████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
      [[  ╚═╝  ╚═══╝╚══════╝ ╚════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
      [[                                                     ]],
    }

    -- 2. BOTONES DEL MENÚ (Iconos estilizados)
    -- Sintaxis: dashboard.button("TECLA", "ICONO  TEXTO", ":COMANDO<CR>")
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰍉  Find files",       ":Telescope find_files<CR>"),
      dashboard.button("e", "  Open explorer", ":Neotree toggle <CR>"),
      dashboard.button("n", "󰏔  New file",         ":ene <BAR> startinsert<CR>"),
      dashboard.button("r", "󱋡  Recent files",    ":Telescope oldfiles<CR>"),
      dashboard.button("g", "󰈞  Find text (Grep)",   ":Telescope live_grep<CR>"),
      dashboard.button("c", "󰒓  Neovim configuration",  ":e $MYVIMRC<CR>"),
      dashboard.button("u", "󰚰  Update plugins",    ":Lazy<CR>"),
      dashboard.button("q", "󰅚  Exit",                 ":qa<CR>"),
    }

    -- 3. PIE DE PÁGINA (Footer) - Muestra total de plugins y versión de Neovim
    local function footer()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      return "⚡ Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
    end

    dashboard.section.footer.val = footer()

    -- Ajuste de colores y márgenes
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.section.footer.opts.hl = "Comment"
    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end
}
