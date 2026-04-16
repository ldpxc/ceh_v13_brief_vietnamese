#!/bin/bash
mkdir -p ./pdf

for file in *.md; do
    filename="${file%.md}"
    echo "[+] Converting: $file -> ./pdf/$filename.pdf"
    
    tmpfile=$(mktemp)
    
    # Thay emoji và một số ký tự đặc biệt hay gây warning
    sed 's/🟢/[OK]/g;
         s/🔴/[FAIL]/g;
         s/🟡/[WARN]/g;
         s/🔵/[INFO]/g;
         s/🟣/[NOTE]/g;
         s/🟠/[ORANGE]/g;
         s/→/-->/g' "$file" > "$tmpfile"
    
    pandoc "$tmpfile" \
        -f markdown \
        -o "./pdf/$filename.pdf" \
        --pdf-engine=xelatex \
        -V geometry:margin=1.5cm \
        -V fontsize=10pt \
        -V linestretch=1.2 \
        -V mainfont="Noto Serif" \
        -V sansfont="Noto Sans" \
        -V monofont="JetBrains Mono" \
        --highlight-style=tango
    
    rm "$tmpfile"
done

echo "[✓] Done!"