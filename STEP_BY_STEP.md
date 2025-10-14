# 🚀 HƯỚNG DẪN PUSH LÊN GITHUB - TỪNG BƯỚC

## ⚠️ VẤN ĐỀ VỪa GẶP:
Bạn đã paste sai URL. Paste `https://github.com/new` thay vì URL repository thật.

## ✅ CÁCH LÀM ĐÚNG:

### BƯỚC 1: Tạo Repository trên GitHub ⏱️ 2 phút

1. **Mở trang tạo repository**: https://github.com/new

2. **Điền thông tin**:
   ```
   Repository name: checkdatetime
   Description: DateTimeChecker with JUnit tests and coverage
   
   ⚪ Public  ← Click chọn
   
   ❌ KHÔNG tick "Add a README file"
   ❌ KHÔNG chọn ".gitignore"  
   ❌ KHÔNG chọn "license"
   ```

3. **Click nút "Create repository"** (màu xanh lá)

4. **SAU KHI TẠO XONG**, GitHub sẽ chuyển đến trang mới có dòng:
   ```
   Quick setup — if you've done this kind of thing before
   
   HTTPS: https://github.com/YOUR_USERNAME/checkdatetime.git
              ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
              COPY URL NÀY! (Có nút copy bên cạnh)
   ```

5. **Copy URL đó** (click nút copy hoặc Ctrl+C)
   - URL ĐÚNG sẽ có dạng: `https://github.com/USERNAME/checkdatetime.git`
   - URL SAI (KHÔNG dùng): `https://github.com/new`

### BƯỚC 2: Chạy Script và Paste URL ĐÚNG ⏱️ 1 phút

Mở PowerShell và chạy:

```powershell
.\quick-fix.bat
```

Khi script hỏi URL, paste URL VỪA COPY từ bước 1.

### BƯỚC 3: Xác thực khi Push ⏱️ 2 phút

Khi Git hỏi:

```
Username: [Nhập GitHub username của bạn]
Password: [PASTE Personal Access Token]
```

#### Nếu chưa có Token:

1. Mở: https://github.com/settings/tokens
2. Click **"Generate new token (classic)"**
3. Điền:
   - Note: `Git Access`
   - Expiration: `90 days`
   - ✅ Tick: **repo** (full control of private repositories)
4. Click **"Generate token"**
5. **Copy token** (dạng: `ghp_xxxxxxxxxxxxxxxxxxxx`)
6. Quay lại terminal, paste token khi hỏi password

## 📝 TÓM TẮT 3 BƯỚC:

```
1. Tạo repo trên GitHub → Copy URL
   ✅ URL đúng: https://github.com/username/checkdatetime.git
   ❌ URL sai: https://github.com/new

2. Chạy: .\quick-fix.bat → Paste URL đúng

3. Khi push → Nhập token (không phải password!)
```

## 🎯 CHẠY NGAY:

Xóa remote sai và thêm lại đúng:

```powershell
# Xóa remote sai
git remote remove origin

# Chạy script
.\quick-fix.bat
```

Lần này paste **URL REPOSITORY THẬT** nhé!

## 🔍 KIỂM TRA URL ĐÚNG:

URL đúng phải có:
- ✅ Tên username của bạn
- ✅ Tên repository (checkdatetime)
- ✅ Kết thúc bằng `.git`

Ví dụ: `https://github.com/nguyenvana/checkdatetime.git`

---

**Bây giờ hãy làm lại từ đầu với URL ĐÚNG!** 🚀
