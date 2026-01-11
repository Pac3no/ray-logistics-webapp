# Ray Logistics - Complete Web Application

A modern, responsive logistics web application for Ray Logistics, featuring interstate and intrastate delivery services across Nigeria.

## 🚀 Features Overview

### 1. **Landing Page** (`ray-logistics.html`)
- Modern, responsive design
- Hero section with animated floating cards
- Services showcase (Motorcycle delivery, Interstate freight, Heavy haulage)
- Coverage areas (Lagos, Ilorin, Abuja + Nationwide)
- Statistics section
- Call-to-action sections
- Professional footer

### 2. **Authentication System** (`auth.html`)
- Login and Sign Up tabs
- Individual and Business account types
- Social login integration (Google, Facebook)
- Password reset functionality
- Form validation
- Responsive design

### 3. **Public Tracking** (`tracking.html`)
- Track shipments without login
- Real-time tracking timeline
- Shipment details display
- Route visualization
- Status updates
- Empty state handling

### 4. **Booking & Quote System** (`booking.html`)
- Interactive quote calculator
- Service type selection (Intrastate/Interstate)
- Location-based pricing
- Weight-based calculations
- **Payment Integration:**
  - Paystack
  - Flutterwave
  - Pay on Delivery (Cash)
- Real-time price updates
- Booking confirmation with tracking number

### 5. **Customer Dashboard** (`dashboard.html`)
- Statistics overview
- Shipment management
- Invoice access
- Profile settings
- Shipment filtering
- Recent shipments table
- Quick actions

## 💳 Payment Integration

