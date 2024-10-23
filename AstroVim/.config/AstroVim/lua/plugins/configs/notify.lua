-- return function(_, opts)
--   local notify = require "notify"
--   notify.setup(opts)
--   vim.notify = notify
-- end
local opts = {
  stages = "static",
  render = "compact",
  max_width = 30,
  fps = 5,
  level = 1,
  timeout = 1000,
}
return opts
