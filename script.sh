curl -s "https://crt.sh/?q=ngrok.io" > domains.txt
grep -R "ngrok.io" "domains.txt" > list.txt
sed -i "s+</TD>++" list.txt
sed -i "s+<TD>++" list.txt
sed -i "s+<BR>+\\n+" list.txt
sed -i 's/\s\+//g' list.txt
input="list.txt"
while IFS= read -r line
do
curl -s "https://$line" | if grep -q "not found"; then
    echo "$line not found"
else
    echo -e " $(tput setaf 2) $line found  $(tput setaf 7)"
fi
done < "$input"
