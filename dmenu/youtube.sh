#!/bin/bash

vidlist=$(echo "
Hyperdrive - A Cyberpunk Mix;https://www.youtube.com/watch?v=QAUnDw9qAsI
Beyond - A Chillwave Mix;https://www.youtube.com/watch?v=vQzqTTaWefY
Cyberscape - A Synthwave Mix;https://www.youtube.com/watch?v=hIPgqCKMUkY
Horizon - A Cyberpunk Mix;https://www.youtube.com/watch?v=-bWsa22VdHI
Spaceman - A Chillwave Mix;https://www.youtube.com/watch?v=0WfU2w-qB5I
2077 - A Cyberpunk Mix;https://www.youtube.com/watch?v=NbBcBJHiBgY
Turbo Kid - A Synthwave Mix;https://www.youtube.com/watch?v=Qr_UbzqpaI4
Miami Nights - A Synthwave Mix;https://www.youtube.com/watch?v=oDax2eMTmtA
Voyage - A Chillwave Mix;https://www.youtube.com/watch?v=4iZTNUnrh0k
Nova - Best of Synthwave;https://www.youtube.com/watch?v=-00d_EXjhtM
Arrival - A Synthwave Mix;https://www.youtube.com/watch?v=gXlwCEU_4t8
Night Drive - A Chillwave Mix;https://www.youtube.com/watch?v=emNgfuw8vlA
Outrun - A Cyberpunk Mix;https://www.youtube.com/watch?v=DGkzmd66oaY
Waves - A Chillwave Mix;https://www.youtube.com/watch?v=kwLTw8F8yN8
Blade - A Synthwave Mix;https://www.youtube.com/watch?v=O0gdKb65FbI
Cybercity - A Synthwave Mix;https://www.youtube.com/watch?v=dgCnYsDTiXU
Ethereal - A Synthwave Mix;https://www.youtube.com/watch?v=sN9OxR-JTn4
Andromeda - A Synthwave Mix;https://www.youtube.com/watch?v=RqBWaerFAtA
Bleed - A Cyberpunk Mix;https://www.youtube.com/watch?v=4g7wqFjGf4s
Hologram - A Synthwave Mix;https://www.youtube.com/watch?v=QPg0aA4Fn2E
Martian - A Synthwave Mix;https://www.youtube.com/watch?v=vWwXKWCkeKM
Rising - A Chill Mix;https://www.youtube.com/watch?v=dGvmQ2UQ-Z8
Retrolad - A Synthwave Mix;https://www.youtube.com/watch?v=NXZUpO2t5WM
Tokyo Nights - A Synthwave Mix;https://www.youtube.com/watch?v=LZZDZBhNyhc
Immortal - A Synthwave Mix;https://www.youtube.com/watch?v=VUCWxn4vb4Y
Monolith - A Synthwave Mix;https://www.youtube.com/watch?v=7q1bbRzNQmI
Dystopia - A Synthwave Mix;https://www.youtube.com/watch?v=2T7Wx1cUDoU
Journey - A Synthwave Mix;https://www.youtube.com/watch?v=3j87URmPMj4
Miami Girl - Hip-hop / Chill / Lo-fi Mix;https://www.youtube.com/watch?v=_Jl-LCQ7-yI
Summer Suicide - Dark Synthwave Mix;https://www.youtube.com/watch?v=jif2KKH7-2U
Dreams - A Synthwave Mix;https://www.youtube.com/watch?v=SX8aGqs5Jyg
Night Drive - A Synthwave Mix;https://www.youtube.com/watch?v=YP9nrR-ym3c
Sunset City - A Synthwave Mix;https://www.youtube.com/watch?v=oquatvvKyBc
Miami Coast - A Synthwave Mix;https://www.youtube.com/watch?v=69j8VyFcd10
Death Star — A Synthwave Mix;https://www.youtube.com/watch?v=O5-razOcCRE
Alone — A Sad Lo-fi, Chillwave Mix;https://www.youtube.com/watch?v=mkTL9lX_toc
Portal — A Synthwave Mix;https://www.youtube.com/watch?v=gQ6m9w6mcjU
Voyage — A Synthwave Mix;https://www.youtube.com/watch?v=Xg_k7GX2iFQ
Titan — A Synthwave Mix;https://www.youtube.com/watch?v=IRGCwuYugy0
Starship - A Synthwave Mix;https://www.youtube.com/watch?v=6lBg2EEty24
Cyber Dream — A Synthwave Mix;https://www.youtube.com/watch?v=BYINA7W7TFg
Future Girl — Best of Synthwave 2018 — Mix;https://www.youtube.com/watch?v=T1CowKULMx8
Lust - A Darksynth Mix;https://www.youtube.com/watch?v=BBS19XhW1_U
Simpson Wave;https://www.youtube.com/watch?v=miljaY0Dak4
Caravan Palace 60 minute mix;https://www.youtube.com/watch?v=kRDJ5FnxZHg
Small Red Boy;https://www.youtube.com/watch?v=nNeNn_KETIg
No More Shame, No More Fear, No More Dread;https://www.youtube.com/watch?v=rsIHSe3IKTM
Moonlight Sonata;https://www.youtube.com/watch?v=4Tr0otuiQuU
Roads;https://www.youtube.com/watch?v=FRPeYP6gS-s https://www.youtube.com/watch?v=1vrEljMfXYo
" | sed '/^$/ d')

vidname="$(echo "$vidlist" | cut -d';' -f1 | dmenu -i -p "Which video? (type: \"shuff\" to pick at random)" -l $(echo "$vidlist" | wc -l))"

if [ "$vidname" = "shuff" ]; then
    vid=$(echo "$vidlist" | shuf | sed '1q' | cut -d';' -f2)
else
    vid="$(echo "$vidlist" | grep -P "^$vidname;" | cut -d';' -f2)"
fi
[ "$vid" = "" ] && exit

p=$(echo -e "no\nyes" | dmenu -i -p "With video?")

if [ "$p" == "yes" ]
then
    mpv $vid
elif [ "$p" == "no" ]
then
    cmd="echo -e ' '; youtube-dl --get-title $vid; mpv --input-ipc-server=/tmp/mpvsocket --no-video $vid"
    urxvt -title 'my-media-player' -e bash -c "$cmd"
fi

