
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
  "<leader>pcc",
  "<cmd>lua compile_curr_file()<CR>",
  { desc = "Compile ts file", noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<leader>pct",
  ":lua require('toggleterm').exec('tsc', 4)<CR>",
  { desc = "Compile according to tsconfig", noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<leader>pcw",
  ":lua require('toggleterm').exec('tsc ' .. vim.fn.expand('%p') .. ' -w', 4)<CR>",
  { desc = "Compile ts file and watched", noremap = true, silent = true }
)


