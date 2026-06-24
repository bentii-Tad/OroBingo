#!/bin/bash

# 🚀 OroBingo One-Click Deployment Script
# This script automates the deployment process

echo "╔════════════════════════════════════════╗"
echo "║   🎲 OroBingo Deployment Script 🎲     ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install it first."
    echo "📥 Download from: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js found: $(node --version)"

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed."
    exit 1
fi

echo "✅ npm found: $(npm --version)"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo "✅ Dependencies installed successfully"
echo ""

# Check if .env exists
if [ ! -f .env ]; then
    echo "⚠️  .env file not found. Creating from template..."
    cp .env.example .env
    echo "📝 Please edit .env with your payment provider credentials"
    echo ""
fi

echo "🚀 Starting OroBingo server..."
echo ""
echo "Server will run on: http://localhost:3000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

npm start
