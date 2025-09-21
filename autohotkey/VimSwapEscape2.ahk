#Requires AutoHotkey v2.0+
#SingleInstance Force

keysSwapped := false

RemoveToolTip() {
    ToolTip()
}

!1::
{
    global keysSwapped
    keysSwapped := true

    ToolTip("CapsLock: VIM")
    SetTimer(RemoveToolTip, -2000)
}

!2::
{
    global keysSwapped
    keysSwapped := false

    ToolTip("CapsLock: Normal")
    SetTimer(RemoveToolTip, -2000)
}

#HotIf keysSwapped
    CapsLock::Escape
    Escape::Escape
#HotIf
