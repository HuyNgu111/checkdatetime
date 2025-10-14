# 🔑 Hướng dẫn tạo Personal Access Token để Push lên GitHub

## ❌ Lỗi bạn gặp phải:

```
error: src refspec main does not match any
error: failed to push some refs to 'origin'
```

## 🎯 Nguyên nhân:

1. **Chưa có commit** - Git không có gì để push
2. **Lỗi xác thực** - GitHub không chấp nhận username/password nữa (từ 2021)

## ✅ Giải pháp:

### Bước 1: Tạo Personal Access Token

1. **Đăng nhập GitHub**: https://github.com

2. **Vào Settings**:
   - Click avatar (góc phải trên) → **Settings**

3. **Developer Settings**:
   - Kéo xuống dưới cùng → Click **Developer settings**

4. **Personal Access Tokens**:
   - Click **Personal access tokens** → **Tokens (classic)**

5. **Generate New Token**:
   - Click **Generate new token (classic)**

6. **Điền thông tin**:
   ```
   Note: Git Access for DateTimeChecker
   Expiration: 90 days (hoặc tùy chọn)
   
   ✅ Tick vào: repo (Full control of private repositories)
      ✅ repo:status
      ✅ repo_deployment
      ✅ public_repo
      ✅ repo:invite
      ✅ security_events
   ```

7. **Generate Token**:
   - Click nút **Generate token** (màu xanh ở dưới)

8. **⚠️ QUAN TRỌNG - Copy Token**:
   - Token sẽ hiện ra: `ghp_xxxxxxxxxxxxxxxxxxxx`
   - **COPY NGAY** (chỉ hiện 1 lần duy nhất!)
   - Lưu vào Notepad để dùng sau

### Bước 2: Push lại với Token

1. **Chạy script sửa lỗi**:
   ```powershell
   .\fix-and-push.bat
   ```

2. **Khi Git hỏi password**:
   - **Username**: Nhập GitHub username của bạn
   - **Password**: **PASTE TOKEN** (không phải password GitHub!)

3. **Ví dụ**:
   ```
   Username for 'https://github.com': your-username
   Password for 'https://your-username@github.com': ghp_xxxxxxxxxxxxxxxxxxxx
   ```

## 🔄 Cách khác: Lưu Token vào Git (Chỉ cần nhập 1 lần)

Sau khi nhập token lần đầu, chạy:

```powershell
git config --global credential.helper store
```

Lần sau Git sẽ tự động dùng token đã lưu.

## 🔐 Cách khác: Dùng SSH (An toàn hơn)

### Tạo SSH Key:

```powershell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Nhấn Enter 3 lần (dùng default settings)

### Copy SSH Key:

```powershell
cat ~/.ssh/id_ed25519.pub
```

Copy toàn bộ output

### Thêm vào GitHub:

1. GitHub Settings → **SSH and GPG keys**
2. Click **New SSH key**
3. Paste key vào
4. Click **Add SSH key**

### Đổi Remote URL:

```powershell
git remote set-url origin git@github.com:username/checkdatetime.git
```

Sau đó push lại:

```powershell
.\fix-and-push.bat
```

## 📋 Checklist trước khi Push:

- [ ] ✅ Git đã được cài đặt
- [ ] ✅ Repository đã tạo trên GitHub
- [ ] ✅ Đã tạo Personal Access Token
- [ ] ✅ Đã copy và lưu token
- [ ] ✅ Remote URL đúng (`git remote -v`)
- [ ] ✅ Có ít nhất 1 commit (`git log`)

## 🎯 Script để dùng:

```powershell
# Kiểm tra trạng thái
.\check-github-status.bat

# Sửa lỗi và push
.\fix-and-push.bat
```

## ❓ Troubleshooting

### Token không hoạt động?
→ Kiểm tra đã tick đủ quyền "repo" chưa

### Vẫn lỗi "failed to push"?
→ Chạy:
```powershell
git push -u origin main --force
```

### Repository không tồn tại?
→ Tạo repo mới trên GitHub: https://github.com/new

### Remote URL sai?
→ Sửa:
```powershell
git remote set-url origin https://github.com/username/repo.git
```

---

**Tóm tắt**: Tạo Token → Copy → Chạy `fix-and-push.bat` → Paste token khi hỏi password → Done! 🎉
