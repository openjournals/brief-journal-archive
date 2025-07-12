#!/bin/bash

# Define the banner HTML as a multi-line variable
read -r -d '' BANNER_HTML <<'EOF'
<div class="alert warning" role="alert">
  <p>The Journal of Brief Ideas is currently in statis and archived for now. However, we are looking for technical help to restart. Code frameworks move on but the original site hasn't yet. We are entirely volunteer run and don't currently have capacity for the update. If you think you could help, see the <a href="https://github.com/openjournals/brief-ideas/issues/219">GitHub issue</a> for more information.</p>
</div>
EOF

echo "🚀 Inserting banner into all HTML files..."

# Loop through all .html files recursively
find ./ -name "*.html" -print0 | while IFS= read -r -d '' file; do
  echo "🔧 Updating $file"

  # Use awk to insert after first match of <div class="container">
  awk -v banner="$BANNER_HTML" '
    BEGIN { inserted=0 }
    {
      print
      if (!inserted && $0 ~ /<div class="container">/) {
        print banner
        inserted=1
      }
    }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done

echo "✅ All done. Banner inserted after <div class=\"container\"> in each file."