" obsidian.vimrc — shared across all Obsidian vaults via symlink.
" Real file lives in ~/dotfiles; each <vault>/.obsidian.vimrc symlinks to it.
"
" Requires two community plugins in each vault that uses this file:
"   - Vimrc Support         (esm7/obsidian-vimrc-support)
"   - Code Editor Shortcuts (timhor/obsidian-editor-shortcuts, id: obsidian-editor-shortcuts)
"
" To reload after editing this file without restarting Obsidian: open the
" command palette and run "Vimrc Support: Source .obsidian.vimrc".

" --- Make o / O respect markdown context (list items, blockquotes, indent) ---
"
" CodeMirror's vim opens a raw blank line for o / O and bypasses Obsidian's
" markdown-aware line continuation. Code Editor Shortcuts' insertLineBelow /
" insertLineAbove commands DO continue list prefixes, blockquotes, and
" indentation. The exmap aliases are required because CodeMirror Vim strips
" arguments from a directly-bound :obcommand, so we have to define a
" zero-argument alias first and then nmap to it (see vimrc-support README).
" Trailing A enters insert mode at end of line, matching vanilla o / O.
"
" Forum thread: https://forum.obsidian.md/t/vim-o-and-o-should-respect-understand-current-context-lists/48386

exmap blankBelow obcommand obsidian-editor-shortcuts:insertLineBelow
exmap blankAbove obcommand obsidian-editor-shortcuts:insertLineAbove
nmap o :blankBelow<CR>A
nmap O :blankAbove<CR>A
