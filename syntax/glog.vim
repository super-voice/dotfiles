" Vim syntax file
" Language: Google log files
" Maintainer: Kevin M. Godby <kevin@godby.org>
" Latest Revision: 6 November 2011

if exists("b:current_syntax")
  finish
endif

" Keywords {{{

" Keywords can contain colons
"setlocal iskeyword+=:

" Log line format: [IWEF]mmdd hh:mm:ss.uuuuuu threadid file:line] msg
" TODO read the `Log line format:' line to determine how to parse the log file
" lines

syn match error_level "^[IWEF]"
syn match timestamp "\d\d\d\d \d\d:\d\d:\d\d.\d\d\d\d\d\d"
syn match thread "\d\+"
syn match filename "\(.*\):"
syn match line ":\(\d\+\)\]"

highlight def link error_level Error
hi def link timestamp Type

syn match info_msg "^I.*$"
highlight link info_msg Comment

syn match warning_msg "^W.*$"
highlight link warning_msg Typedef

syn match error_msg "^[EF].*$"
highlight link error_msg Error

"syn match prefix "^[IWEF].*:[0-9]\+\] "
"highlight link prefix Comment

hi def link timestamp Type

" syn match log_error 	'\c.*\<\(FATAL\|ERROR\|ERRORS\|FAIL\|FAILED\|FAILURE\).*'
" syn match log_warning 	'\c.*\<\(WARNING\|DELETE\|DELETING\|DELETED\|RETRY\|RETRYING\).*'
" syn region log_string 	start=/'/ end=/'/ end=/$/ skip=/\\./
" syn region log_string 	start=/"/ end=/"/ skip=/\\./
" syn match log_number 	'0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'
"
" syn match   log_date '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *'
" syn match   log_date '\d\{4}-\d\d-\d\d'
"
" syn match   log_time '\d\d:\d\d:\d\d\s*'
" syn match   log_time '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)'
"
" hi def link log_string 		String
" hi def link log_number 		Number
" hi def link log_date 		Constant
" hi def link log_time 		Type
" hi def link log_error 		ErrorMsg
" hi def link log_warning 	WarningMsg


let b:current_syntax = "glog"
