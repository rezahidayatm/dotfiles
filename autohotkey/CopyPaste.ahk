; === SKRIP UNTUK AUTOHOTKEY v2 ===

; Deskripsi:
; - Tekan XButton2 (tombol mouse "Back") untuk menyalin (Ctrl+C).
; - Tahan SHIFT lalu tekan XButton2 untuk menempelkan teks tanpa format (Ctrl+Shift+V).

; Remap XButton2 untuk mengirim Ctrl+C
XButton2::Send("^c")

; Remap Shift + XButton2 untuk mengirim Ctrl+Shift+V
XButton1::Send("^v")
+XButton1::Send("^+v")