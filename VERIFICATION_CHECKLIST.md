# 🔍 Repository Verification Checklist

## 📋 **Command-Line Sanity Checks**

### **Run the PowerShell Script:**
```powershell
.\sanity_checks.ps1
```

### **Manual Command Tests:**

#### 1. **SSH Authentication Tests**
```bash
# Test rdavidson1911 account
ssh -T git@github.com
# Expected: "Hi rdavidson1911/superduper! You've successfully authenticated..."

# Test FireZombieCoder account  
ssh -T git@github-firezombiecoder
# Expected: "Hi FireZombieCoder! You've successfully authenticated..."
```

#### 2. **Git Operations Tests**
```bash
# Check current status
git status

# Verify remote configuration
git remote -v
# Expected: git@github-firezombiecoder:FireZombieCoder/docs.git

# Check branch information
git branch -a
# Expected: Should show your task branch in remotes/origin/

# Test fetch operation
git fetch origin
# Expected: No errors, should fetch latest changes

# Check commit history
git log --oneline -5
# Expected: Should show recent commits including your task branch
```

#### 3. **File System Verification**
```bash
# Check for task files
ls -la .tasks/
# Expected: Should show your task file

# Check for key documentation
ls -la *.md *.mdx docs.json
# Expected: Should show all documentation files
```

---

## 🌐 **Web-Based Verification**

### **1. GitHub Repository Verification**

#### **Visit the Repository:**
- **URL**: https://github.com/FireZombieCoder/docs
- **Expected**: Should show your repository with all files

#### **Check Branch:**
- Navigate to: https://github.com/FireZombieCoder/docs/tree/task/github_mintify_setup_2025-10-23
- **Expected**: Should show your task branch with the .tasks/ directory

#### **Verify Recent Commits:**
- Go to: https://github.com/FireZombieCoder/docs/commits/main
- **Expected**: Should show recent commits including your push

#### **Check Pull Request:**
- Visit: https://github.com/FireZombieCoder/docs/pull/new/task/github_mintify_setup_2025-10-23
- **Expected**: Should offer to create a PR from your branch

### **2. Mintify Integration Verification**

#### **Access Mintify Dashboard:**
- **URL**: https://mintify.com (or your specific Mintify instance)
- **Login**: Use your FireZombieCoder credentials

#### **Check Repository Connection:**
- Look for your docs repository in the connected repositories
- **Expected**: Should show FireZombieCoder/docs as connected

#### **Verify Content Sync:**
- Check if recent changes appear in Mintify
- **Expected**: New files and updates should be visible

#### **Test Documentation Rendering:**
- Navigate through your documentation pages
- **Expected**: All MDX files should render correctly

---

## 🧪 **End-to-End Smoke Tests**

### **Test 1: Make a Small Change and Push**
```bash
# Create a test file
echo "# Test Update - $(Get-Date)" >> test_update.md

# Add and commit
git add test_update.md
git commit -m "Test: Verify push functionality"

# Push to remote
git push origin task/github_mintify_setup_2025-10-23
# Expected: Should push successfully without errors
```

### **Test 2: Switch Between Accounts**
```bash
# Test rdavidson1911 account (if you have other repos)
git remote set-url origin git@github.com:rdavidson1911/some-repo.git
# Expected: Should work with rdavidson1911 keyBasehat32!


# Switch back to FireZombieCoder
git remote set-url origin git@github-firezombiecoder:FireZombieCoder/docs.git
# Expected: Should work with FireZombieCoder key
```

### **Test 3: GPG Signing Verification**
```bash
# Make a signed commit
echo "# GPG Test" >> gpg_test.md
git add gpg_test.md
git commit -S -m "Test: GPG signed commit"
# Expected: Should prompt for GPG passphrase and create signed commit

# Verify signature
git log --show-signature -1
# Expected: Should show valid GPG signature
```

---

## ✅ **Success Criteria**

### **All tests should show:**
- ✅ SSH authentication works for both accounts
- ✅ Git operations complete without errors
- ✅ Remote repository shows updated content
- ✅ Mintify dashboard reflects changes
- ✅ GPG signing works correctly
- ✅ Branch operations function properly

### **If any test fails:**
1. Check the error message
2. Verify SSH key configuration
3. Confirm repository permissions
4. Check network connectivity
5. Review git configuration

---

## 🚨 **Troubleshooting Common Issues**

### **SSH Permission Denied:**
```bash
# Check SSH agent
ssh-add -l

# Add keys to agent
ssh-add ~/.ssh/id_ed25519
ssh-add ~/.ssh/id_ed25519_firezombiecoder
```

### **Git Push Fails:**
```bash
# Check remote URL
git remote -v

# Verify branch exists on remote
git ls-remote origin
```

### **Mintify Not Updating:**
- Check webhook configuration in GitHub
- Verify repository permissions in Mintify
- Check Mintify sync status in dashboard

---

## 📊 **Verification Report Template**

After running all tests, document your results:

```
Date: ___________
Repository: FireZombieCoder/docs
Branch: task/github_mintify_setup_2025-10-23

SSH Authentication: ✅/❌
Git Operations: ✅/❌
Web Interface: ✅/❌
Mintify Integration: ✅/❌
GPG Signing: ✅/❌

Issues Found: ___________
Resolution: ___________

Overall Status: ✅ PASS / ❌ FAIL
```
