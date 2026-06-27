#!/bin/bash

rm -f raw.txt merged_clean.txt final.txt whitelist.txt

# ===== list =====
urls=(
# =========== Adguard: General
# === 🟢 1Hosts lite -filter_24.txt :: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_24.txt"
# === X 🔴 1Hosts mini -filter_38.txt:: Adguard
#https://adguardteam.github.io/Hoassets/filter_38.txt"
# === 🟢  AGuard DNS filter -filter_1.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt"
# === 🟢  AdGuard DNS Popup Hosts Filter -filter_59.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_59.txt"
# === 🟢  AWAvenue Ads Rule -filter_53.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_53.txt"
# === 🟢  Dan Pollock's List -filter_4.txt :: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_4.txt"
# === 🟢  HaGeZi's Normal Blocklist -filter_34.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_34.txt"
# === X 🔴  HaGeZi's Pro Blocklist -filter_48.txt:: Adguard
# "https://adguardteam.github.io/HostlistsRegistry/assets/filter_48.txt"
# === X 🔴 HaGeZi's Pro++ Blocklist -filter_51.txt :: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_51.txt"
# === X 🔴 HaGeZi's Ultimate Blocklist -filter_49.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_49.txt"
# === X 🔴  OISD Blocklist Small -filter_5.txt:: Adguard
# "https://adguardteam.github.io/HostlistsRegistry/assets/filter_5.txt"
# === X 🔴 OISD Blocklist Big -filter_27.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_27.txt"
# === 🟢  Peter Lowe's Blocklist -filter_3.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_3.txt"
# === X 🔴  SHadowWhisperer Tracking list -filter_69.txt:: Adguard
# "https://adguardteam.github.io/HostlistsRegistry/assets/filter_69.txt"
# === 🟢  Steven Black's List -filter_33.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_33.txt"
# =========== ADG Other :: Adguard
# === 🟢  Dandelion Sprout's Anti Push Notifications -filter_39.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_39.txt"
# === 🟢  Dandelion Sprout's Game Console Adblock List -filter_6.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_6.txt"
# === X 🔴 HaGeZi's Allowlist Referral -filter_45.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_45.txt"
# === 🟢  HaGeZi's Anti-Piracy Blocklist -filter_46.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_46.txt"
# === X 🔴  HaGeZi's Apple Trcker -filter_67.txt:: Adguard
# "https://adguardteam.github.io/HostlistsRegistry/assets/filter_67.txt"
# === X 🔴  HaGeZi's Gambling Blocklist -filter_47.txt:: Adguard
# "https://adguardteam.github.io/HostlistsRegistry/assets/filter_47.txt"
# === X 🔴 HaGeZi's OPOO & Realme Tracker Blocklist -filter_66.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_66.txt"
# === X 🔴 HaGeZi's Samsung Tracker Blocklist -filter_61.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_61.txt"
# === X 🔴 HaGeZi's Vivo Tracker Blocklist -filter_65.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_65.txt"
# === 🟢  HaGeZi's Windows/Office Tracker Blocklist -filter_63.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_63.txt"
# === X 🔴 HaGeZi's Xiaomi Tracker Blocklist -filter_60.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_60.txt"
# === X 🔴 No Google -filter_37.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_37.txt"
# === 🟢  Perflyst and Dandelion Sprout's Smart-TV Blocklist -filter_7.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_7.txt"
# === 🟢  ShadowWhisperer's Dating List -filter_57.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_57.txt"
# === 🟢  Ukrainian Security Filter -filter_62.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_62.txt"
# =========== ADG Regional
# === X 🔴 CHN: AdRules DNS List -filter_29.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_29.txt"
# === X 🔴 CHN: anti-AD -filter_21.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_21.txt"
# === X 🔴 HUN: Hufilter -filter_35.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_35.txt"
# === X 🔴 IDN: ABPindo -filter_22.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_22.txt"
# === 🟢  IRN: PersianBlocker list -filter_19.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_19.txt"
# === X 🔴 ISR: EasyList Hebrew -filter_43.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_43.txt"
# === X 🔴 KOR: List-KR DNS -filter_25.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_25.txt"
# === X 🔴 KOR: YousList -filter_15.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_15.txt"
# === X 🔴 LIT: EasyList Lithuania -filter_36.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_36.txt"
# === X 🔴 MKD: Macedonian Pi-hole Blocklist  -filter_20.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_20.txt"
# === X 🔴 NOR: Dandelion Sprouts nordiske filtre -filter_13.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_13.txt"
# === X 🔴 POL: CERT Polska List of malicious domains -filter_41.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_41.txt"
# === X 🔴 POL: Polish filters for Pi-hole -filter_14.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_14.txt"
# === X 🔴 SWE: Frellwit's Swedish Hosts File -filter_17.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_17.txt"
# === X 🔴  TUR: turk-adlist -filter_26.txt:: Adguard
# "https://adguardteam.github.io/HostlistsRegistry/assets/filter_26.txt"
# === X 🔴  TUR: Turkish Ad Hosts -filter_40.txt:: Adguard
# "https://adguardteam.github.io/HostlistsRegistry/assets/filter_40.txt"
# === X 🔴 VNM: ABPVN List -filter_16.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_16.txt"
# =========== ADG Security :: Adguard
# === 🟢  phishing URL Blocklist (PhishTank and OpenPhish -filter_30.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_30.txt"
# === 🟢  Dandelion Sprout's Anti-Malware List -filter_12.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_12.txt"
# === 🟢  HaGeZi's Badware Hoster Blocklist -filter_55.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_55.txt"
# === 🟢  HaGeZi's DNS Rebind hoster Blocklist -filter_71.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_71.txt"
# === 🟢  HaGeZi's DynDNS Blocklist -filter_54.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_54.txt"
# === X 🔴 HaGeZi's Encrypted DNS/VPN/TOR/Proxy Bypass -filter_54.txt :: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_54.txt"
# === 🟢  HaGeZi's The World's Most Abused TLDs -filter_56.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_56.txt"
# === X 🔴 HaGeZi's Threat Intelligence Feeds -filter_44.txt:: Adguard
#"https://adguardteam.github.io/HostlistsRegistry/assets/filter_44.txt"
# === 🟢  HaGeZi's URL Shortener Blocklist -filter_68.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_68.txt"
# === 🟢  NoCoin Filter List -filter_8.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_8.txt"
# === 🟢  Phishing Army -filter_18.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_18.txt"
# === 🟢  Scam Blocklist by DurableNapkin -filter_10.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_10.txt"
# === 🟢  ShadowWhisperer's Malware List -filter_42.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_42.txt"
# === 🟢  Stalkerware Indicators List -filter_31.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_31.txt"
# === 🟢  The Big List of Hacked Malware Web Sites -filter_9.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt"
# === 🟢  uBlocko filters - Badware risks -filter_50.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_50.txt"
# === 🟢  Malicious URL Blocklist -filter_11.txt:: Adguard
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt"
# =========== END
)

