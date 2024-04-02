nnoremap <silent><leader>cg :call chatgpt#OutBufChat()<cr>
nnoremap <silent><leader>cL :call chatgpt#LoadSession()<cr>
nnoremap <silent><leader>cD :call chatgpt#DeleteSession()<cr>
nnoremap <silent><leader>cC :call chatgpt#CloseSession()<cr>
nnoremap <silent><leader>cO :call chatgpt#OpenWindow()<cr>

nnoremap <silent><leader>ck :call chatgpt#InBufChat("[Do not output any content other than code snippets.]")<cr>

vnoremap <silent><leader>cg <ESC>:call chatgpt#OutBufChatVisual()<cr>
vnoremap <silent><leader>ck <ESC>:call chatgpt#InBufChatVisual("[Do not output any content other than code snippets.]")<cr>

call chatgpt#AddConfig('<leader>ce', 'Please explain in the following code：\n&')
call chatgpt#AddConfig('<leader>cd', 'Is there anything wrong with the following code：\n&')
call chatgpt#AddConfig('<leader>ca', '&')
call chatgpt#AddConfig('<leader>c?', 'What is &')
call chatgpt#AddConfig('<leader>co', 'please help me optimize the following code : \n&')
call chatgpt#AddConfig('<leader>ciw', 'please help me improve writing for the following context: \n&')
call chatgpt#AddConfig('<leader>cf', 'please help me fix spelling and grammar for the following context: \n&')
call chatgpt#AddConfig('<leader>cte', '请将下面内容翻译为英文并优化写作: \n&')
call chatgpt#AddConfig('<leader>ctc', '请将下面内容翻译为中文: \n&')
call chatgpt#AddConfig('<leader>cI', '请检查这段英文是否有语法错误并优化: \n&')
nnoremap <silent><leader>cT :call chatgpt#TruncSession()<cr>
nnoremap <silent><leader>cS :call chatgpt#SetConfigIndex()<cr>

nnoremap <silent><leader>ck :call chatgpt#InBufChat("\n[Do not output any content other than code snippets.]")<cr>

vnoremap <silent><leader>cg <ESC>:call chatgpt#OutBufChatVisual()<cr>
vnoremap <silent><leader>ck <ESC>:call chatgpt#InBufChatVisual("\n[Do not output any content other than code snippets.]")<cr>

