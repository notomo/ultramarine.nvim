local ntf = require("ntf")
local it = ntf.it
it("colorscheme command raises no error", function()
  vim.cmd.colorscheme("ultramarine")
end)
