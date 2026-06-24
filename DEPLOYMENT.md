# 🚀 Deployment Guide

## Quick Start

### Local Development
```bash
npm install
npm start
# Visit http://localhost:3000
```

## Production Deployment

### Option 1: Heroku (Recommended)

1. **Install Heroku CLI**
```bash
npm install -g heroku
heroku login
```

2. **Create app**
```bash
heroku create orobingo-app
```

3. **Set environment variables**
```bash
heroku config:set JWT_SECRET=your-production-secret
heroku config:set CBE_BIRR_API_KEY=your-cbe-key
heroku config:set CBE_BIRR_API_ENDPOINT=https://api.cbebirr.et
heroku config:set CBE_BIRR_DEPOSIT_ACCOUNT=your-account
heroku config:set TELE_BIRR_API_KEY=your-tele-key
heroku config:set TELE_BIRR_API_ENDPOINT=https://api.telebirr.et
heroku config:set TELE_BIRR_MERCHANT_ID=your-merchant-id
heroku config:set TELE_BIRR_DEPOSIT_ACCOUNT=your-tele-account
```

4. **Deploy**
```bash
git push heroku main
```

5. **View logs**
```bash
heroku logs --tail
```

### Option 2: Railway.app

1. **Create Railway account** - https://railway.app

2. **Create new project**
```bash
npm install -g @railway/cli
railway login
railway init
```

3. **Add environment variables** in Railway dashboard

4. **Deploy**
```bash
railway up
```

### Option 3: Render.com

1. **Create Render account** - https://render.com

2. **Connect GitHub** 
   - Go to Dashboard
   - Click "New +"
   - Select "Web Service"
   - Connect your GitHub repo

3. **Set environment variables**
   - In Render dashboard → Environment
   - Add all variables from .env

4. **Deploy**
   - Render auto-deploys on git push

## Post-Deployment Checklist

- [ ] Change JWT_SECRET to strong random value
- [ ] Set payment provider API keys
- [ ] Test authentication flow
- [ ] Test deposit functionality
- [ ] Test withdrawal functionality
- [ ] Enable HTTPS/SSL
- [ ] Setup error logging
- [ ] Monitor server performance
- [ ] Backup database regularly
- [ ] Test payment provider webhooks

## Environment Variables (Production)

```
JWT_SECRET=generate-strong-random-key
PORT=3000
NODE_ENV=production

CBE_BIRR_API_KEY=your-production-key
CBE_BIRR_API_ENDPOINT=https://api.cbebirr.et
CBE_BIRR_DEPOSIT_ACCOUNT=production-account

TELE_BIRR_API_KEY=your-production-key
TELE_BIRR_API_ENDPOINT=https://api.telebirr.et
TELE_BIRR_MERCHANT_ID=production-merchant-id
TELE_BIRR_DEPOSIT_ACCOUNT=production-account
```

## Monitoring

### Heroku
```bash
heroku logs --tail
heroku ps
```

## Troubleshooting

### Port already in use
```bash
lsof -i :3000
kill -9 <PID>
```

### Payment provider timeout
- Check API endpoint is accessible
- Verify network connectivity
- Increase timeout in axios calls

---

**Questions?** Open an issue or contact the team.
