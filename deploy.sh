#!/bin/bash

echo "🚀 Starting GitHub Pages deployment..."

# Ensure we are on main branch
current_branch=$(git branch --show-current)
if [ "$current_branch" != "main" ]; then
    echo "❌ Error: You are on '$current_branch'. Please switch to 'main'."
    exit 1
fi

echo "✅ On main branch"

# Pull latest changes
echo "📥 Pulling latest changes..."
git pull origin main

# Stage changes
git add .

# Commit only if there are changes
if git diff --cached --quiet; then
    echo "📋 No changes to commit."
else
    commit_message="Deploy update: $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$commit_message"
fi

# Push changes
echo "🚀 Pushing to GitHub..."
git push origin main

echo "✅ Deployment triggered. GitHub Pages will update shortly."
