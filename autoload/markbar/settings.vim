function! s:VimLTypeToString(type) abort
    let l:type = a:type + 0  " cast to number
    let l:types = {
        \ 0: 'v:t_number',
        \ 1: 'v:t_string',
        \ 2: 'v:t_func',
        \ 3: 'v:t_list',
        \ 4: 'v:t_dict',
        \ 5: 'v:t_float',
        \ 6: 'v:t_bool',
        \ 7: 'v:null',
    \ }
    if !has_key(l:types, l:type)
        throw '(vim-markbar) Nonexistent variable type with val: ' . a:type
    endif
    return l:types[a:type]
endfunction

function! s:AssertType(variable, expected, variable_name) abort
    if type(a:variable) !=# a:expected
        throw '(vim-markbar) Variable ' . a:variable_name
            \ . ' should have type: ' . s:VimLTypeToString(a:expected)
            \ . ' but instead has type: ' . s:VimLTypeToString(type(a:variable))
    endif
endfunction

" RETURNS:  (v:t_bool)  Whether to open a 'peekaboo markbar' after hitting the
"                       apostrophe or backtick keys.
" DETIALS:  Vim must restart in order for changes to this option to take effect.
function! markbar#settings#EnablePeekabooMarkbar() abort
    if !exists('g:enable_peekaboo_markbar')
        let g:enable_peekaboo_markbar = v:true
    endif
    call s:AssertType(
        \ g:enable_peekaboo_markbar,
        \ v:t_bool,
        \ 'g:enable_peekaboo_markbar'
    \ )
    return g:enable_peekaboo_markbar
endfunction

" RETURNS:  (v:t_string)    All marks to display in the markbar, in order.
function! markbar#settings#MarksToDisplay() abort
    if !exists('g:markbar_marks_to_display')
        let g:markbar_marks_to_display =
            \ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    endif
    call s:AssertType(
        \ g:markbar_marks_to_display,
        \ v:t_string,
        \ 'g:markbar_marks_to_display'
    \ )
    return g:markbar_marks_to_display
endfunction

" RETURNS:  (v:t_string)    All marks to display in the peekaboo markbar, in
"                           order.
function! markbar#settings#PeekabooMarksToDisplay() abort
    if !exists('g:markbar_marks_to_display')
        let g:markbar_marks_to_display =
            \ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    endif
    call s:AssertType(
        \ g:markbar_marks_to_display,
        \ v:t_string,
        \ 'g:markbar_marks_to_display'
    \ )
    return g:markbar_marks_to_display
endfunction

" RETURNS:  (v:t_string)    Comma-separated list of modifiers used when
"                           merely highlighting a mark in the peekaboo
"                           markbar.
function! markbar#settings#PeekabooSelectModifiers() abort
    if !exists('g:markbar_peekaboo_select_modifiers')
        let g:markbar_peekaboo_select_modifiers = ''
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_select_modifiers,
        \ v:t_string,
        \ 'g:markbar_peekaboo_select_modifiers'
    \ )
    return g:markbar_peekaboo_select_modifiers
endfunction

" RETURNS:  (v:t_string)    The keymapping used to jump to the 'moused-over'
"                           mark from the peekaboo markbar.
function! markbar#settings#PeekabooJumpToMarkMapping() abort
    if !exists('g:markbar_peekaboo_jump_to_mark_mapping')
        let g:markbar_peekaboo_jump_to_mark_mapping = '<cr>'
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_jump_to_mark_mapping,
        \ v:t_string,
        \ 'g:markbar_peekaboo_jump_to_mark_mapping'
    \ )
    return g:markbar_peekaboo_jump_to_mark_mapping
endfunction

" RETURNS:  (v:t_string)    Comma-separated list of modifiers used when
"                           jumping straight to a mark from the peekaboo
"                           markbar.
function! markbar#settings#PeekabooJumpToMarkModifiers() abort
    if !exists('g:markbar_peekaboo_jump_to_mark_modifiers')
        let g:markbar_peekaboo_jump_to_mark_modifiers = 'control'
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_jump_to_mark_modifiers,
        \ v:t_string,
        \ 'g:markbar_peekaboo_jump_to_mark_modifiers'
    \ )
    return g:markbar_peekaboo_jump_to_mark_modifiers
endfunction

