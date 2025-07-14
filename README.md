# GitHub Pages Setup for Extensionless URLs

This repository contains the necessary files to enable URLs without `.html` extensions on GitHub Pages.

## Quick Setup

1. **Add the configuration files** to your repository root:
   - `_config.yml` - Jekyll configuration
   - `404.html` - Custom 404 page with redirect logic
   - `Gemfile` - Jekyll dependencies (optional)

2. **Enable GitHub Pages** in your repository settings:
   - Go to Settings → Pages
   - Select source: "Deploy from a branch"
   - Choose branch: `main` (or your default branch)
   - Folder: `/ (root)`

3. **Wait for deployment** (usually 1-2 minutes)

## How It Works

### Method 1: Jekyll Configuration (`_config.yml`)
- Enables Jekyll processing on GitHub Pages
- Configures pretty URLs automatically
- Works best for new sites or when restructuring is acceptable

### Method 2: Custom 404 Page (`404.html`)
- **Most effective for existing sites**
- When someone visits `/users/someuser` (without `.html`)
- GitHub Pages shows the 404 page
- JavaScript checks if `/users/someuser.html` exists
- If found, automatically redirects to the correct URL
- Seamless user experience

### Method 3: Link Handler JavaScript (`assets/link-handler.js`)
- **Optional enhancement**
- Automatically removes `.html` from internal links
- Add `<script src="/assets/link-handler.js"></script>` to your HTML files
- Keeps your existing links working while displaying clean URLs

## Testing

After deployment, test these URLs:

```
# Instead of:
https://yoursite.github.io/users/003f8d54e3768057f7ba4cd069ee02ad.html

# You can now use:
https://yoursite.github.io/users/003f8d54e3768057f7ba4cd069ee02ad

# Instead of:
https://yoursite.github.io/ideas/00532261a308bc92f5b9ab5a0054608d.html

# You can now use:
https://yoursite.github.io/ideas/00532261a308bc92f5b9ab5a0054608d
```

## Adding the Link Handler to Existing Pages

To automatically clean up links in your existing HTML files, add this script tag before the closing `</body>` tag:

```html
<script src="/assets/link-handler.js"></script>
```

## Troubleshooting

### URLs still showing 404
- Check that GitHub Pages is enabled in repository settings
- Verify the files are committed to your default branch
- Wait 1-2 minutes for GitHub Pages to rebuild

### Jekyll not processing
- Ensure `_config.yml` is in the repository root
- Check GitHub Pages settings are pointing to the correct branch
- Look for build errors in the Pages section of repository settings

### Links still showing .html
- Add the link handler JavaScript to your pages
- Or manually update links in your HTML files to remove `.html`

## File Structure

```
your-repo/
├── _config.yml          # Jekyll configuration
├── 404.html            # Custom 404 with redirect logic
├── Gemfile             # Jekyll dependencies (optional)
├── assets/
│   └── link-handler.js # JavaScript for link handling
├── users/
│   └── *.html          # Your existing HTML files
├── ideas/
│   └── *.html          # Your existing HTML files
└── README.md           # This file
```

## Alternative: Directory Structure Method

If you prefer a different approach, you can convert your file structure:

```
# Instead of:
users/someuser.html

# Create:
users/someuser/index.html
```

This makes `/users/someuser/` work automatically, but requires restructuring your files.

## Notes

- The custom 404 approach is recommended for existing sites
- Jekyll configuration works well for new sites
- Both methods can be used together for maximum compatibility
- All internal links will continue to work with the `.html` extension
- External links to your site should use the clean URLs

## Support

This setup works with all GitHub Pages supported features and doesn't require any special permissions or paid features. 