# ===== download =====
for url in "${urls[@]}"; do
  curl -sL "$url" >> raw.txt
  echo -e "\n" >> raw.txt
done

# ===== clean basic =====
grep -vE '^\s*$' raw.txt | \
grep -vE 'localhost|localdomain|broadcasthost' > cleaned.txt

# ===== remove duplicate =====
sort -u cleaned.txt > merged_clean.txt

# ===== whitelist =====
cat <<EOF > whitelist.txt
# ==== WHITELIST ====
# remove # to enable
@@||dnsforge.de^$important
@@||mymax.top^$important
@@||dnsz.in^$important
@@||plusiptv.dnsz.in^$important
@@||tvdns.top^$important
@@||plusiptv.tvdns.top^$important
@@||media-shop.top^$important
@@||filimo.com^$important
@@||namava.ir^$important
@@||filmnet.ir^$important
@@||snapp.site^$important
@@||aptel.ir^$important
@@||soft98.ir^$important
@@||github.com^$important
@@||tailscale.com^$important
@@||zerotier.com^$important
@@||tello.com^$important
@@||usmobile.com^$important
@@||goodcloud.xyz^$important
@@||astrowarp.net^$important
EOF

# ===== final =====
cat whitelist.txt merged_clean.txt > final.txt

mv final.txt merged.txt

# ===== clean =====
rm raw.txt cleaned.txt merged_clean.txt whitelist.txt
