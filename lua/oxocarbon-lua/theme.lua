local extend_with_attributes = function(orig, attrs)
  if not attrs then
    return orig
  end

  for _, attr in ipairs(attrs) do
    orig[attr] = 3
  end
  return orig
end

local conditional_bg = function(arg)
  if vim.g.oxocarbon_lua_transparent then
    return 'none'
  else
    return arg
  end
end

local Theme = {}

Theme.set_terminal_colors = function (colors)
  if vim.g.oxocarbon_lua_keep_terminal then
    return
  end

  vim.api.nvim_set_var('terminal_color_background', colors[3])
  vim.api.nvim_set_var('terminal_color_foreground', colors[9])

  for x = 0,15 do
    vim.api.nvim_set_var('terminal_color_' .. x, colors[x + 1])
  end
end


Theme.set_general_highlights = function(colors)
  local highlight = function(name, fg, bg, attrs)
    local fg_color = colors[fg]
    local bg_color = colors[bg]

    vim.api.nvim_set_hl(
      0,
      name,
      extend_with_attributes(
        {
          fg = fg_color,
          bg = bg_color,
        },
        attrs
      )
    )
  end

  local none = 1

  local conditional_italic = vim.g.oxocarbon_lua_disable_italic and nil or { 'italic' }

  -- editor
  highlight('ColorColumn', none, 4)
  highlight('Cursor', 3, 9)
  highlight('CursorLine', none, 4)
  highlight('CursorColumn', none, 4)
  highlight('CursorLineNr', 9, conditional_bg(none))
  highlight('QuickFixLine', none, 4)
  highlight('Error', 9, 38)
  highlight('LineNr', 6, conditional_bg(3))
  highlight('NonText', 5, conditional_bg(none))
  highlight('Normal', 9, conditional_bg(3))
  highlight('Pmenu', 9, 4)
  highlight('PmenuSbar', 9, 4)
  highlight('PmenuSel', 35, 5)
  highlight('PmenuThumb', 35, 5)
  highlight('SpecialKey', 6, none)
  highlight('Visual', none, 5)
  highlight('VisualNOS', none, 5)
  highlight('TooLong', none, 5)
  highlight('Debug', 33, none)
  highlight('Macro', 36, none)
  highlight('MatchParen', none, 5, {'underline'})
  highlight('Bold', none, none, {'bold'})
  highlight('Italic', none, none, {'italic'})
  highlight('Underlined', none, none, {'underline'})

  -- diagnostics
  highlight('DiagnosticWarn', 28, none)
  highlight('DiagnosticError', 22, none)
  highlight('DiagnosticInfo', 38, none)
  highlight('DiagnosticHint', 35, none)
  highlight('DiagnosticUnderlineWarn', 28, none, {'undercurl'})
  highlight('DiagnosticUnderlineError', 22, none, {'undercurl'})
  highlight('DiagnosticUnderlineInfo', 38, none, {'undercurl'})
  highlight('DiagnosticUnderlineHint', 35, none, {'undercurl'})

  -- lsp
  highlight('LspReferenceText', none, 6)
  highlight('LspReferenceread', none, 6)
  highlight('LspReferenceWrite', none, 6)
  highlight('LspSignatureActiveParameter', 35, none)

  -- gutter
  highlight('Folded', 6, conditional_bg(4))
  highlight('FoldColumn', 6, conditional_bg(3))
  highlight('SignColumn', 4, conditional_bg(3))

  -- navigation
  highlight('Directory', 35, none)

  -- prompts
  highlight('EndOfBuffer', 3, none)
  highlight('ErrorMsg', 9, 38)
  highlight('ModeMsg', 9, none)
  highlight('MoreMsg', 35, none)
  highlight('Question', 9, none)
  highlight('Substitute', 9, none)
  highlight('WarningMsg', 3, 33)
  highlight('WildMenu', 35, 4)

  -- search
  highlight('IncSearch', 5, 23)
  highlight('Search', 4, 40)

  -- tabs
  highlight('TabLine', 9, 3)
  highlight('TabLineFill', 9, 3)
  highlight('TabLineSel', 35, 6)

  -- window
  highlight('Title', 9, none)
  highlight('VertSplit', 4, 3)

  -- regular syntax
  highlight('Boolean', 19, none)
  highlight('Character', 21, none)
  highlight('Comment', 6, none)
  highlight('Conceal', none, none)
  highlight('Conditional', 19, none)
  highlight('Constant', 9, none)
  highlight('Decorator', 23, none)
  highlight('Define', 19, none)
  highlight('Delimeter', 11, none)
  highlight('Exception', 19, none)
  highlight('Float', 40, none)
  highlight('Function', 35, none)
  highlight('Identifier', 9, none)
  highlight('Include', 19, none)
  highlight('Keyword', 19, none)
  highlight('Label', 19, none)
  highlight('Number', 40, none)
  highlight('Operator', 19, none)
  highlight('PreProc', 19, none)
  highlight('Repeat', 19, none)
  highlight('Special', 39, none)
  highlight('SpecialChar', 39, none)
  highlight('SpecialComment', 35, none)
  highlight('Statement', 19, none)
  highlight('StorageClass', 19, none)
  highlight('String', 21, none)
  highlight('Structure', 19, none)
  highlight('Tag', 9, none)
  highlight('Todo', 33, none)
  highlight('Type', 19, none)
  highlight('Typedef', 19, none)

  -- treesitter
  highlight('@annotation', 23, none)
  highlight('@attribute', 40, none)
  highlight('@boolean', 19, none)
  highlight('@character', 21, none)
  highlight('@constructor', 19, none)
  highlight('@conditional', 19, none)
  highlight('@constant', 21, none)
  highlight('@const.builtin', 36, none)
  highlight('@const.macro', 8, none)
  highlight('@error', 38, none)
  highlight('@exception', 40, none)
  highlight('@field', 9, none)
  highlight('@float', 40, none)
  highlight('@func.builtin', 23, none)
  highlight('@func.macro', 36, none)
  highlight('@include', 19, none)
  highlight('@keyword', 19, none)
  highlight('@keyword.function', 35, none)
  highlight('@keyword.operator', 35, none)
  highlight('@label', 40, none)
  highlight('@method', 36, none)
  highlight('@namespace', 9, none)
  highlight('@number', 40, none)
  highlight('@operator', 19, none)
  highlight('@parameter', 9, none)
  highlight('@parameter.reference', 9, none)
  highlight('@property', 22, none)
  highlight('@punct.delimiter', 35, none)
  highlight('@punct.bracket', 35, none)
  highlight('@punct.special', 35, none)
  highlight('@repeat', 19, none)
  highlight('@string', 21, none)
  highlight('@string.regex', 36, none)
  highlight('@string.escape', 40, none)
  highlight('@tag', 9, none)
  highlight('@tag.delimiter', 40, none)
  highlight('@text', 9, none)
  highlight('@title', 22, none)
  highlight('@literal', 9, none)
  highlight('@type', 19, none)
  highlight('@type.builtin', 9, none)
  highlight('@variable', 9, none)
  highlight('@variable.builtin', 9, none)
  highlight('@strong', none, none, { 'bold' })
  highlight('@comment', 6, none, conditional_italic)
  highlight('@function', 23, none, { 'bold' })
  highlight('@symbol', 40, none, { 'bold' })
  highlight('@emphasis', 22, none, { 'bold' })
  highlight('@underline', 22, none, { 'underline' })
  highlight('@strike', 22, none, { 'strikethrough' })
  highlight('@uri', 21, none, { 'underline' })
  highlight('@current.scope', none, none, { 'bold' })
  highlight('TreesitterContext', none, 4)

  -- neovim
  highlight('NvimInternalError', 3, 35)
  highlight('NormalFloat', 10, 2)
  highlight('FloatBorder', 6, none)
  highlight('NormalNC', 10, 3)
  highlight('TermCursor', 3, 9)
  highlight('TermCursorNC', 3, 9)

  -- statusline/winbar
  highlight('StatusLine', 6, 3)
  highlight('StatusLineNC', 5, 3)
  highlight('StatusReplace', 3, 35)
  highlight('StatusInsert', 3, 23)
  highlight('StatusVisual', 3, 21)
  highlight('StatusTerminal', 3, 38)
  highlight('StatusLineDiagnosticWarn', 21, 3, {'bold'})
  highlight('StatusLineDiagnosticError', 35, 3, {'bold'})
  highlight('WinBar', 7, 3, {'bold'})
  highlight('StatusPosition', 7, 3, {'bold'})
  highlight('StatusNormal', 7, 3, {'underline'})
  highlight('StatusCommand', 7, 3, {'underline'})

  -- telescope
  if vim.g.oxocarbon_lua_alternative_telescope then
    highlight('TelescopeBorder', 6, none)
    highlight('TelescopePromptNormal', 10, none)
    highlight('TelescopePromptPrefix', 36, none)
    highlight('TelescopeNormal', 9, none)
    highlight('TelescopePreviewTitle', 8, none)
    highlight('TelescopePromptTitle', 8, none)
    highlight('TelescopeResultsTitle', 8, none)
    highlight('TelescopeSelection', none, 5)

  else
    highlight('TelescopeBorder', 2, 2)
    highlight('TelescopePromptBorder', 5, 5)
    highlight('TelescopePromptNormal', 10, 5)
    highlight('TelescopePromptPrefix', 35, 5)
    highlight('TelescopeNormal', none, 2)
    highlight('TelescopePreviewTitle', 5, 38)
    highlight('TelescopePromptTitle', 5, 35)
    highlight('TelescopeResultsTitle', 2, 2)
    highlight('TelescopeSelection', none, 5)
    highlight('TelescopePreviewLine', none, 4)
  end

  -- cmp
  highlight('CmpItemAbbrMatchFuzzy', 9, none)
  highlight('CmpItemKindInterface', 38, none)
  highlight('CmpItemKindText', 35, none)
  highlight('CmpItemKindVariable', 33, none)
  highlight('CmpItemKindProperty', 22, none)
  highlight('CmpItemKindKeyword', 19, none)
  highlight('CmpItemKindUnit', 21, none)
  highlight('CmpItemKindFunction', 23, none)
  highlight('CmpItemKindMethod', 36, none)
  highlight('CmpItemAbbrMatch', 10, none, {'bold'})
  highlight('CmpItemAbbr', 7, none, {'bold'})

  -- nvimtree
  highlight('NvimTreeImageFile', 23, none)
  highlight('NvimTreeFolderIcon', 23, none)
  highlight('NvimTreeWinSeperator', 3, 3)
  highlight('NvimTreeFolderName', 19, none)
  highlight('NvimTreeIndentMarker', 5, none)
  highlight('NvimTreeEmptyFolderName', 40, none)
  highlight('NvimTreeOpenedFolderName', 40, none)
  highlight('NvimTreeNormal', 9, 2)

  -- gitsigns
  highlight('GitSignsAdd', 32, none)
  highlight('GitSignsChange', 20, none)
  highlight('GitSignsDelete', 25, none)

  -- diffview
  highlight('diffAdded', 32, none)
  highlight('diffChanged', 20, none)
  highlight('diffRemoved', 25, none)
  highlight('DiffAdd', none, 13)
  highlight('DiffChange', none, 14)
  highlight('DiffDelete', none, 12)
  highlight('DiffText', none, 14)
  highlight('DiffviewFilePanelTitle', 18, none, {'bold'})
  highlight('DiffviewFilePanelCounter', 21, none, {'bold'})
  highlight('DiffviewFilePanelFileName', 39)

  -- indent blankline
  highlight('IndentBlanklineContextChar', 16)

  -- leap
  highlight('LeapMatch', 2, none, {'underline', 'nocombine'})
  highlight('LeapLabelPrimary', 2, 41)
  highlight('LeapLabelSelected', 2, 22)
  highlight('LeapLabelSeoncdary', 2, 26)

  -- hop
  highlight('HopPreview', 2, 31, {'bold', 'nocombine'})
  highlight('HopNextKey', 2, 41)
  highlight('HopNextKey1', 2, 26)
  highlight('HopNextKey2', 27, none)

  -- pounce
  highlight('PounceMatch', 2, 31)
  highlight('PounceUnmatched', none, none)
  highlight('PounceGap', 2, 7)
  highlight('PounceAccept', 2, 39, {'bold'})
  highlight('PounceAcceptBest', 2, 27, {'bold'})

  -- -- notify
  -- highlight('NotifyERRORBorder', 5, none)
  -- highlight('NotifyWARNBorder', 40, none)
  -- highlight('NotifyINFOBorder', 10, none)
  -- highlight('NotifyDEBUGBorder', 33, none)
  -- highlight('NotifyTRACEBorder', 33, none)
  -- highlight('NotifyERRORIcon', 5, none)
  -- highlight('NotifyWARNIcon', 40, none)
  -- highlight('NotifyINFOIcon', 10, none)
  -- highlight('NotifyDEBUGIcon', 33, none)
  -- highlight('NotifyTRACEIcon', 33, none)
  -- highlight('NotifyERRORTitle', 5, none)
  -- highlight('NotifyWARNTitle', 40, none)
  -- highlight('NotifyINFOTitle', 10, none)
  -- highlight('NotifyDEBUGTitle', 33, none)
  -- highlight('NotifyTRACETitle', 33, none)


  -- -- neogit
  -- highlight('NeogitBranch', 22, none)
  -- highlight('NeogitRemote', 19, none)
  -- highlight('NeogitDiffAddHighlight', 33, 5)
  -- highlight('NeogitDiffDeleteHighlight', 19, 5)
  -- highlight('NeogitDiffContextHighlight', 9, 4)
  -- highlight('NeogitHunkHeader', 9, 5)
  -- highlight('NeogitHunkHeaderHighlight', 9, 6)

  -- -- parinfer
  -- highlight('Trailhighlight', 6, none)

  -- -- hydra
  -- highlight('HydraRed', 23, none)
  -- highlight('HydraBlue', 19, none)
  -- highlight('HydraAmaranth', 22, none)
  -- highlight('HydraTeal', 35, none)
  -- highlight('HydraPink', 21, none)
  -- highlight('HydraHint', none, 2)

  -- -- dashboard
  -- highlight('DashboardShortCut', 22, none)
  -- highlight('DashboardHeader', 40, none)
  -- highlight('DashboardCenter', 21, none)
  -- highlight('DashboardFooter', 35, none)
end

return Theme
