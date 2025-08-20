alias l='ls -lah'
alias ll='ls -lah'

batdiff() {
	  git diff --name-only --relative --diff-filter=d -z $1 | xargs --null bat --diff
}

notify() {
	  nohup bash -c 'timeSent=$(date +"%H:%M");sleep "$(($1*60))"; notify-send -a "$timeSent - $(date +"%H:%M")" -u critical " $2"' dummy "$1" "$2" >/dev/null 2>&1 & disown
}

htbip() {
    ip a | grep -oP '10\.10\.\d+\.\d+' | head -n1
}

upgtty() {
    echo 'script -q /dev/null -c bash'
}

addhost() {
    if [ $# -ne 2 ]; then
        echo "Usage: addhost <IP> <domain>"
        return 1
    fi
    echo "$1 $2" | sudo tee -a /etc/hosts > /dev/null
    cat /etc/hosts
}

restorehosts() {
    echo "127.0.0.1        localhost" | sudo tee /etc/hosts > /dev/null
    echo "::1              localhost" | sudo tee -a /etc/hosts > /dev/null
    cat /etc/hosts
}

settargetip() {
    echo "$1" > ~/.targetip
    export targetip="$1"
}
