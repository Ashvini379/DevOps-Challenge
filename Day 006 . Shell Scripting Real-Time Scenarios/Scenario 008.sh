#!/bin/bash
sendEmail() {
    MSG_FROM=zac@server.it #Enter your mail id
    MSG_TO="zac@gmail.com" #Enter recepient email id
    MSG_SUBJ="Website down" #Enter email subject 
    SMTP_HOST="relay.zac.it" #Enter your smtp host
    SMTP_PORT="487" #Enter your smtp port
    MSG_BODY=("Following websites are down:\n\n $1")  #Enter email message body

echo -e $MSG_BODY | mailx -s "$MSG_SUBJ" -r "$MSG_FROM" -S smtp="$SMTP_HOST:$SMTP_PORT" "$MSG_TO"
}
downUrls=""
checkUrlStatus() {
    for url in $1
    do
        response= $(curl -is $url | head -n 1)
        if [[ ! $response =~ "200 OK" ]]; then
            downUrls+="$url\n"
        fi
    done
}
#Read urls from user
echo "Enter list of Urls:"
readarray -t urls
checkUrlStatus urls

#send email
if [[ -n $downUrls ]]; then
    sendEmail $downUrls
    echo "Email sent for down website"
else
    echo "Websites are up"
fi
