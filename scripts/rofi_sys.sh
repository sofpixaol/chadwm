call_menu() {
    case $(echo -e ' 关机\n 重启\n 休眠\n 锁定' | rofi -dmenu -window-title power) in
        " 关机") poweroff ;;
        " 重启") reboot ;;
        " 休眠") systemctl hibernate ;;
        " 锁定") ~/scripts/blurlock.sh ;;
    esac
}
execute_menu "$(call_menu | rofi -dmenu -p "")"
