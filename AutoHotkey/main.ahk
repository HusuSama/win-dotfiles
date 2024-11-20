#Requires AutoHotkey v2.0

#UseHook true

; 窗口左上角位置
POS_X := 10
POS_Y := 10
; 是否去除任务栏高度（去除表示需要显示任务栏）
INCLUDE_TASK_TOOL := true

; 所有需要平铺显示效果的程序
TilingWindows := [
    "ahk_exe Code.exe", 
    "ahk_class MozillaWindowClass", 
    ; "ahk_class org.wezfurlong.wezterm",
    "ahk_exe Chrome.exe"
]

; 将设置的程序添加到组中
for index, app in TilingWindows
    GroupAdd("Tiling", app)

; 计算去除边距的窗口大小
CalWindowSize(pos_x, pos_y) {
    ; 获取主屏幕分辨率
    full_width := A_ScreenWidth
    full_height := A_ScreenHeight
    ; 获取任务栏的数据
    WinGetPos(&x, &y, &w, &h, "ahk_class Shell_TrayWnd")
    ; 计算窗口最大宽度
    win_width := full_width - (pos_x + pos_x)
    ; 计算窗口最大高度，根据 INCLUDE_TASK_TOOL 值决定是否需要去除任务栏高度
    if INCLUDE_TASK_TOOL
        win_height := full_height - (pos_y + pos_y + h)
    else
        win_height := full_height - (pos_y + pos_y)
    return {width: win_width, height: win_height}
}

; 实例化，窗口数据作为全局变量
SIZE := CalWindowSize(POS_X, POS_Y)
WIN_WIDTH := SIZE.width
WIN_HEIGHT := SIZE.height

; ===============================================================================


#Include WinEvent.ahk
#Include keymap.ahk


; 监测是否有组中的窗口打开，如果打开则对窗口进行大小和位置设置
ResizeTilingWindows(eventObj, hwnd, dwmsEventTime) {
    try {
        WinWait("ahk_group Tiling")
        WinRestore()
        WinMove(POS_X, POS_Y, WIN_WIDTH, WIN_HEIGHT)
    } catch {
        return
    }
}

; 使用 WinEvent 进行窗口的监听
WinEvent.Create(ResizeTilingWindows, "ahk_group Tiling")






