#!/bin/bash

# 🔄 AURA LUXE - QUICK REDEPLOY SCRIPT
# Use this after updating HTML file (e.g., adding Stripe/Analytics)
# Usage: bash redeploy_aura_luxe.sh

set -e

echo "🔄 AURA LUXE - QUICK REDEPLOY"
echo "=============================="
echo ""

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Check if file exists
if [ ! -f "AURA_LUXE_OPTIMIZED.html" ]; then
    echo -e "${RED}❌ AURA_LUXE_OPTIMIZED.html not found!${NC}"
    exit 1
fi

echo -e "${BLUE}Redeploying to Vercel...${NC}"
echo ""

# Redeploy
vercel --prod --confirm

echo ""
echo -e "${GREEN}✅ Redeployed successfully!${NC}"
echo ""
echo "Your changes are now live at:"
echo "  https://bierinckx.com"
echo ""
echo "⏱️ Changes may take 30-60 seconds to appear"
echo ""
echo -e "${YELLOW}Tip:${NC} Refresh your browser (Ctrl+F5 or Cmd+Shift+R)"

