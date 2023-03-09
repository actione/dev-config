


lua <<EOF


local noremap = { noremap = true, silent = true }
local command_center = require("command_center")

command_center.add({
  {desc="Opencommand_center",cmd=":Telescope command_center<CR>",keys={{"n","``c",noremap},}},
}, {
  mode = command_center.mode.SET
})

for i, value in ipairs(vim.g.quick_start_config) do
    command_center.add({
        {desc=value[1], cmd=value[2]},
    }, {
        mode = command_center.mode.ADD_SET
  })
end

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    bookmarks = {
      -- Available:
      --  * 'brave'
      --  * 'brave_beta'
      --  * 'buku'
      --  * 'chrome'
      --  * 'chrome_beta'
      --  * 'edge'
      --  * 'firefox'
      --  * 'qutebrowser'
      --  * 'safari'
      --  * 'vivaldi'
      --  * 'waterfox'
      selected_browser = 'edge',

      -- Either provide a shell command to open the URL
      url_open_command = 'microsoft-edge-dev',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = nil,

      -- Show the full path to the bookmark instead of just the bookmark name
      full_path = true,

      -- Provide a custom profile name for Firefox browser
      firefox_profile_name = nil,

      -- Provide a custom profile name for Waterfox browser
      waterfox_profile_name = nil,

      -- Add a column which contains the tags for each bookmark for buku
      buku_include_tags = false,

      -- Provide debug messages
      debug = false,
    },
    command_center = {
      components = {
        command_center.component.DESC,
--        command_center.component.KEYS,
      },
      sort_by = {
        command_center.component.DESC,
        command_center.component.KEYS,
      },
      auto_replace_desc_with_cmd = false,
    },
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('session-lens')
require('telescope').load_extension('media_files')
require('telescope').load_extension('bookmarks')
require('telescope').load_extension('command_center')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('git_diffs')
require('telescope').load_extension('coc')
require('telescope').load_extension('adjacent')

EOF


nnoremap <silent><leader>s :SearchSession<CR>
nnoremap <silent>``` :Telescope<CR>
nnoremap <silent><leader>s :SearchSession<CR>
nnoremap <silent><leader>co :Telescope colorscheme<cr>
nnoremap <silent><leader>rg :Telescope live_grep<cr>
nnoremap <silent><leader>m :Telescope marks<cr>
nnoremap <silent><leader>k :Telescope keymaps<cr>
nnoremap <silent><leader>H :Telescope help_tags<cr>
nnoremap <silent><leader>t :Telescope current_buffer_tags<cr>
nnoremap <silent><leader>T :Telescope tags<cr>
nnoremap <silent><leader>ff :Telescope find_files<CR>
nnoremap <silent><leader>f :Telescope git_files<CR>
nnoremap <silent><leader>gs :Telescope git_status<CR>
nnoremap <silent><leader>b :Telescope buffers<CR>
nnoremap <silent><leader>l :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent><leader>h :Telescope oldfiles<CR>
nnoremap <silent><leader>: :Telescope command_history<CR>
nnoremap <silent><leader>/ :Telescope search_history<CR>
nnoremap <silent><leader>gc :Telescope git_bcommits<CR>
nnoremap <silent><leader>gC :Telescope git_commits<CR>
nnoremap <silent><leader>x :Telescope commands<CR>
nnoremap <silent><leader>E :Telescope file_browser<CR>
nnoremap <silent><leader>gd :Telescope git_diffs diff_commits<CR>
nnoremap <silent><leader>C :Telescope coc<CR>
nnoremap <silent><leader>fa :Telescope adjacent<CR>
nnoremap <silent><leader>B :Telescope bookmarks<CR>
nnoremap <silent><leader>j :Telescope jumplist<CR>
nnoremap <silent><leader>G :Telescope grep_string<CR>