### Paystack Setup
1. Sign up at [Paystack](https://paystack.com)
2. Get your public key from the dashboard
3. Replace in `booking.html`:
```javascript
key: 'pk_test_xxxxxxxxxxxxxx', // Replace with your actual Paystack public key
```

### Flutterwave Setup
1. Sign up at [Flutterwave](https://flutterwave.com)
2. Get your public key from the dashboard
3. Replace in `booking.html`:
```javascript
public_key: "FLWPUBK_TEST-xxxxxxxxxxxxxx", // Replace with your actual Flutterwave public key
```

## 🎨 Design System

### Color Palette
- **Primary Orange**: `#FFB366` (Light Orange)
- **Secondary Yellow**: `#FFA500` (Deep Yellow)
- **Navy Blue**: `#1A2B4A` (Primary Text/Headers)
- **Sky Blue**: `#87CEEB` (Accents)
- **Success Green**: `#10B981`
- **Gray Light**: `#F5F7FA` (Backgrounds)

### Typography
- **Headings**: Outfit (Google Fonts)
- **Body**: DM Sans (Google Fonts)

## 📱 Responsive Design

All pages are fully responsive and optimized for:
- Desktop (1400px+)
- Tablet (768px - 1024px)
- Mobile (320px - 767px)

## 🔧 Setup Instructions

### 1. Basic Setup (Static Website)
```bash
# Simply open any HTML file in a modern browser
# Start with ray-logistics.html (landing page)
```

### 2. Development Server (Recommended)
```bash
# Using Python
python -m http.server 8000

# Using Node.js
npx http-server

# Then visit: http://localhost:8000/ray-logistics.html
```

### 3. Production Deployment

#### ⭐ RECOMMENDED: Deploy to Vercel (Free & Fast)

**Method 1: Using Vercel CLI (Fastest)**
```bash
# 1. Install Vercel CLI globally
npm install -g vercel

# 2. Navigate to your project folder
cd ray-logistics-webapp

# 3. Deploy (first time)
vercel

# Follow the prompts:
# - Set up and deploy? Yes
# - Which scope? (Select your account)
# - Link to existing project? No
# - Project name? ray-logistics
# - Directory? ./ (press Enter)
# - Override settings? No

# 4. Your site is now live! 🎉
# You'll get a URL like: https://ray-logistics.vercel.app

# 5. Deploy updates (after making changes)
vercel --prod
```

**Method 2: Using Vercel Dashboard (Visual)**
1. Go to [vercel.com](https://vercel.com) and sign up/login
2. Click "Add New" → "Project"
3. **If you have Git repository:**
   - Import your GitHub/GitLab repository
   - Vercel will auto-detect and deploy
4. **Without Git (drag & drop):**
   - Click "Deploy from folder"
   - Drag all your files or select folder
   - Click "Deploy"
5. Your site will be live in seconds!

**Method 3: Using Git (Best for collaboration)**
```bash
# 1. Initialize Git repository
git init
git add .
git commit -m "Initial commit - Ray Logistics webapp"

# 2. Create GitHub repository and push
git remote add origin https://github.com/yourusername/ray-logistics.git
git branch -M main
git push -u origin main

# 3. Import to Vercel from GitHub
# - Go to vercel.com
# - Click "Import Project"
# - Select your GitHub repository
# - Click "Deploy"
```

**Custom Domain Setup (Optional)**
```bash
# After deployment, add your custom domain
vercel domains add raylogistics.com
vercel domains add www.raylogistics.com

# Follow DNS instructions in Vercel dashboard
```

#### Option B: Netlify
1. Create account on [Netlify](https://netlify.com)
2. Drag and drop all HTML files
3. Your site will be live instantly!

#### Option C: Traditional Hosting
1. Upload all `.html` files to your web hosting (cPanel, etc.)
2. Set `ray-logistics.html` as index page
3. Configure SSL certificate

## 🔐 Backend Integration (Next Steps)

To make this a fully functional application, you'll need to integrate:

### 1. User Authentication
```javascript
// Example: Firebase Authentication
// In auth.html, replace the handleLogin function with:
firebase.auth().signInWithEmailAndPassword(email, password)
  .then((userCredential) => {
    window.location.href = 'dashboard.html';
  })
  .catch((error) => {
    showAlert(error.message, 'error');
  });
```

### 2. Database Integration
Recommended: Firebase Firestore or MongoDB

**Shipment Schema Example:**
```javascript
{
  trackingNumber: "RAY123456789",
  serviceType: "interstate",
  origin: "Lagos",
  destination: "Abuja",
  weight: 5,
  packageType: "package",
  status: "in-transit",
  customer: {
    name: "John Doe",
    email: "john@example.com",
    phone: "+234 801 234 5678"
  },
  payment: {
    method: "paystack",
    amount: 15500,
    reference: "REF123",
    status: "completed"
  },
  timeline: [
    {
      status: "Package Picked Up",
      location: "Lagos Hub",
      timestamp: "2026-01-08T09:30:00Z"
    }
  ],
  createdAt: "2026-01-08T09:30:00Z"
}
```

### 3. API Endpoints Needed

```
POST   /api/auth/signup          - Create new user account
POST   /api/auth/login           - User login
POST   /api/auth/forgot-password - Password reset

POST   /api/bookings             - Create new booking
GET    /api/bookings/:id         - Get booking details
GET    /api/bookings             - List user bookings
PUT    /api/bookings/:id         - Update booking

GET    /api/tracking/:trackingNo - Track shipment
POST   /api/quotes               - Calculate quote

POST   /api/payments/paystack    - Process Paystack payment
POST   /api/payments/flutterwave - Process Flutterwave payment
```

## 📋 Features Checklist

### Implemented ✅
- [x] Responsive landing page
- [x] Login/Signup system
- [x] Public tracking interface
- [x] Quote calculator
- [x] Booking form
- [x] Payment method selection
- [x] Paystack integration setup
- [x] Flutterwave integration setup
- [x] Customer dashboard
- [x] Shipment history
- [x] Mobile responsive design
- [x] Vercel deployment configuration
- [x] Clean URLs and routing
- [x] Production-ready setup

### Recommended Next Steps 🚧
- [ ] Backend API development
- [ ] Database setup
- [ ] Real payment processing
- [ ] Email notifications
- [ ] SMS alerts
- [ ] Admin dashboard
- [ ] Driver mobile app
- [ ] GPS tracking integration
- [ ] Proof of delivery (POD)
- [ ] Analytics dashboard

## 🛠️ Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript (Vanilla)
- **Fonts**: Google Fonts (Outfit, DM Sans)
- **Icons**: Unicode Emojis
- **Payment**: Paystack JS, Flutterwave Checkout

## 📝 File Structure

```
ray-logistics-webapp/
├── ray-logistics.html    # Landing page (Homepage)
├── auth.html            # Login/Signup page
├── tracking.html        # Public tracking page
├── booking.html         # Quote & booking page
├── dashboard.html       # Customer dashboard
├── vercel.json          # Vercel deployment configuration
├── package.json         # Project metadata
├── .gitignore          # Git ignore rules
└── README.md           # This file
```

## 🎯 User Flow

1. **New User:**
   - Visits landing page → Clicks "Get Quote"
   - Fills booking form → Selects payment method
   - Pays online or chooses cash on delivery
   - Receives tracking number → Can track publicly

2. **Registered User:**
   - Logs in → Views dashboard
   - Creates new booking → Manages shipments
   - Views history → Downloads invoices

## 💡 Customization Guide

### Change Colors
Edit CSS variables in each HTML file:
```css
:root {
    --orange-light: #YOUR_COLOR;
    --yellow-deep: #YOUR_COLOR;
    --navy-blue: #YOUR_COLOR;
    --sky-blue: #YOUR_COLOR;
}
```

### Add New Payment Method
In `booking.html`, add to payment options:
```html
<div class="payment-option">
    <input type="radio" id="new-method" name="paymentMethod" value="new-method">
    <label for="new-method" class="payment-card">
        <div class="payment-icon">💳</div>
        <div class="payment-info">
            <div class="payment-name">New Payment</div>
            <div class="payment-desc">Description</div>
        </div>
    </label>
</div>
```

### Update Pricing
In `booking.html`, modify:
```javascript
const pricing = {
    intrastate: {
        baseFee: 2000,    // Change base fee
        perKg: 200        // Change per kg rate
    },
    interstate: {
        baseFee: 5000,
        perKg: 500
    }
};
```

## 📞 Support & Contact

For any questions or customization needs:
- Email: dev@raylogistics.ng
- Phone: +234 123 456 7890

## 📄 License

© 2026 Ray Logistics. All rights reserved.

---

**Built with ❤️ for Ray Logistics**
