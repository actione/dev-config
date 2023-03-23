
nnoremap <silent><leader>cg :call chatgpt#Chat()<cr>
nnoremap <silent><leader>cN :call chatgpt#LoadSession()<cr>
nnoremap <silent><leader>cD :call chatgpt#DeleteSession()<cr>

call chatgpt#AddConfig('<leader>ce', 'Please explain in the following code：\n&')
call chatgpt#AddConfig('<leader>cd', 'Is there anything wrong with the following code：\n&')
call chatgpt#AddConfig('<leader>cpp', 'Please implement the following functionality in C++：\n&')
call chatgpt#AddConfig('<leader>cgo', 'Please implement the following functionality in Go：\n&')
call chatgpt#AddConfig('<leader>cpy', 'Please implement the following functionality in Python：\n&')
call chatgpt#AddConfig('<leader>ca', '&')
call chatgpt#AddConfig('<leader>c?', 'What is &')
call chatgpt#AddConfig('<leader>co', 'please help me optimize the following code : \n&')
call chatgpt#AddConfig('<leader>ciw', 'please help me improve writing for the following context: \n&')
call chatgpt#AddConfig('<leader>cf', 'please help me fix spelling and grammar for the following context: \n&')
call chatgpt#AddConfig('<leader>cte', '请将下面内容翻译为英文并优化写作: \n&')
call chatgpt#AddConfig('<leader>ctc', '请将下面内容翻译为中文: \n&')
