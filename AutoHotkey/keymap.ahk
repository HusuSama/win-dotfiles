WeztermRunAndResize() {
    Run "D:\WezTerm\wezterm-gui.exe"
    WinWait("ahk_class org.wezfurlong.wezterm")
    ; WinWait("pwsh.exe", "", 500)
    WinMove(POS_X, POS_Y, WIN_WIDTH, WIN_HEIGHT)
}

; win + \ 打开 wezterm 
#\::{
    ; Run "D:\WezTerm\wezterm-gui.exe"
    WeztermRunAndResize()
}

; 使用win + j/k 来切换桌面
#^j::SendInput("#^{Right}")
#^k::SendInput("#^{Left}")
; 使用 win + n 来创建新桌面
#^n::SendInput("#^{d}")

; #HotIf WinActive("ahk_class Shell_TrayWnd")
; 使用 win + 鼠标滚轮切换桌面
#^WheelDown::SendInput("#^{Right}")
#^WheelUp::SendInput("#^{Left}")
; all_desktop := RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops", "VirtualDesktopIDs")
; current_desktop_id_len := RegRead("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops", "CurrentVirtualDesktop")
; wins := WinGetList()

; win + q 关闭程序
#q::SendInput("!{F4}")
