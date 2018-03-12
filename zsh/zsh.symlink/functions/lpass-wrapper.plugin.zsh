# lpass-wrapper.sh

function lpass-wrapper {
username=${LPASSUSER}

lpstatus=$(lpass status)

if [ $? -ne 0 ]
then
    if [ "$lpstatus" = 'Not logged in.' ]
    then
	# Make sure DISPLAY is set
	DISPLAY=${DISPLAY:-:0} lpass login "$username" 1>&2
    else
	echo "Lastpass error: $lpstatus" 1>&2
	exit 1
    fi
fi

lpass $@

}
