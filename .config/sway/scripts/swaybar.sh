#!/bin/sh


# Prints out the volume percentage

VOLUME_ON_ICON=''
VOLUME_MUTED_ICON=''

get_volume(){
    volume=$(pamixer --get-volume)
    mute=$(pamixer --get-mute)
    volume_icon=$VOLUME_ON_ICON
    [ "$mute" = "true" ] && volume_icon=$VOLUME_MUTED_ICON
    echo "$volume_icon $volume%"
}

# Prints out the date

get_date()
{
    echo "$(date '+%a %d/%m %H:%M')"
}

# Prints out language

get_language()
{
    language=$(swaymsg -r -t get_inputs | grep -m 1 'xkb_active_layout_name' | awk -F '"' '{print $4}')

    if [ "$language" = "Russian" ]; then
        echo "РУС"
    else
        echo "ENG"
    fi
}

# Prints the total ram and used ram in Mb

RAM_ICON=''


get_ram()
{
    used_ram=$(free -mh --si | awk '/^Mem:/{print $3}')
    echo "$RAM_ICON $used_ram"
}


PLAY_ICON=''
PAUSE_ICON=''

get_mpd()
{
    current_song="$(mpc current)"

    if [ "$current_song" ]; then
        playpause=$(mpc | awk 'NR==2{print $1}')
        player_icon=$PLAY_ICON
        [ "$playpause" = "[paused]" ] && player_icon=$PAUSE_ICON
    fi

    echo "$player_icon $current_song"
}

volume_status=$(get_volume)
current_date=$(get_date)
current_language=$(get_language)
current_ram=$(get_ram)
current_song=$(get_mpd)


echo "$current_song   $current_language   $current_ram   $volume_status   $current_date "

