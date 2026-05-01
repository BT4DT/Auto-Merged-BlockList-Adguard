#!/bin/bash

rm -f merged.txt raw.txt clean.txt whitelist.txt final.txt

# ===== list =====
urls=(
# =========== General
# ===1Hosts lite
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_24.txt"
# === AGuard DNS filter
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt"
# === AdGuard DNS Popup Hosts Filter
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_59.txt"
# === AWAvenue Ads Rule
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_53.txt"
# === Dan Pollock's List
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_4.txt"
# === HaGeZi's Normal Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_34.txt"
# === HaGeZi's Pro Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_48.txt"
# === OISD Blocklist Small
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_5.txt"
# === Peter Lowe's Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_3.txt"
# === Steven Black's List
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_33.txt"
# =========== Other
# === Dandelion Sprout's Anti Push Notifications
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_39.txt"
# === Dandelion Sprout's Game Console Adblock List
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_6.txt"
# === HaGeZi's Anti-Piracy Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_46.txt"
# === HaGeZi's Gambling Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_47.txt"
# === HaGeZi's Windows/Office Tracker Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_63.txt"
# === Perflyst and Dandelion Sprout's Smart-TV Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_7.txt"
# === ShadowWhisperer's Dating List
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_57.txt"
# === Ukrainian Security Filter
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_62.txt"
# =========== Regional
# === IRN: PersianBlocker list
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_19.txt"
# === TUR: turk-adlist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_26.txt"
# === TUR: Turkish Ad Hosts
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_40.txt"
# =========== Security
# === hishing URL Blocklist (PhishTank and OpenPhish
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_30.txt"
# === Dandelion Sprout's Anti-Malware List
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_12.txt"
# === HaGeZi's Badware Hoster Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_55.txt"
# === HaGeZi's DynDNS Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_54.txt"
# === HaGeZi's The World's Most Abused TLDs
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_56.txt"
# === NoCoin Filter List
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_8.txt"
# === Phishing Army
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_18.txt"
# === Scam Blocklist by DurableNapkin
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_10.txt"
# === ShadowWhisperer's Malware List
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_42.txt"
# === Stalkerware Indicators List
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_31.txt"
# === The Big List of Hacked Malware Web Sites
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt"
# === uBlocko filters - Badware risks
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_50.txt"
# === Malicious URL Blocklist
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt"
)

for url in "${urls[@]}"; do
  curl -sL "$url" >> raw.txt
done

# ===== extract domain =====
grep -Eo '([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}' raw.txt > clean.txt

# ===== Del junk =====
grep -vE 'localhost|localdomain|broadcasthost' clean.txt > tmp.txt

# ===== convert adblock =====
sed 's/^/||/' tmp.txt | sed 's/$/^/' > merged.txt

# ===== Del duplicate =====
sort -u merged.txt > merged_clean.txt

# ===== Make whitelist =====
cat <<EOF > whitelist.txt
@@||google.com^
@@||gstatic.com^
@@||cloudflare.com^
@@||cloudflare-dns.com^
@@||dnsforge.de^
EOF

# ===== Final =====
cat whitelist.txt merged_clean.txt > final.txt

# ===== Export =====
mv final.txt merged.txt

# ===== Clean =====
rm raw.txt clean.txt tmp.txt merged_clean.txt whitelist.txt
