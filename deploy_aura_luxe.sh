#!/bin/bash

# 🚀 AURA LUXE - COMPLETE VERCEL DEPLOYMENT SCRIPT
# This script deploys your shop to Vercel with bierinckx.com domain
# Usage: bash deploy_aura_luxe.sh

set -e  # Exit on error

echo "🎨 AURA LUXE - VERCEL DEPLOYMENT SCRIPT"
echo "========================================"
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Step 1: Check if Vercel CLI is installed
echo -e "${BLUE}Step 1: Checking Vercel CLI...${NC}"
if ! command -v vercel &> /dev/null; then
    echo -e "${RED}❌ Vercel CLI not found!${NC}"
    echo "Install with: npm install -g vercel"
    exit 1
fi
echo -e "${GREEN}✅ Vercel CLI found${NC}"
echo ""

# Step 2: Check if HTML file exists
echo -e "${BLUE}Step 2: Checking HTML file...${NC}"
if [ ! -f "AURA_LUXE_OPTIMIZED.html" ]; then
    echo -e "${RED}❌ AURA_LUXE_OPTIMIZED.html not found!${NC}"
    echo "Make sure the file is in current directory"
    exit 1
fi
echo -e "${GREEN}✅ HTML file found${NC}"
echo ""

# Step 3: Vercel Login
echo -e "${BLUE}Step 3: Vercel Authentication${NC}"
echo "You will be asked to login to Vercel..."
vercel login
echo -e "${GREEN}✅ Logged in to Vercel${NC}"
echo ""

# Step 4: Deploy to Vercel
echo -e "${BLUE}Step 4: Deploying to Vercel...${NC}"
echo "Creating new Vercel project..."

# Deploy (this will create/use a project)
DEPLOY_OUTPUT=$(vercel --prod --confirm 2>&1)
PROJECT_URL=$(echo "$DEPLOY_OUTPUT" | grep -oP 'https://[^/]+\.vercel\.app' | head -1)

if [ -z "$PROJECT_URL" ]; then
    echo -e "${RED}❌ Deployment failed${NC}"
    echo "Output: $DEPLOY_OUTPUT"
    exit 1
fi

echo -e "${GREEN}✅ Deployed successfully!${NC}"
echo -e "Project URL: ${YELLOW}$PROJECT_URL${NC}"
echo ""

# Step 5: Add custom domain
echo -e "${BLUE}Step 5: Adding custom domain (bierinckx.com)...${NC}"
vercel domains add bierinckx.com || echo "⚠️  Domain may already be configured"
echo -e "${GREEN}✅ Domain added (or already exists)${NC}"
echo ""

# Step 6: Get Vercel nameservers
echo -e "${BLUE}Step 6: Vercel Nameservers${NC}"
echo -e "${YELLOW}Use these nameservers in your domain provider:${NC}"
echo "  ns1.vercel.com"
echo "  ns2.vercel.com"
echo ""

# Step 7: Vercel project info
echo -e "${BLUE}Step 7: Your Vercel Project Info${NC}"
echo ""
vercel ls
echo ""

echo "========================================"
echo -e "${GREEN}🎉 DEPLOYMENT COMPLETE!${NC}"
echo "========================================"
echo ""
echo "📝 NEXT STEPS:"
echo ""
echo "1️⃣ UPDATE DNS (5-10 minutes):"
echo "   Go to your domain provider (Namecheap/Cloudflare/etc.)"
echo "   Update nameservers to:"
echo "   - ns1.vercel.com"
echo "   - ns2.vercel.com"
echo ""
echo "2️⃣ WAIT FOR DNS PROPAGATION (5-30 minutes):"
echo "   Check status: https://www.whatsmydns.net"
echo "   Type: bierinckx.com"
echo ""
echo "3️⃣ TEST YOUR SITE:"
echo "   Open: https://bierinckx.com"
echo "   You should see: 'Welcome to AURA LUXE. 💫'"
echo ""
echo "4️⃣ ADD STRIPE (20 minutes):"
echo "   Get pk_live_XXXXX from stripe.com"
echo "   Edit: AURA_LUXE_OPTIMIZED.html"
echo "   Replace: pk_test_demo with your key"
echo "   Deploy: bash redeploy_aura_luxe.sh"
echo ""
echo "5️⃣ ADD ANALYTICS (10 minutes):"
echo "   Get Tracking ID from analytics.google.com"
echo "   Add to HTML file"
echo "   Redeploy"
echo ""
echo "6️⃣ LAUNCH! 🚀"
echo "   Share bierinckx.com on social media"
echo "   Send to friends/family"
echo "   Watch orders come in! 💰"
echo ""
echo "========================================"
echo -e "${GREEN}Your shop is ready for bierinckx.com!${NC}"
echo "========================================"

