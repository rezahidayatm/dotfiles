#!/bin/sh

# Kirim sinyal terminasi ke semua proses waybar
killall waybar

# Tunggu dalam loop sampai tidak ada lagi proses waybar yang berjalan
while pgrep -x waybar > /dev/null; do
    sleep 0.1
done

# Sekarang aman untuk menjalankan waybar baru
waybar -c "$1" &
