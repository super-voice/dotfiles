source ~/.vimrc
set guioptions=ce
set antialias
set linespace=2
set lines=40
set columns=140
set mouse=a
colorscheme railscasts

if has("gui_macvim")
	set guifont=Monaco:h14
else
	set guifont=Monaco:h14
end
if has("gui_macvim")
	set transparency=0
	for i in range(1, 9)
		exec "nnoremap <D-".i."> ".i."gt"
	endfor

endif
