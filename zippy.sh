#!/bin/bash
G=$(tput setaf 2)
R=$(tput setaf 1)
Y=$(tput setaf 3)
C=$(tput setaf 6)
N=$(tput sgr0)
M=$(tput bold)
A='Mozilla/5.0 (Linux; Android 8.1.0; CPH1823) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Mobile Safari/537.36'
function ngere(){
     requests=$(curl -s -X GET -H "Host: zippyshare.com" -H "Connection: keep-alive" \
    -H "User-Agent: ${A}" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" --url "https://zippyshare.com/" -I)
     setcooookiie=$(printf "%s\n" "${requests}"|grep -Po '(?<=JSESSIONID=)[^,]*'|gawk '{print $1}')
}
function ngerewt(){
ngere;
        requests=$(curl -s -X GET -H "Host: zippyshare.com" -H "Connection: keep-alive" \
    -H "User-Agent: ${A}" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8" \
    -H "Cookie: JSESSIONID=${setcooookiie}" --url "https://zippyshare.com/")
             u=$( printf "%s\n" "$requests")
}
function regexxxxx(){
ngerewt;
            oooh=$(echo -e "$u" | grep -oP 'form-data" action="(.*?)"'| cut -d '"' -f3)
             ooh1=$(echo -e "$u" |grep -oP 'name="uploadId" value="(.*?)"'| cut -d '"' -f4)
              #
requests=$(curl -s -X POST -H "User-Agent: ${A}" -H "Referer: https://zippyshare.com/" "${oooh}" -F "uploadid=$ooh1" -F "files=@$filess")
           printf "%s" "${requests}" | grep -Po "http(s:)//{1}.*?file.html[^']*"|head -1|sed 's/<[^>]*>/ /g'
}
echo -e "

${M}	 ▄███████▄   ▄█     ▄███████▄    ▄███████▄ ▄██   ▄   
	██▀     ▄██ ███    ███    ███   ███    ███ ███   ██▄ 
	      ▄███▀ ███▌   ███    ███   ███    ███ ███▄▄▄███ 
	 ▀█▀▄███▀▄▄ ███▌   ███    ███   ███    ███ ▀▀▀▀▀▀███ 
	  ▄███▀   ▀ ███▌ ▀█████████▀  ▀█████████▀  ▄██   ███ 
	▄███▀       ███    ███          ███        ███   ███ 
	███▄     ▄█ ███    ███          ███        ███   ███ 
	 ▀████████▀ █▀    ▄████▀       ▄████▀       ▀█████▀  

			  «    K I W Z    »



"
read -p "${Y}[?] File •>${C} " filess
if [[ -e $filess ]]; then
     regexxxxx
     exit
else
     echo -e "${R}[;] File Not Found !"
fi
