# 🚀 Vercel Deployment Guide for Ray Logistics

This guide will walk you through deploying your Ray Logistics web application to Vercel in under 5 minutes!

## 📋 Prerequisites

- A Vercel account (free) - Sign up at [vercel.com](https://vercel.com)
- Your Ray Logistics project files
- Optional: GitHub account (for automatic deployments)

---

## 🎯 Method 1: Quick Deploy (Drag & Drop) - 2 Minutes

**Perfect for: Testing and quick deployments**

### Steps:

1. **Go to Vercel Dashboard**
   - Visit [vercel.com](https://vercel.com)
   - Click "Sign Up" or "Login"
   - Choose GitHub, GitLab, or Email

2. **Create New Project**
   - Click "Add New..." → "Project"
   - Look for the drag & drop area

3. **Upload Your Files**
   - Drag and drop your entire `ray-logistics-webapp` folder
   - OR click "Browse" and select all files:
     - ray-logistics.html
     - auth.html
     - tracking.html
     - booking.html
     - dashboard.html
     - vercel.json
     - package.json

4. **Configure Project**
   - Project Name: `ray-logistics` (or your choice)
   - Framework Preset: Leave as "Other"
   - Root Directory: `./`
   - Click "Deploy"

5. **Done! 🎉**
   - Your site will be live at: `https://ray-logistics.vercel.app`
   - Or: `https://your-project-name.vercel.app`

---

## 🎯 Method 2: Using Vercel CLI - 3 Minutes

**Perfect for: Developers who prefer command line**

### Installation:

```bash
# Install Vercel CLI globally
npm install -g vercel

# Or using yarn
yarn global add vercel
```

### Deploy:

```bash
# Navigate to your project folder
cd path/to/ray-logistics-webapp

# Deploy for the first time
vercel

# You'll be prompted:
```

**Prompts and Answers:**
```
? Set up and deploy "~/ray-logistics-webapp"? [Y/n] 
→ Y (press Enter)

? Which scope do you want to deploy to? 
→ Select your account

? Link to existing project? [y/N] 
→ N (press Enter)

? What's your project's name? 
→ ray-logistics (or your choice)

? In which directory is your code located? 
→ ./ (press Enter)

? Want to override the settings? [y/N] 
→ N (press Enter)
```

**Deploying...**
```
🔍  Inspect: https://vercel.com/yourname/ray-logistics/xxxxx
✅  Production: https://ray-logistics.vercel.app
```

### Deploy Updates:

```bash
# After making changes to your files
vercel --prod

# Your changes are now live!
```

---

## 🎯 Method 3: GitHub Integration (Recommended) - 5 Minutes

**Perfect for: Automatic deployments on every push**

### Step 1: Create GitHub Repository

```bash
# Initialize Git (if not already done)
cd path/to/ray-logistics-webapp
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Ray Logistics web app"

# Create repository on GitHub.com, then:
git remote add origin https://github.com/yourusername/ray-logistics.git
git branch -M main
git push -u origin main
```

### Step 2: Import to Vercel

1. Go to [vercel.com/new](https://vercel.com/new)
2. Click "Import Git Repository"
3. Select your GitHub account (authorize if needed)
4. Find and select `ray-logistics` repository
5. Configure:
   - Framework Preset: Other
   - Root Directory: ./
   - Build Command: (leave empty)
   - Output Directory: (leave empty)
6. Click "Deploy"

### Step 3: Automatic Deployments! 🎉

Now, every time you push to GitHub:
```bash
git add .
git commit -m "Updated booking page"
git push
```
Vercel automatically deploys your changes!

---

## 🌐 Custom Domain Setup

### Add Your Domain:

1. **In Vercel Dashboard:**
   - Go to your project
   - Click "Settings" → "Domains"
   - Click "Add"
   - Enter: `raylogistics.com`

2. **Configure DNS:**
   
   **If using Vercel DNS (Recommended):**
   - Vercel will show you nameservers
   - Update at your domain registrar:
     ```
     ns1.vercel-dns.com
     ns2.vercel-dns.com
     ```

   **If keeping your DNS provider:**
   - Add A Record:
     ```
     Type: A
     Name: @
     Value: 76.76.21.21
     ```
   - Add CNAME:
     ```
     Type: CNAME
     Name: www
     Value: cname.vercel-dns.com
     ```

3. **Wait for DNS Propagation (5-48 hours)**

4. **SSL Certificate** - Automatic! ✅

---

## ⚙️ Environment Variables (For Future Backend)

When you connect to a backend:

1. **In Vercel Dashboard:**
   - Project → Settings → Environment Variables

2. **Add Variables:**
   ```
   PAYSTACK_PUBLIC_KEY=pk_live_xxxxxxxxxxxxx
   PAYSTACK_SECRET_KEY=sk_live_xxxxxxxxxxxxx
   FLUTTERWAVE_PUBLIC_KEY=FLWPUBK_xxxxxxxxxxxxx
   DATABASE_URL=mongodb+srv://xxxxxxxxxxxxx
   API_ENDPOINT=https://api.raylogistics.com
   ```

3. **Redeploy** for changes to take effect

---

## 🔧 Vercel.json Configuration Explained

Your `vercel.json` file handles routing:

```json
{
  "routes": [
    { "src": "/", "dest": "/ray-logistics.html" },      // Homepage
    { "src": "/login", "dest": "/auth.html" },          // Clean URL
    { "src": "/track", "dest": "/tracking.html" },      // Clean URL
    { "src": "/book", "dest": "/booking.html" },        // Clean URL
    { "src": "/dashboard", "dest": "/dashboard.html" }  // Clean URL
  ]
}
```

**This means your URLs will be:**
- `https://raylogistics.com/` → Landing page
- `https://raylogistics.com/login` → Auth page (no .html)
- `https://raylogistics.com/track` → Tracking page
- `https://raylogistics.com/book` → Booking page
- `https://raylogistics.com/dashboard` → Dashboard

---

## 📊 Monitoring & Analytics

### Built-in Vercel Analytics:

1. Go to your project dashboard
2. Click "Analytics" tab
3. View:
   - Page views
   - Unique visitors
   - Performance metrics
   - Geographic data

### Add Google Analytics (Optional):

Add to all HTML files before `</head>`:
```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

---

## 🐛 Troubleshooting

### Issue: 404 Page Not Found

**Solution:**
- Ensure `vercel.json` is in root directory
- Check file names match routes
- Redeploy: `vercel --prod`

### Issue: Changes Not Showing

**Solution:**
```bash
# Clear cache and redeploy
vercel --prod --force
```

### Issue: Slow Loading

**Solution:**
- Check image sizes (optimize if needed)
- Use browser DevTools → Network tab
- Enable Vercel Speed Insights

### Issue: Custom Domain Not Working

**Solution:**
- Wait 24-48 hours for DNS propagation
- Check DNS settings at domain registrar
- Use [whatsmydns.net](https://whatsmydns.net) to verify propagation

---

## 🎨 Testing Before Deploying

### Local Testing:

```bash
# Start local server
python -m http.server 8000

# Visit
http://localhost:8000/ray-logistics.html
```

### Preview Deployments:

Every git push creates a preview:
- Vercel provides a unique URL
- Test before merging to production
- Share with team for review

---

## 📈 Performance Optimization

### Enable Vercel Features:

1. **Speed Insights** (Free)
   - Dashboard → Analytics → Speed Insights
   - Monitor Core Web Vitals

2. **Edge Network** (Automatic)
   - Your site cached globally
   - Lightning fast worldwide

3. **Image Optimization** (When you add images)
   ```html
   <!-- Instead of: -->
   <img src="image.jpg">
   
   <!-- Use Vercel Image Optimization: -->
   <img src="/_vercel/image?url=/image.jpg&w=800&q=80">
   ```

---

## 🔒 Security Best Practices

### 1. HTTPS
- ✅ Automatic with Vercel
- SSL certificate auto-renewed

### 2. Security Headers
Add to `vercel.json`:
```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        },
        {
          "key": "X-XSS-Protection",
          "value": "1; mode=block"
        }
      ]
    }
  ]
}
```

---

## 💰 Pricing

**Free Tier Includes:**
- ✅ Unlimited deployments
- ✅ 100GB bandwidth/month
- ✅ Automatic HTTPS
- ✅ DDoS protection
- ✅ Analytics
- ✅ Custom domains
- ✅ Preview deployments

**Perfect for:** Most small to medium businesses!

**Pro Tier ($20/month):**
- More bandwidth
- Password protection
- Advanced analytics
- Team collaboration

---

## 🎓 Next Steps After Deployment

1. ✅ Test all pages on deployed site
2. ✅ Add payment API keys (Paystack/Flutterwave)
3. ✅ Set up custom domain
4. ✅ Enable analytics
5. ✅ Share with team/customers
6. ✅ Plan backend integration
7. ✅ Monitor performance

---

## 📞 Support

**Vercel Documentation:**
- [docs.vercel.com](https://vercel.com/docs)

**Ray Logistics Support:**
- Email: dev@raylogistics.ng
- Issues: Create issue in GitHub repo

---

## 🚀 Quick Reference

```bash
# First deployment
vercel

# Deploy to production
vercel --prod

# Check deployment status
vercel ls

# View logs
vercel logs

# Remove deployment
vercel rm ray-logistics
```

---

**Ready to deploy? Choose your method above and go live in minutes! 🎉**
