#!/bin/bash
mkdir -p ./pdf

for file in 09*.md; do
    filename="${file%.md}"
    echo "[+] Converting: $file -> ./pdf/$filename.pdf"
    
    tmpfile=$(mktemp)
    
    # Xử lý emoji, mũi tên và backslash (rất quan trọng cho registry, \x, đường dẫn Windows)
    sed 's/🟢/[OK]/g;
         s/🔴/[FAIL]/g;
         s/🟡/[WARN]/g;
         s/🔵/[INFO]/g;
         s/🟣/[NOTE]/g;
         s/🟠/[ORANGE]/g;
         s/→/-->/g;
         s/\\/\\textbackslash{}/g' "$file" > "$tmpfile"
    
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
        --highlight-style=tango \
        --include-in-header=<(cat << 'EOF'
\usepackage{enumitem}

\setlistdepth{20}

\renewlist{itemize}{itemize}{20}
\renewlist{enumerate}{enumerate}{20}

\setlist[itemize]{label=\textbullet}
\setlist[itemize,1]{label=\textbullet}
\setlist[itemize,2]{label=--}
\setlist[itemize,3]{label=*}

\let\tightlist\relax
EOF
)
    
    rm "$tmpfile"
done

echo "[✓] Done!"