" RETURNS:  (v:t_bool)      Whether to open markbars as vertical splits
"                           (`v:true`) or horizontal splits (`v:false`).
function! markbar#settings#MarkbarOpenVertical() abort
    if !exists('g:markbar_open_vertical')
        let g:markbar_open_vertical = v:true
    endif
    call s:AssertType(
        \ g:markbar_open_vertical,
        \ v:t_bool,
        \ 'g:markbar_open_vertical'
    \ )
    return g:markbar_open_vertical
endfunction

" RETURNS:  (v:t_bool)      Whether to open the peekaboo markbar as a vertical
"                           split (`v:true`) or horizontal split (`v:false`).
function! markbar#settings#PeekabooMarkbarOpenVertical() abort
    if !exists('g:markbar_peekaboo_open_vertical')
        let g:markbar_peekaboo_open_vertical = v:true
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_open_vertical,
        \ v:t_bool,
        \ 'g:markbar_peekaboo_open_vertical'
    \ )
    return g:markbar_peekaboo_open_vertical
endfunction

" RETURNS:  (v:t_number)    The width of an opened vertical markbar, in columns.
function! markbar#settings#MarkbarWidth() abort
    if !exists('g:markbar_width')
        let g:markbar_width = 35
    endif
    call s:AssertType(
        \ g:markbar_width,
        \ v:t_number,
        \ 'g:markbar_width'
    \ )
    return g:markbar_width
endfunction

" RETURNS:  (v:t_number)    The width of an opened vertical peekaboo markbar,
"                           in columns.
function! markbar#settings#PeekabooMarkbarWidth() abort
    if !exists('g:markbar_peekaboo_width')
        let g:markbar_peekaboo_width = 35
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_width,
        \ v:t_number,
        \ 'g:markbar_peekaboo_width'
    \ )
    return g:markbar_peekaboo_width
endfunction

" RETURNS:  (v:t_number)    The height of an opened horizontal markbar, in lines.
function! markbar#settings#MarkbarHeight() abort
    if !exists('g:markbar_height')
        let g:markbar_height = 30
    endif
    call s:AssertType(
        \ g:markbar_height,
        \ v:t_number,
        \ 'g:markbar_height'
    \ )
    return g:markbar_height
endfunction

" RETURNS:  (v:t_number)    The height of an opened horizontal peekaboo
"                           markbar, in lines.
function! markbar#settings#PeekabooMarkbarHeight() abort
    if !exists('g:markbar_peekaboo_height')
        let g:markbar_peekaboo_height = 30
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_height,
        \ v:t_number,
        \ 'g:markbar_peekaboo_height'
    \ )
    return g:markbar_peekaboo_height
endfunction

" RETURNS:  (v:t_bool)      Whether to close an open markbar after jumping to
"                           a mark from the markbar.
function! markbar#settings#CloseAfterGoTo() abort
    if !exists('g:markbar_close_after_go_to')
        let g:markbar_close_after_go_to = v:true
    endif
    call s:AssertType(
        \ g:markbar_close_after_go_to,
        \ v:t_bool,
        \ 'g:markbar_close_after_go_to'
    \ )
    return g:markbar_close_after_go_to
endfunction

" RETURNS:  (v:t_bool)      Whether to close an open peekaboo markbar after
"                           jumping to a mark from the markbar.
function! markbar#settings#PeekabooCloseAfterGoTo() abort
    if !exists('g:markbar_peekaboo_close_after_go_to')
        let g:markbar_peekaboo_close_after_go_to = v:true
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_close_after_go_to,
        \ v:t_bool,
        \ 'g:markbar_peekaboo_close_after_go_to'
    \ )
    return g:markbar_peekaboo_close_after_go_to
endfunction

" RETURNS:  (v:t_string)    The positional command modifier to apply when
"                           opening the markbar.
function! markbar#settings#OpenPosition() abort
    if !exists('g:markbar_open_position')
        let g:markbar_open_position = 'botright'
    endif
    call s:AssertType(
        \ g:markbar_open_position,
        \ v:t_string,
        \ 'g:markbar_open_position'
    \ )
    let l:valid_positions = [
        \ 'leftabove', 'aboveleft', 'rightbelow',
        \ 'belowright', 'topleft', 'botright'
    \ ]
    if index(l:valid_positions, g:markbar_open_position) ==# -1
        throw '(vim-markbar) Bad value for g:markbar_open_position: ' . g:markbar_open_position
    endif
    return g:markbar_open_position
