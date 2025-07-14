#!/bin/bash

# Define the banner HTML as a multi-line variable with improved Bootstrap styling
read -r -d '' BANNER_HTML <<'EOF'
<div class="alert alert-info" role="alert" style="margin: 15px 0; border-left: 4px solid #31708f;">
  <h4 style="margin-top: 0; color: #31708f;">📚 Site Archive Notice</h4>
  <p style="margin-bottom: 0;"><strong>The Journal of Brief Ideas is currently in stasis and archived for now.</strong> However, we are looking for technical help to restart. Code frameworks move on but the original site hasn't yet. We are entirely volunteer run and don't currently have capacity for the update.</p>
  <p style="margin-bottom: 0; margin-top: 10px;">If you think you could help, please see the <a href="https://github.com/openjournals/brief-ideas/issues/219" class="alert-link" target="_blank">GitHub issue</a> for more information.</p>
</div>
EOF

echo "🚀 Inserting improved banner into all HTML files..."

# Loop through all .html files recursively
find ./ -name "*.html" -print0 | while IFS= read -r -d '' file; do
  echo "🔧 Updating $file"

  # Use awk to insert after first match of <div class="container">
  # Using a temporary file to store the banner and read it in awk
  echo "$BANNER_HTML" > /tmp/banner.html
  awk '
    BEGIN { 
      inserted=0
      # Read the banner from the temporary file
      while ((getline banner_line < "/tmp/banner.html") > 0) {
        if (banner == "") {
          banner = banner_line
        } else {
          banner = banner "\n" banner_line
        }
      }
      close("/tmp/banner.html")
    }
    {
      print
      if (!inserted && $0 ~ /<div class="container">/) {
        print banner
        inserted=1
      }
    }' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done

# Clean up temporary file
rm -f /tmp/banner.html

echo "✅ All done. Improved banner inserted after <div class=\"container\"> in each file."