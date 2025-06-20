---
layout: post
title: "Your-bluetooth-might-be-affecting-your-wifi-speed"
date:   2025-06-20
categories: topic 
---

## pre-context
So for a while i was using my macbook M1 as my main workstation. But during my degree, for a project 
i had to switch back to my lenovo linux laptop. It was just sitting in the shelf's so i had to update all the packages.

to give a context about my setup - i have one monitor, one "wired" mouse, one "bluetooth" keyboard and
one "bluetooth" headphone. 

**NOTE**: the keyword "bluetooth" is very important here.

## Issue
The issue was when i was using chrome browser to browse internet as first the speed is around 90-100 Mbps but  the moment i connect my keyboard and headphone it drops to 1 Mbps. Before actually noticing this, i had trying everything to fix my wifi speed like updating my ubuntu from 18 to 20 version and edited network files but nothing worked. Then i found this [reddit blog](https://www.reddit.com/r/linuxquestions/comments/1dz2bgx/playing_audio_through_bluetooth_drops_or_slows/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)


Device bluetooth and 4G wifi runs on the same 2.4GHz band which is why maybe due to some internal OS conflict, it was dropping my wifi speed.

## solution
To resolve this issue, i had 3 options
1. buy 5g wireless dongal - 
	- pro
		- so that wifi driver runs on different band and i can use my bluetooth in peace
	- cons
		- installation can result in failure.
		
2. buy wired keyboard
	- pro
		- easy plug and play
	- cons
		- price

3. buy bluetooth dongal
	- pro
		- cheap
	- cons
		- installation don't know


I choose the 1st option because i wanted fast internet speed, atleast 150 Mbps same as my mac machine.

I bought [tp-link AC1300 (Archer T3U)](https://www.amazon.de/-/en/TP-Link-T3U-Adapter-802-11ac-supports/dp/B07M69276N?th=1)


## Now, How to install the driver for it on my device?

My device lenovo machine spec's  

```
machine@ubuntu:~/rtl88x2bu$ neofetch 
            .-/+oossssoo+/-.               vagrant@cf 
        `:+ssssssssssssssssss+:`           ---------- 
      -+ssssssssssssssssssyyssss+-         OS: Ubuntu 20.04.6 LTS x86_64 
    .ossssssssssssssssssdMMMNysssso.       Host: 20404 Lenovo Flex 2-14 
   /ssssssssssshdmmNNmmyNMMMMhssssss/      Kernel: 5.4.0-216-generic 
  +ssssssssshmydMMMMMMMNddddyssssssss+     Uptime: 1 hour, 34 mins 
 /sssssssshNMMMyhhyyyyhmNMMMNhssssssss/    Packages: 2952 (dpkg), 6 (flatpak), 20 (snap) 
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Shell: bash 5.0.17 
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   Resolution: 2560x1440 
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   DE: GNOME 
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   WM: Mutter 
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   WM Theme: Adwaita 
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Theme: Yaru-dark [GTK2/3] 
 /sssssssshNMMMyhhyyyyhdNMMMNhssssssss/    Icons: Yaru [GTK2/3] 
  +sssssssssdmydMMMMMMMMddddyssssssss+     Terminal: gnome-terminal 
   /ssssssssssshdmNNNNmyNMMMMhssssss/      CPU: Intel i3-4030U (4) @ 1.900GHz 
    .ossssssssssssssssssdMMMNysssso.       GPU: Intel Haswell-ULT 
      -+sssssssssssssssssyyyssss+-         Memory: 3375MiB / 15904MiB 
        `:+ssssssssssssssssss+:`
            .-/+oossssoo+/-.                                       

```

first i tired the steps mentioned in [github here](https://gist.github.com/julianlam/0ce7692ca10fb91970b6693bc02587ce)

After reboot, there was no option in wifi setting to switch to tp-link also the led status on the usb was not 
blinking.


Second option i tried - [ask ubuntu](https://askubuntu.com/a/1392223) which did work and also no reboot required here.

goes something like (pasting it here, if the link expires)
```
git clone https://github.com/cilynx/rtl88x2bu

sudo make

sudo insmod 88x2bu.ko

```

### Success - GREEN blink LED status

<img src="https://uc96208b84d290d001ff81bade18.previews.dropboxusercontent.com/p/thumb/ACr3KOUkPsa68DK5_jscrxcX4cKHtfOV21EVr48bV1AOA6aRYJu5_BQa04Gfbs_lMYaUDHSpo6phYIuoX8vt9GRKzPP3ffgdSIRJ09O3njCtO3U1GJY0R579T-zMMY940LxXSljboQjXjg9UK2Z_acbfqx0O3tdfnITc_us2rjHJkJU43HBkVKu6T0coyruWjaNfF5tH7IWvylhYDhma9Oo1nmmX-6XVLggT1GyhKmxAP5WjyiNzYYuStcOjD1qkrDnPgHnsBmmz7dwlHHky1f8yyLbiUen0HSp9_KYmqXyqAqWHOTBqGzfam7WoRqp-SC5VgPXQdnVnRMf1q29Eedl84Rn_itIWrQHcorWNtdywYD7ZU9TfkWpsKjMiihzjf7I/p.jpeg?is_prewarmed=true" />

 