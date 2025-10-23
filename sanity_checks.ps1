# GitHub Repository Sanity Checks & Smoke Tests
# Run this script to verify your dual-account SSH setup and repository integrity

Write-Host "🧪 GITHUB REPOSITORY SANITY CHECKS" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Test 1: SSH Authentication Tests
Write-Host "1️⃣ SSH AUTHENTICATION TESTS" -ForegroundColor Yellow
Write-Host "----------------------------" -ForegroundColor Yellow

Write-Host "Testing rdavidson1911 SSH connection..." -ForegroundColor Green
ssh -T git@github.com

Write-Host "`nTesting FireZombieCoder SSH connection..." -ForegroundColor Green
ssh -T git@github-firezombiecoder

Write-Host ""

# Test 2: Git Configuration Verification
Write-Host "2️⃣ GIT CONFIGURATION VERIFICATION" -ForegroundColor Yellow
Write-Host "-----------------------------------" -ForegroundColor Yellow

Write-Host "Current git user configuration:" -ForegroundColor Green
git config --list | Select-String "user\."

Write-Host "`nCurrent remote configuration:" -ForegroundColor Green
git remote -v

Write-Host "`nCurrent branch status:" -ForegroundColor Green
git status --porcelain

Write-Host ""

# Test 3: Repository Integrity Tests
Write-Host "3️⃣ REPOSITORY INTEGRITY TESTS" -ForegroundColor Yellow
Write-Host "-------------------------------" -ForegroundColor Yellow

Write-Host "Fetching latest changes from remote..." -ForegroundColor Green
git fetch origin

Write-Host "`nChecking branch relationships:" -ForegroundColor Green
git branch -vv

Write-Host "`nChecking commit history (last 5 commits):" -ForegroundColor Green
git log --oneline -5

Write-Host ""

# Test 4: File System Verification
Write-Host "4️⃣ FILE SYSTEM VERIFICATION" -ForegroundColor Yellow
Write-Host "-----------------------------" -ForegroundColor Yellow

Write-Host "Checking for task files:" -ForegroundColor Green
if (Test-Path ".tasks") {
    Write-Host "✅ .tasks directory exists" -ForegroundColor Green
    Get-ChildItem .tasks -Name
} else {
    Write-Host "❌ .tasks directory missing" -ForegroundColor Red
}

Write-Host "`nChecking for key documentation files:" -ForegroundColor Green
$keyFiles = @("README.md", "docs.json", "index.mdx", "mintify_notes.md")
foreach ($file in $keyFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file exists" -ForegroundColor Green
    } else {
        Write-Host "❌ $file missing" -ForegroundColor Red
    }
}

Write-Host ""

# Test 5: SSH Key Verification
Write-Host "5️⃣ SSH KEY VERIFICATION" -ForegroundColor Yellow
Write-Host "-------------------------" -ForegroundColor Yellow

Write-Host "Checking SSH keys:" -ForegroundColor Green
if (Test-Path "~/.ssh/id_ed25519") {
    Write-Host "✅ rdavidson1911 key exists" -ForegroundColor Green
} else {
    Write-Host "❌ rdavidson1911 key missing" -ForegroundColor Red
}

if (Test-Path "~/.ssh/id_ed25519_firezombiecoder") {
    Write-Host "✅ FireZombieCoder key exists" -ForegroundColor Green
} else {
    Write-Host "❌ FireZombieCoder key missing" -ForegroundColor Red
}

Write-Host "`nSSH Config file contents:" -ForegroundColor Green
Get-Content ~/.ssh/config | Select-String "github"

Write-Host ""

# Test 6: GPG Verification
Write-Host "6️⃣ GPG VERIFICATION" -ForegroundColor Yellow
Write-Host "--------------------" -ForegroundColor Yellow

Write-Host "GPG signing key:" -ForegroundColor Green
git config user.signingkey

Write-Host "`nGPG key details:" -ForegroundColor Green
gpg --list-secret-keys --keyid-format=long | Select-String "sec\|uid"

Write-Host ""

# Test 7: Network Connectivity
Write-Host "7️⃣ NETWORK CONNECTIVITY" -ForegroundColor Yellow
Write-Host "------------------------" -ForegroundColor Yellow

Write-Host "Testing GitHub connectivity:" -ForegroundColor Green
Test-NetConnection github.com -Port 22 -InformationLevel Quiet
if ($?) {
    Write-Host "✅ GitHub SSH port (22) accessible" -ForegroundColor Green
} else {
    Write-Host "❌ GitHub SSH port (22) not accessible" -ForegroundColor Red
}

Test-NetConnection github.com -Port 443 -InformationLevel Quiet
if ($?) {
    Write-Host "✅ GitHub HTTPS port (443) accessible" -ForegroundColor Green
} else {
    Write-Host "❌ GitHub HTTPS port (443) not accessible" -ForegroundColor Red
}

Write-Host ""
Write-Host "🎉 SANITY CHECKS COMPLETE!" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Review any ❌ items above" -ForegroundColor White
Write-Host "2. Visit https://github.com/FireZombieCoder/docs to verify web interface" -ForegroundColor White
Write-Host "3. Check Mintify integration at your Mintify dashboard" -ForegroundColor White
Write-Host "4. Test a small commit and push to verify end-to-end functionality" -ForegroundColor White
