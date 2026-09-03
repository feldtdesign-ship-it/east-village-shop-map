#!/bin/sh
# Wraps the map page in a full HTML document with link-preview (Open Graph) tags.
# Usage: ./build.sh ../east-village-retail-map.html
SRC="${1:-../east-village-retail-map.html}"
BASE="https://feldtdesign-ship-it.github.io/east-village-shop-map"
{
cat <<HEAD
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Rents, competitors, shoppers and seasons for an apparel & art shop in the East Village, Manhattan. Sept 2026.">
<meta property="og:type" content="website">
<meta property="og:site_name" content="Feldt Design">
<meta property="og:title" content="East Village Storefront Map">
<meta property="og:description" content="Rents, competitors, shoppers and seasons for an apparel & art shop in the East Village. Sept 2026.">
<meta property="og:url" content="$BASE/">
<meta property="og:image" content="$BASE/og.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="Black subway-signage card reading East Village Storefront Map with a beige schematic street grid and colored route bullets">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="East Village Storefront Map">
<meta name="twitter:description" content="Rents, competitors, shoppers and seasons for an apparel & art shop in the East Village. Sept 2026.">
<meta name="twitter:image" content="$BASE/og.png">
<link rel="icon" type="image/png" sizes="512x512" href="icon.png">
<link rel="apple-touch-icon" href="icon.png">
<meta name="theme-color" content="#000000">
HEAD
# title + style from the source (everything up to </style>)
sed -n '1,/<\/style>/p' "$SRC"
echo "</head>"
echo "<body>"
sed '1,/<\/style>/d' "$SRC"
echo "</body>"
echo "</html>"
} > index.html
echo "built index.html ($(wc -c < index.html) bytes)"
