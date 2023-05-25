require("local")
require("local.remap")
require("local.packer")
require("local.set")

vim.cmd([[
  command! PyInterpreter lua require('local.py_interpreter').start_interpreter()
  command! PySendCode lua require('local.py_interpreter').send_code()
]])

