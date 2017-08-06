#!/bin/bash
read -p "Enter your telegram token: " telegramToken
read -p "Enter your chat ID: " chatID
for i in {100..99999}
do
echo "Checking $i.ir"
whois "$i.ir" &> /dev/null
if [ "$?" == "1" ]
then
textMessage=`echo "$i.ir is available for register"`
curl -X POST https://api.telegram.org/bot$telegramToken/sendMessage -d "text=$textMessage" -d "chat_id=$chatID"
fi
for j in {10..1}
do
echo -ne "waiting $j seconds\r"
sleep 1
done
done
