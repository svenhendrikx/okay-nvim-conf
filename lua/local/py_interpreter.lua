local M = {}

-- Start the Python interpreter
function M.start_interpreter()
  local filename = vim.api.nvim_buf_get_name(0)

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = vim.o.columns,
    height = vim.o.lines,
    col = 0,
    row = 0,
  })
  vim.api.nvim_win_set_option(win, 'spell', false)
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'hide')
  vim.api.nvim_buf_set_option(buf, 'swapfile', false)
  vim.fn.termopen(string.format("python3 %s", filename))
  -- vim.cmd('startinsert')
end

-- Send code from the current buffer to the Python interpreter
function M.send_code()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local py_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if name:match('term://.*python3') then
      py_win = win
      break
    end
  end
  if not py_win then
    print('Python interpreter not found. Please start it using :PyInterpreter')
    return
  end
  local code = table.concat(lines, '\n') .. '\n'
  vim.api.nvim_chan_send(vim.api.nvim_win_get_var(py_win, 'terminal_job_id'), code)
end

return M

