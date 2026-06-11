#!/bin/zsh
# Rebuild gallery.html from whatever images are in the gallery/ folder.
# Run from anywhere:  zsh build-gallery.sh
cd ~/Projects/Webpage || exit 1
setopt null_glob

{
cat <<'HEAD'
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Richard H. Taylor Gallery</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400&display=swap" rel="stylesheet">
<style>
  html{ font-size: 15px; }
  body{ margin: 0; background: #ffffff; color: #1a1a1a; font-family: "EB Garamond", Georgia, serif; font-weight: 400; font-size: 1rem; line-height: 1.7; }
  a{ color: #1a3e7a; }
  a:hover{ color: #000; }
  .hdr{ max-width: 64rem; margin: 0 auto; padding: 3.4rem 1.3rem 0; }
  .grid{ max-width: 64rem; margin: 1.4rem auto 0; padding: 0 1.3rem 4rem; column-width: 230px; column-gap: 14px; }
  .grid img{ width: 100%; height: auto; display: block; margin: 0 0 14px; break-inside: avoid; background: #f3f3f1; }
  @media (max-width: 480px){ html{ font-size: 14px; } .hdr{ padding-top: 2.6rem; } }
</style>
</head>
<body>
  <div class="hdr"><a href="index.html">Richard H. Taylor</a> &nbsp;&middot;&nbsp; Gallery</div>
  <div class="grid">
HEAD

for f in gallery/*.jpg gallery/*.jpeg gallery/*.png gallery/*.JPG gallery/*.JPEG gallery/*.PNG; do
  printf '    <img src="%s" loading="lazy" alt="Work by Richard H. Taylor">\n' "$f"
done

cat <<'TAIL'
  </div>
</body>
</html>
TAIL
} > gallery.html

echo "Rebuilt gallery.html with $(grep -c '<img' gallery.html) images."
