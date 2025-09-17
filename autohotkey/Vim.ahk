#Requires AutoHotkey v2.0+
#SingleInstance Force

; Variabel global untuk melacak status penukaran tombol.
keysSwapped := false

; Fungsi untuk menghilangkan notifikasi ToolTip
RemoveToolTip() {
    ToolTip()
}

; Hotkey untuk memicu penukaran tombol (!1 berarti Alt + 1)
!1::
{
    ; ==> BARIS INI ADALAH PERBAIKANNYA <==
    ; Beri tahu fungsi hotkey ini untuk merujuk ke variabel global.
    global keysSwapped

    ; Toggle (membalik) nilai variabel boolean
    keysSwapped := !keysSwapped

    ; Memberikan notifikasi visual mengenai status saat ini
    if (keysSwapped) {
        ToolTip("Tombol CapsLock dan Escape TELAH DITUKAR.")
    } else {
        ToolTip("Tombol CapsLock dan Escape KEMBALI NORMAL.")
    }

    ; Atur timer untuk menjalankan fungsi RemoveToolTip setelah 2 detik
    SetTimer(RemoveToolTip, -2000)
}

; Direktif #HotIf untuk hotkey kontekstual.
#HotIf keysSwapped
    CapsLock::Escape
    Escape::CapsLock
#HotIf