endfunction

" RETURNS:  (v:t_string)    The positional command modifier to apply when
"                           opening a peekaboo markbar.
function! markbar#settings#PeekabooOpenPosition() abort
    if !exists('g:markbar_peekaboo_open_position')
        let g:markbar_peekaboo_open_position = 'botright'
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_open_position,
        \ v:t_string,
        \ 'g:markbar_peekaboo_open_position'
    \ )
    let l:valid_positions = [
        \ 'leftabove', 'aboveleft', 'rightbelow',
        \ 'belowright', 'topleft', 'botright'
    \ ]
    if index(l:valid_positions, g:markbar_peekaboo_open_position) ==# -1
        throw '(vim-markbar) Bad value for g:markbar_peekaboo_open_position: '
            \ . g:markbar_peekaboo_open_position
    endif
    return g:markbar_peekaboo_open_position
endfunction

" RETURNS:  (v:t_string)    The name to give to any opened markbar buffers.
function! markbar#settings#MarkbarBufferName() abort
    if !exists('g:markbar_buffer_name')
        let g:markbar_buffer_name = '( Markbar )'
    endif
    call s:AssertType(
        \ g:markbar_buffer_name,
        \ v:t_string,
        \ 'g:markbar_buffer_name'
    \ )
    return g:markbar_buffer_name
endfunction

