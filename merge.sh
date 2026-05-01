#!/bin/bash

rm -f merged.txt raw.txt clean.txt whitelist.txt final.txt

# ===== list =====
urls=(
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_24.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_59.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_53.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_4.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_34.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_48.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_5.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_3.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_33.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_39.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_6.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_46.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_47.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_63.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_7.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_57.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_62.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_19.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_26.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_40.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_30.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_12.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_55.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_54.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_56.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_8.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_18.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_10.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_42.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_31.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt"
"https://adguardteam.github.io/HostlistsRegistry/assets/filter_50.txt"
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
