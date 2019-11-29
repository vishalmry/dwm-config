#! /bin/bash
compton --config ~/.config/compton-LETMEUSE-tryone.conf &
nitrogen --restore &
xset r rate 300 60 &
(pulseaudio --start) &
(xfce4-volumed-pulse) &
xfce4-power-manager &

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf "🔌 %s%% %s" "$CHARGE" "$STATUS"
        else
            printf "🔋 %s%% %s" "$CHARGE" "$STATUS"
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dte(){
    dte="$(date +"%A, %B %d | %l:%M%p")"
    # dte="$(date)"
    echo -e "$dte"
}

while true; do
    xsetroot -name "$(dwm_battery) | $(dte)"
    sleep 1m    # Update time every minute
done &

