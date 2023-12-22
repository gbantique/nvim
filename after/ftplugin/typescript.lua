
-- Define a function to execute a shell command asynchronously
function compile_curr_file()

  local filename = vim.api.nvim_buf_get_name(0)

  local command = "tsc " .. filename

  vim.fn.jobstart(command, {
    on_exit = function(_, exit_code)
      print("Compiling successful.")
    end,
    on_stdout = function(_, data, _)
      print("stdout: " .. data)
    end,
    on_stderr = function(_, data, _)
      print("stderr: " .. data)
    end,
  })
  print("Compiling " .. filename .. " ...")
end

vim.keymap.set(
  "n",
  "<leader>pc",
  "<cmd>lua compile_curr_file()<CR>",
  { desc = "Compile ts file", noremap = true, silent = true }
)

-- Press <F12> to toggle the terminal and execute a command
--vim.api.nvim_set_keymap('n', '<F12>', [[:ToggleTerm<CR>:exec "term://your_command"<CR>]], { noremap = true, silent = true })
--keymap("n", "<leader>t3", "<cmd>lua require('toggleterm').exec('', 3)<CR>", { desc = "Open terminal window 3" })
local current_file = vim.fn.expand("%:p")
function GetCurrentFileName()
  return vim.fn.expand("%:p")
end
vim.keymap.set(
  "n",
  "<leader>pw",
  ":lua require('toggleterm').exec('tsc ' .. GetCurrentFileName() .. ' -w', 4)<CR>",
  { desc = "Compile ts file and watched", noremap = true, silent = true }
)


