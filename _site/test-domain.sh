#!/bin/bash

echo "Testing GitHub Pages Custom Domain Setup for beta.briefideas.org"
echo "=================================================================="

# Test DNS resolution
echo "1. Testing DNS resolution..."
dig +short beta.briefideas.org

# Test if domain points to GitHub
echo -e "\n2. Testing if domain points to GitHub Pages..."
curl -I https://beta.briefideas.org 2>/dev/null | head -5

# Test if GitHub recognizes the domain
echo -e "\n3. Testing GitHub Pages response..."
curl -s -o /dev/null -w "%{http_code}" https://beta.briefideas.org

echo -e "\n\n4. Common issues and solutions:"
echo "   - If you get 404: Wait 10-15 minutes for DNS propagation"
echo "   - If you get SSL errors: GitHub needs time to generate SSL certificate"
echo "   - If domain doesn't resolve: Check DNS settings with your registrar"
echo "   - GitHub Pages build can take 1-2 minutes after pushing changes"

echo -e "\n5. Verify your setup:"
echo "   - DNS: https://dnschecker.org/#A/beta.briefideas.org"
echo "   - GitHub Pages: Go to your repo Settings → Pages"
echo "   - SSL Certificate: May take up to 24 hours to provision" 