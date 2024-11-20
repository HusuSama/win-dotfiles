local M = {}
local wezterm = require("wezterm")

--- 获取 nvim 启动设置的 user_vars 数据
--- @param pane wezterm.Pane
--- @return boolean
function M.is_nvim(pane)
    -- return pane:get_user_vars().IS_NVIM == "true" or pane:get_foreground_process_name():find("n?vim")
    return pane:get_user_vars().IS_NVIM == "true"
end

return M
