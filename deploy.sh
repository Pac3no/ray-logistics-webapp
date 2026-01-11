#!/bin/bash

# Ray Logistics - Quick Deploy Script
# This script helps you deploy to Vercel quickly

echo "🚀 Ray Logistics - Vercel Deployment Helper"
echo "==========================================="
echo ""

# Check if vercel CLI is installed
if ! command -v vercel &> /dev/null
then
    echo "📦 Vercel CLI not found. Installing..."
    npm install -g vercel
    echo "✅ Vercel CLI installed!"
else
    echo "✅ Vercel CLI already installed"
fi

echo ""
echo "Choose deployment method:"
echo "1. Deploy to production (recommended)"
echo "2. Deploy preview/test version"
echo "3. Check deployment status"
echo "4. View deployment logs"
echo ""
read -p "Enter choice (1-4): " choice

case $choice in
    1)
        echo ""
        echo "🚀 Deploying to production..."
        vercel --prod
        ;;
    2)
        echo ""
        echo "🔍 Creating preview deployment..."
        vercel
        ;;
    3)
        echo ""
        echo "📊 Checking deployment status..."
        vercel ls
        ;;
    4)
        echo ""
        echo "📜 Viewing logs..."
        vercel logs
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "✅ Done!"
echo ""
echo "📖 For detailed instructions, see VERCEL_DEPLOYMENT_GUIDE.md"