" RETURNS:  (v:t_string)    A block of text with which to indent lines of
"                           context in the markbar proper.
function! markbar#settings#ContextIndentBlock() abort
    if !exists('g:markbar_context_indent_block')
        let g:markbar_context_indent_block = '    '
    endif

    " if user specified a number, 'assemble' an indent block
    if type(g:markbar_context_indent_block ==# v:t_number)
        let l:block_to_return = ''
        let l:i = 0
        while l:i <# g:markbar_context_indent_block
            let l:block_to_return += ' '
            let l:i += 1
        endwhile
        let g:markbar_context_indent_block = l:block_to_return
    endif

    call s:AssertType(
        \ g:markbar_context_indent_block,
        \ v:t_string,
        \ 'g:markbar_context_indent_block'
    \ )

    if !exists('g:markbar_context_indent_block_NOWARN')
        let l:silence_text =
            \ '(Set g:markbar_context_indent_block_NOWARN '
            \ . 'to 1 to silence this warning.)'
        if !len(g:markbar_context_indent_block)
                \ ||  (g:markbar_context_indent_block[0] !=# ' '
                \   && g:markbar_context_indent_block[0] !=# "\t")
            echoerr '(vim-markbar) WARNING: Context indentation block '
                \ . 'that doesn''t start with a space or tab '
                \ . 'will break markbar syntax highlighting. '
                \ . l:silence_text
        endif
        if len(matchstr(g:markbar_context_indent_block, '['))
            echoerr '(vim-markbar) WARNING: Given context indent block: "'
                \ . g:markbar_context_indent_block
                \ . '" contains dangerous character "[" that may break '
                \ . "markbar's 'jump to mark' mappings. "
                \ . l:silence_text
        endif
    endif

    return g:markbar_context_indent_block
endfunction

" RETURNS:  (v:t_string)    A block of text with which to indent lines of
"                           context in a peekaboo markbar.
function! markbar#settings#PeekabooContextIndentBlock() abort
    if !exists('g:markbar_peekaboo_context_indent_block')
        let g:markbar_peekaboo_context_indent_block = '  '
    endif

    " if user specified a number, 'assemble' an indent block
    if type(g:markbar_peekaboo_context_indent_block ==# v:t_number)
        let l:block_to_return = ''
        let l:i = 0
        while l:i <# g:markbar_peekaboo_context_indent_block
            let l:block_to_return += ' '
            let l:i += 1
        endwhile
        let g:markbar_peekaboo_context_indent_block = l:block_to_return
    endif

    call s:AssertType(
        \ g:markbar_peekaboo_context_indent_block,
        \ v:t_string,
        \ 'g:markbar_peekaboo_context_indent_block'
    \ )

    if !exists('g:markbar_peekaboo_context_indent_block_NOWARN')
        let l:silence_text =
            \ '(Set g:markbar_peekaboo_context_indent_block_NOWARN '
            \ . 'to 1 to silence this warning.)'
        if !len(g:markbar_peekaboo_context_indent_block)
                \ ||  (g:markbar_peekaboo_context_indent_block[0] !=# ' '
                \   && g:markbar_peekaboo_context_indent_block[0] !=# "\t")
            echoerr '(vim-markbar) WARNING: Context indentation block '
                \ . 'that doesn''t start with a space or tab '
                \ . 'will break markbar syntax highlighting. '
                \ . l:silence_text
        endif
        if len(matchstr(g:markbar_peekaboo_context_indent_block, '['))
            echoerr '(vim-markbar) WARNING: Given context indent block: "'
                \ . g:markbar_peekaboo_context_indent_block
                \ . '" contains dangerous character "[" that may break '
                \ . "markbar's 'jump to mark' mappings. "
                \ . l:silence_text
        endif
    endif

    return g:markbar_peekaboo_context_indent_block
endfunction

" RETURNS:  (v:t_list)      A list populated with a number of zero-length
"                           strings equal to the number of blank spaces that
"                           should exist in between markbar 'section
"                           headings'.
function! markbar#settings#MarkbarSectionSeparator() abort
    if !exists('g:markbar_section_separation')
        let g:markbar_section_separation = 1
    endif
    call s:AssertType(
        \ g:markbar_section_separation,
        \ v:t_number,
        \ 'g:markbar_section_separation'
    \ )

    if g:markbar_section_separation <# 0
        throw '(vim-markbar) Bad value for g:markbar_section_separation: '
            \ . g:markbar_section_separation
    endif

    let l:separator = []
    let l:i = 0
    while l:i <# g:markbar_section_separation
        let l:separator += ['']
        let l:i += 1
    endwhile
    return l:separator
endfunction

" RETURNS:  (v:t_list)      A list populated with a number of zero-length
"                           strings equal to the number of blank spaces that
"                           should exist in between markbar 'section
"                           headings' in a peekaboo markbar.
function! markbar#settings#PeekabooMarkbarSectionSeparator() abort
    if !exists('g:markbar_peekaboo_section_separation')
        let g:markbar_peekaboo_section_separation = 0
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_section_separation,
        \ v:t_number,
        \ 'g:markbar_peekaboo_section_separation'
    \ )

    if g:markbar_peekaboo_section_separation <# 0
        throw '(vim-markbar) Bad value for g:markbar_peekaboo_section_separation: '
            \ . g:markbar_peekaboo_section_separation
    endif

    let l:separator = []
    let l:i = 0
    while l:i <# g:markbar_peekaboo_section_separation
        let l:separator += ['']
        let l:i += 1
    endwhile
    return l:separator
endfunction

" RETURNS:  (v:t_dict)      A dictionary populated with the `bufhidden` values
"                           that indicate that a buffer should be ignored.
function! markbar#settings#IgnoreBufferCriteria() abort
    if !exists('g:markbar_ignore_buffer_criteria')
        let g:markbar_ignore_buffer_criteria = ['unload', 'delete', 'wipe']
    endif
    call s:AssertType(
        \ g:markbar_ignore_buffer_criteria,
        \ v:t_list,
        \ 'g:markbar_ignore_buffer_criteria'
    \ )

    let l:valid_ignore_criteria = ['unload', 'delete', 'wipe', 'hide', '<empty>']
    let l:criteria = {}
    for l:criterion in g:markbar_ignore_buffer_criteria
        if index(l:valid_ignore_criteria, l:criterion) ==# -1
            throw '(vim-markbar) Invalid IgnoreBuffer criterion: ' . l:criterion
        endif
        if l:criterion ==# '<empty>'
            let l:criteria[''] = 1
        else
            let l:criteria[l:criterion] = 1
        endif
    endfor
    return l:criteria
endfunction

" RETURNS:  (v:t_number)    The maximum permissible size of
"                           `g:activeBufferStack`.
function! markbar#settings#MaximumActiveBufferHistory() abort
    if !exists('g:markbar_maximum_active_buffer_history')
        let g:markbar_maximum_active_buffer_history = 100
    endif
    call s:AssertType(
        \ g:markbar_maximum_active_buffer_history,
        \ v:t_number,
        \ 'g:markbar_maximum_active_buffer_history'
    \ )
    if g:markbar_maximum_active_buffer_history <# 2
        throw 'Value too small for g:markbar_maximum_active_buffer_history: '
            \ . g:markbar_maximum_active_buffer_history
    endif
    return g:markbar_maximum_active_buffer_history
endfunction

" RETURNS:  (v:t_number)    The number of lines of context to retrieve around
"                           marks, including the line that holds the mark.
function! markbar#settings#NumLinesContext() abort
    if !exists('g:markbar_num_lines_context')
        let g:markbar_num_lines_context = 5
    endif
    call s:AssertType(
        \ g:markbar_num_lines_context,
        \ v:t_number,
        \ 'g:markbar_num_lines_context'
    \ )
    return g:markbar_num_lines_context
endfunction

" RETURNS:  (v:t_number)    The number of lines of context to retrieve around
"                           marks, including the line that holds the mark,
"                           when displaying a peekaboo markbar.
function! markbar#settings#PeekabooNumLinesContext() abort
    if !exists('g:markbar_peekaboo_num_lines_context')
        let g:markbar_peekaboo_num_lines_context = 3
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_num_lines_context,
        \ v:t_peekaboo_number,
        \ 'g:markbar_peekaboo_num_lines_context'
    \ )
    return g:markbar_peekaboo_num_lines_context
endfunction

" RETURNS:  (v:t_string)    The keymapping used to 'jump to mark from markbar'
"                           when the markbar is open.
function! markbar#settings#JumpToMarkMapping() abort
    if !exists('g:markbar_jump_to_mark_mapping')
        let g:markbar_jump_to_mark_mapping = '<cr>'
    endif
    call s:AssertType(
        \ g:markbar_jump_to_mark_mapping,
        \ v:t_string,
        \ 'g:markbar_jump_to_mark_mapping'
    \ )
    return g:markbar_jump_to_mark_mapping
endfunction

" RETURNS:  (v:t_string)    The keymapping used to rename a mark in the
"                           markbar.
function! markbar#settings#RenameMarkMapping() abort
    if !exists('g:markbar_rename_mark_mapping')
        let g:markbar_rename_mark_mapping = 'r'
    endif
    call s:AssertType(
        \ g:markbar_rename_mark_mapping,
        \ v:t_string,
        \ 'g:markbar_rename_mark_mapping'
    \ )
    return g:markbar_rename_mark_mapping
endfunction

" RETURNS:  (v:t_string)    The keymapping used to reset a mark's name
"                           in the markbar.
function! markbar#settings#ResetMarkMapping() abort
    if !exists('g:markbar_reset_mark_mapping')
        let g:markbar_reset_mark_mapping = 'c'
    endif
    call s:AssertType(
        \ g:markbar_reset_mark_mapping,
        \ v:t_string,
        \ 'g:markbar_reset_mark_mapping'
    \ )
    return g:markbar_reset_mark_mapping
endfunction

" RETURNS:  (v:t_string)    The keymapping used to delete the currently
"                           mark currently selected in the markbar.
function! markbar#settings#DeleteMarkMapping() abort
    if !exists('g:markbar_delete_mark_mapping')
        let g:markbar_delete_mark_mapping = 'd'
    endif
    call s:AssertType(
        \ g:markbar_delete_mark_mapping,
        \ v:t_string,
        \ 'g:markbar_delete_mark_mapping'
    \ )
    return g:markbar_delete_mark_mapping
endfunction

" RETURNS:  (v:t_string)    The keymapping used to skip the cursor to the next
"                           mark 'section' in the markbar.
function! markbar#settings#NextMarkMapping() abort
    if !exists('g:markbar_next_mark_mapping')
        let g:markbar_next_mark_mapping = 'n'
    endif
    call s:AssertType(
        \ g:markbar_next_mark_mapping,
        \ v:t_string,
        \ 'g:markbar_next_mark_mapping'
    \ )
    return g:markbar_next_mark_mapping
endfunction

" RETURNS:  (v:t_string)    The keymapping used to skip the cursor to the
"                           previous mark 'section' in the markbar.
function! markbar#settings#PreviousMarkMapping() abort
    if !exists('g:markbar_previous_mark_mapping')
        let g:markbar_previous_mark_mapping = 'N'
    endif
    call s:AssertType(
        \ g:markbar_previous_mark_mapping,
        \ v:t_string,
        \ 'g:markbar_previous_mark_mapping'
    \ )
    return g:markbar_previous_mark_mapping
endfunction

" RETURNS:  (v:t_bool)      `v:true` if the 'jump to mark from markbar'
"                           mapping should go to the exact line *and column*
"                           of the mark, or `v:false` if it should go to the
"                           line (and column zero).
function! markbar#settings#JumpToExactPosition() abort
    if !exists('g:markbar_jump_to_exact_position')
        let g:markbar_jump_to_exact_position = v:true
    endif
    call s:AssertType(
        \ g:markbar_jump_to_exact_position,
        \ v:t_bool,
        \ 'g:markbar_jump_to_exact_position'
    \ )
    return g:markbar_jump_to_exact_position
endfunction

" RETURNS:  (v:t_bool)      `v:true` if the 'peekaboo markbar' opened by
"                           should send the cursor to the exact line *and
"                           column* of the selected mark, even if the user
"                           opened the 'peekboo markbar' using the apostrophe
"                           key.
function! markbar#settings#BacktickBehaviorWithApostrophe() abort
    if !exists('g:markbar_backtick_behavior_with_apostrophe')
        let g:markbar_backtick_behavior_with_apostrophe = v:false
    endif
    call s:AssertType(
        \ g:markbar_backtick_behavior_with_apostrophe,
        \ v:t_bool,
        \ 'g:markbar_backtick_behavior_with_apostrophe'
    \ )
    return g:markbar_backtick_behavior_with_apostrophe
endfunction

" RETURNS:  (v:t_string)    The `:h command-completion` options used when
"                           renaming a mark.
function! markbar#settings#RenameMarkCompletion() abort
    if !exists('g:markbar_rename_mark_completion')
        let g:markbar_rename_mark_completion = 'file_in_path'
    endif
    call s:AssertType(
        \ g:markbar_rename_mark_completion,
        \ v:t_string,
        \ 'g:markbar_rename_mark_completion'
    \ )
    return g:markbar_rename_mark_completion
endfunction


" RETURNS:  (v:t_string)    A format string (see `:help printf`) defining the
"                           default 'name pattern' for a mark.
function! markbar#settings#MarkNameFormatString() abort
    if !exists('g:markbar_mark_name_format_string')
        let g:markbar_mark_name_format_string =
            \ 'l: %4d, c: %4d'
    endif
    call s:AssertType(
        \ g:markbar_mark_name_format_string,
        \ v:t_string,
        \ 'g:markbar_mark_name_format_string'
    \ )
    return g:markbar_mark_name_format_string
endfunction

" RETURNS:  (v:t_list)      The arguments with which to populate the default
"                           `name pattern` for a mark.
function! markbar#settings#MarkNameArguments() abort
    if !exists('g:markbar_mark_name_arguments')
        let g:markbar_mark_name_arguments =
            \ ['line', 'col']
    endif
    call s:AssertType(
        \ g:markbar_mark_name_arguments,
        \ v:t_list,
        \ 'g:markbar_mark_name_arguments'
    \ )
    return g:markbar_mark_name_arguments
endfunction


" RETURNS:  (v:t_string)    A format string (see `:help printf`) defining the
"                           default 'name pattern' for an 'uppercase' file mark.
function! markbar#settings#FileMarkFormatString() abort
    if !exists('g:markbar_file_mark_format_string')
        let g:markbar_file_mark_format_string =
            \ '%s [l: %4d, c: %4d]'
    endif
    call s:AssertType(
        \ g:markbar_file_mark_format_string,
        \ v:t_string,
        \ 'g:markbar_file_mark_format_string'
    \ )
    return g:markbar_file_mark_format_string
endfunction

" RETURNS:  (v:t_list)      The arguments with which to populate the default
"                           `name pattern` for an uppercase file mark.
function! markbar#settings#FileMarkArguments() abort
    if !exists('g:markbar_file_mark_arguments')
        let g:markbar_file_mark_arguments =
            \ ['fname', 'line', 'col']
    endif
    call s:AssertType(
        \ g:markbar_file_mark_arguments,
        \ v:t_list,
        \ 'g:markbar_file_mark_arguments'
    \ )
    return g:markbar_file_mark_arguments
endfunction


" RETURNS:  (v:t_string)    A format string (see `:help printf`) defining the
"                           default 'name pattern' for a 'numbered' mark.
function! markbar#settings#NumberedMarkFormatString() abort
    if !exists('g:markbar_numbered_mark_format_string')
        let g:markbar_numbered_mark_format_string =
            \ markbar#settings#FileMarkFormatString()
    endif
    call s:AssertType(
        \ g:markbar_numbered_mark_format_string,
        \ v:t_string,
        \ 'g:markbar_numbered_mark_format_string'
    \ )
    return g:markbar_numbered_mark_format_string
endfunction

" RETURNS:  (v:t_list)      The arguments with which to populate the default
"                           `name pattern` for a mark.
function! markbar#settings#NumberedMarkArguments() abort
    if !exists('g:markbar_numbered_mark_arguments')
        let g:markbar_numbered_mark_arguments =
            \ markbar#settings#FileMarkArguments()
    endif
    call s:AssertType(
        \ g:markbar_numbered_mark_arguments,
        \ v:t_list,
        \ 'g:markbar_numbered_mark_arguments'
    \ )
    return g:markbar_numbered_mark_arguments
endfunction

" RETURNS:  (v:t_string)    A format string (see `:help printf`) defining the
"                           default 'name pattern' for a mark.
function! markbar#settings#PeekabooMarkNameFormatString() abort
    if !exists('g:markbar_peekaboo_mark_name_format_string')
        let g:markbar_peekaboo_mark_name_format_string =
            \ markbar#settings#MarkNameFormatString()
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_mark_name_format_string,
        \ v:t_string,
        \ 'g:markbar_peekaboo_mark_name_format_string'
    \ )
    return g:markbar_peekaboo_mark_name_format_string
endfunction

" RETURNS:  (v:t_list)      The arguments with which to populate the default
"                           `name pattern` for a mark.
function! markbar#settings#PeekabooMarkNameArguments() abort
    if !exists('g:markbar_peekaboo_mark_name_arguments')
        let g:markbar_peekaboo_mark_name_arguments =
            \ markbar#settings#MarkNameArguments()
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_mark_name_arguments,
        \ v:t_list,
        \ 'g:markbar_peekaboo_mark_name_arguments'
    \ )
    return g:markbar_peekaboo_mark_name_arguments
