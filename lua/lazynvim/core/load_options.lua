local default = require 'lazynvim.options.default_opt'.default
--local user = require 'lazynvim.options.user_opt'.user


local options = default

local function set_option(mode, key, value, ...)
  vim[mode][key] = value
end

--vim.tbl_isempty(user_Plugins)
--vim.tbl_deep_extend("force", conf, change)
--vim.tbl_extend("force", conf, change)
if not default then
  return
end

for _, option in pairs(options) do
    set_option(unpack(option))
end

