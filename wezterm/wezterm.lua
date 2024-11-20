local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 这种方式可以定义 lua 包的搜索路径
-- package.path = package.path .. ";" .. wezterm.config_dir .. "/?.lua"
-- wezterm.log_info("package路径：" .. package.path)
-- 如果windows系统，将其他模块放在配置的 wezterm 目录下，并添加查找的package.path
local platform = wezterm.target_triple
-- if platform:find("windows") then
--     package.path = package.path .. ";" .. wezterm.config_dir .. "/wezterm/?.lua"
-- end

require("network").setup(config)
require("font").setup(config)
require("keys").setup(config)
require("ui").setup(config)
-- 设置默认终端
if platform:find("linux") then
    -- linux 默认使用 fish
    config.default_prog = { "fish" }
elseif platform:find("windows") then
    -- Windows 默认使用 PowerShell 7
    config.default_prog = { "pwsh.exe" }
end

return config