endfunction


" RETURNS:  (v:t_string)    A format string (see `:help printf`) defining the
"                           default 'name pattern' for an 'uppercase' file mark.
function! markbar#settings#PeekabooFileMarkFormatString() abort
    if !exists('g:markbar_peekaboo_file_mark_format_string')
        let g:markbar_peekaboo_file_mark_format_string =
            \ markbar#settings#FileMarkFormatString()
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_file_mark_format_string,
        \ v:t_string,
        \ 'g:markbar_peekaboo_file_mark_format_string'
    \ )
    return g:markbar_peekaboo_file_mark_format_string
endfunction

" RETURNS:  (v:t_list)      The arguments with which to populate the default
"                           `name pattern` for an uppercase file mark.
function! markbar#settings#PeekabooFileMarkArguments() abort
    if !exists('g:markbar_peekaboo_file_mark_arguments')
        let g:markbar_peekaboo_file_mark_arguments =
            \ markbar#settings#FileMarkArguments()
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_file_mark_arguments,
        \ v:t_list,
        \ 'g:markbar_peekaboo_file_mark_arguments'
    \ )
    return g:markbar_peekaboo_file_mark_arguments
endfunction


" RETURNS:  (v:t_string)    A format string (see `:help printf`) defining the
"                           default 'name pattern' for a 'numbered' mark.
function! markbar#settings#PeekabooNumberedMarkFormatString() abort
    if !exists('g:markbar_peekaboo_numbered_mark_format_string')
        let g:markbar_peekaboo_numbered_mark_format_string =
            \ markbar#settings#PeekabooFileMarkFormatString()
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_numbered_mark_format_string,
        \ v:t_string,
        \ 'g:markbar_peekaboo_numbered_mark_format_string'
    \ )
    return g:markbar_peekaboo_numbered_mark_format_string
endfunction

" RETURNS:  (v:t_list)      The arguments with which to populate the default
"                           `name pattern` for a mark.
function! markbar#settings#PeekabooNumberedMarkArguments() abort
    if !exists('g:markbar_peekaboo_numbered_mark_arguments')
        let g:markbar_peekaboo_numbered_mark_arguments =
            \ markbar#settings#PeekabooFileMarkArguments()
    endif
    call s:AssertType(
        \ g:markbar_peekaboo_numbered_mark_arguments,
        \ v:t_list,
        \ 'g:markbar_peekaboo_numbered_mark_arguments'
    \ )
    return g:markbar_peekaboo_numbered_mark_arguments
endfunction
