" -----------------------------------------------------------------------------
" File: gruvbox.vim
" Description: Retro groove color scheme for Airline
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvbox
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

let g:airline#themes#gruvbox#palette = {}

function! s:getGruvColor(group)
  let guiColor = synIDattr(hlID(a:group), "fg", "gui")
  let termColor = synIDattr(hlID(a:group), "fg", "cterm")
  return [ guiColor, termColor ]
endfunction

function! airline#themes#gruvbox#refresh()

  let s:bg0 = s:getGruvColor('GruvboxBg0')
  let s:bg1 = s:getGruvColor('GruvboxBg1')
  let s:bg2 = s:getGruvColor('GruvboxBg2')
  let s:fg4 = s:getGruvColor('GruvboxFg4')

  let s:normal   = s:getGruvColor('GruvboxGray')
  let s:insert   = s:getGruvColor('GruvboxGreen')
  let s:visual   = s:getGruvColor('GruvboxYellow')
  let s:replace  = s:getGruvColor('GruvboxRed')
  let s:warning  = s:getGruvColor('GruvboxOrange')
  let s:error    = s:getGruvColor('GruvboxRed')
  let s:modified = s:getGruvColor('GruvboxOrange')

  let accents_group = airline#themes#get_highlight('Special')
  let modified_group = [ s:modified[0], s:bg1[0], s:modified[1], s:bg1[1], 'bold,italic' ]
  let warning_group = [ s:bg0[0], s:warning[0], s:bg0[1], s:warning[1] ]
  let error_group = [ s:bg0[0], s:error[0], s:bg0[1], s:error[1] ]

  let s:N1 = [ s:bg0[0], s:normal[0], s:bg0[1], s:normal[1] ]
  let s:N2 = [ s:fg4[0], s:bg2[0], s:fg4[1], s:bg2[1] ]
  let s:N3 = [ s:fg4[0], s:bg1[0], s:fg4[1], s:bg1[1] , 'bold' ]
  let g:airline#themes#gruvbox#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
  let g:airline#themes#gruvbox#palette.normal_modified = { 'airline_c': modified_group }
  let g:airline#themes#gruvbox#palette.normal.airline_warning = warning_group
  let g:airline#themes#gruvbox#palette.normal_modified.airline_warning = warning_group
  let g:airline#themes#gruvbox#palette.normal.airline_error = error_group
  let g:airline#themes#gruvbox#palette.normal_modified.airline_error = error_group

  let s:I1 = [ s:bg0[0], s:insert[0], s:bg0[1], s:insert[1] ]
  let s:I2 = [ s:insert[0], s:bg2[0], s:insert[1], s:bg2[1] ]
  let s:I3 = [ s:insert[0], s:bg1[0], s:insert[1], s:bg1[1], 'bold' ]
  let g:airline#themes#gruvbox#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#gruvbox#palette.insert_modified = g:airline#themes#gruvbox#palette.normal_modified
  let g:airline#themes#gruvbox#palette.insert.airline_warning = g:airline#themes#gruvbox#palette.normal.airline_warning
  let g:airline#themes#gruvbox#palette.insert_modified.airline_warning = g:airline#themes#gruvbox#palette.normal_modified.airline_warning
  let g:airline#themes#gruvbox#palette.insert.airline_error = g:airline#themes#gruvbox#palette.normal.airline_error
  let g:airline#themes#gruvbox#palette.insert_modified.airline_error = g:airline#themes#gruvbox#palette.normal_modified.airline_error

  let s:R1 = [ s:bg0[0], s:replace[0], s:bg0[1], s:replace[1] ]
  let s:R2 = [ s:replace[0], s:bg2[0], s:replace[1], s:bg2[1] ]
  let s:R3 = [ s:replace[0], s:bg1[0], s:replace[1], s:bg1[1], 'bold' ]
  let g:airline#themes#gruvbox#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#gruvbox#palette.replace_modified = g:airline#themes#gruvbox#palette.normal_modified
  let g:airline#themes#gruvbox#palette.replace.airline_warning = g:airline#themes#gruvbox#palette.normal.airline_warning
  let g:airline#themes#gruvbox#palette.replace_modified.airline_warning = g:airline#themes#gruvbox#palette.normal_modified.airline_warning
  let g:airline#themes#gruvbox#palette.replace.airline_error = g:airline#themes#gruvbox#palette.normal.airline_error
  let g:airline#themes#gruvbox#palette.replace_modified.airline_error = g:airline#themes#gruvbox#palette.normal_modified.airline_error

  let s:V1 = [ s:bg0[0], s:visual[0], s:bg0[1], s:visual[1] ]
  let s:V2 = [ s:visual[0], s:bg2[0], s:visual[1], s:bg2[1] ]
  let s:V3 = [ s:visual[0], s:bg1[0], s:visual[1], s:bg1[1], 'bold' ]
  let g:airline#themes#gruvbox#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#gruvbox#palette.visual_modified = { 'airline_c': [ s:V3[0], '', s:V3[2], '', '' ] }
  let g:airline#themes#gruvbox#palette.visual.airline_warning = g:airline#themes#gruvbox#palette.normal.airline_warning
  let g:airline#themes#gruvbox#palette.visual_modified.airline_warning = g:airline#themes#gruvbox#palette.normal_modified.airline_warning
  let g:airline#themes#gruvbox#palette.visual.airline_error = g:airline#themes#gruvbox#palette.normal.airline_error
  let g:airline#themes#gruvbox#palette.visual_modified.airline_error = g:airline#themes#gruvbox#palette.normal_modified.airline_error

  let s:IA = airline#themes#get_highlight2(['TabLine', 'fg'], ['CursorLine', 'bg'])
  let g:airline#themes#gruvbox#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
  let g:airline#themes#gruvbox#palette.inactive_modified = { 'airline_c': modified_group }

  let g:airline#themes#gruvbox#palette.accents = { 'red': accents_group }

  let s:TF = [ s:fg4[0], s:bg1[0], s:fg4[1], s:bg1[1] ]
  let s:TM = [ s:bg0[0], s:modified[0], s:bg0[1], s:modified[1], 'bold,italic' ]
  let g:airline#themes#gruvbox#palette.tabline = {
    \ 'airline_tab':  s:N2,
    \ 'airline_tabsel':  s:N1,
    \ 'airline_tabtype':  s:V1,
    \ 'airline_tabfill':  s:TF,
    \ 'airline_tabhid':  s:IA,
    \ 'airline_tabmod':  s:TM
    \ }

endfunction

call airline#themes#gruvbox#refresh()

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
