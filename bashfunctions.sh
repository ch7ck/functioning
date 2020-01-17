# Functions!

#TODO:
#MAKE A FUNCTION TO DISABLE IPV6

function disable_ipv6() {
    printf "net.ipv6.conf.all.disable_ipv6 = 1\n\
net.ipv6.conf.default.disable_ipv6 = 1\n\
net.ipv6.conf.lo.disable_ipv6 = 1" \
| sudo tee /etc/sysctl.d/60-ipv6disable.conf ; 
    sudo sysctl -p -f /etc/sysctl.d/60-ipv6disable.conf ;
    cat /proc/sys/net/ipv6/conf/all/disable_ipv6  ; 
    test -f /proc/net/if_inet6 && echo "Running kernel is IPv6 ready" 
};


#SOMECOLORS for bash maybe??
norm="$(printf '\033[0m')" #returns to "normal"
boldred="$(printf '\033[0;1;31m')" # set bold and set red.
boldgreen="$(printf '\e[1;32;40m')"
yellowitl="$(printf '\e[3;30;43m')"

function show_colorz() {
    for x in {0..8}; do 
	for i in {30..37}; do 
	    for a in {40..47}; do 
		echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
	    done
	    echo
	done
    done
    echo ""
};


function gimmeIPinfo() { 
    curl -s --url "https://ifconfig.co/json" > $HOME/IpAddrInfo.json ;
    jq -j .ip $HOME/IpAddrInfo.json | xclip -i ;
    printf "Copied IP address to clipboard! use Shift+Insert to paste, your IP INFO\n" ;
    jq . $HOME/IpAddrInfo.json ; 
    
};

function gimmeSystemInfo() {
    printf "UNAME TIME!!\n\n========\n\n" ;
    uname -a ;
    printf "\n\n==========\n\nLSB-RELEASE INFO:\n==========\n" ;
    lsb_release -a ;
    printf "==========\nISSUES???:\n" ;
    cat /etc/issue ;
    cat /etc/issue.net ;
    printf "ARE WE ON DEBIAN?\n" ;
    cat /etc/debian_version ;
};

##Unixisms For debugging
#TimeTool
function epochconvert() {
    thedate=$(date -d @$1);
    thedateutc=$(date -u -d @$1);
    printf "\t\n Epoch Seconds ==> "
    printf "%s" "$boldred"; 
    printf "$1";
    printf "%s" "$norm"; 
    printf "\n\tis the following time locally:\n";
    printf "%s" "$boldgreen";
    printf "%s " "$thedate";
    printf "%s" "$norm";
    printf "\n\n\tUTC TIME is:\n";
    printf "%s" "$yellowitl";
    printf "%s " "$thedateutc";
    printf "%s" "$norm";
    printf "\n";
};

#Text viewing functions
function json_explorer() { 
    jq -C . $1 | less -R ;
};

echo "Functions were Loaded! View the functions by running a declare:"
typeset -F | grep -v 'declare -f _'
