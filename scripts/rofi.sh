# 打印菜单
call_menu() {
	echo ' set wallpaper'
	echo '艹 update statusbar'
	[ "$(systemctl status v2raya | grep running)" ] && echo ' close v2raya' || echo ' open v2raya'
	[ "$(ps aux | grep picom | grep -v 'grep\|rofi\|nvim')" ] && echo ' close picom' || echo ' open picom'
  echo '󰜬 open eww'
}

# 执行菜单
execute_menu() {
	case $1 in
	' set wallpaper')
		feh --randomize --bg-fill ~/Pictures/wallpaper/*.png
		;;
	'艹 update statusbar')
    coproc (killall bat.sh ; ~/.config/chadwm/scripts/bar.sh)
		;;
	' open v2raya')
		coproc (sudo systemctl start v2raya && $DWM/statusbar/statusbar.sh updateall >/dev/null)
		;;
	' close v2raya')
		coproc (sudo systemctl stop v2raya && $DWM/statusbar/statusbar.sh updateall >/dev/null)
		;;
	' open picom')
		coproc (picom --experimental-backends --config ~/scripts/config/picom.conf >/dev/null 2>&1)
		;;
	' close picom')
		killall picom
		;;
  '󰜬 open eww')
    eww open eww
		;;
	esac
}

execute_menu "$(call_menu | rofi -dmenu -p "")"
