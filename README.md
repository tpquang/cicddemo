# CI/CD Demo: Next.js + GitHub Actions + Server Deployment

## 🚀 Mô tả
Ứng dụng Next.js tối giản để test CI/CD pipeline deploy lên server `http://103.142.24.175/`

## 📋 Tính năng
- ✅ Build và test bằng GitHub Actions
- ✅ Deploy tự động lên server qua SSH
- ✅ Static export cho hiệu suất tối ưu
- ✅ Backup tự động trước khi deploy

## 🛠️ Chạy cục bộ
```bash
npm install
npm run dev
```

## 📦 Build & Export tĩnh
```bash
npm run build
# Files sẽ được tạo trong thư mục ./out
```

## 🚀 Deploy thủ công

### Windows
```bash
deploy.bat
```

### Linux/Mac
```bash
./deploy.sh
```

## ⚙️ Thiết lập CI/CD

### 1. Cấu hình GitHub Secrets
Vào GitHub Repository → Settings → Secrets and variables → Actions, thêm:

- `HOST`: `103.142.24.175`
- `USERNAME`: `root` (hoặc user SSH của bạn)
- `SSH_KEY`: Private SSH key để kết nối server
- `PORT`: `22` (hoặc port SSH của bạn)

### 2. Cấu hình Server
Đảm bảo server có:
- Nginx/Apache web server
- Thư mục web root: `/var/www/html`
- SSH access với key authentication
- User có quyền write vào `/var/www/html`

### 3. Workflow tự động
Mỗi khi push code lên nhánh `main`, GitHub Actions sẽ:
1. ✅ Checkout code
2. ✅ Install dependencies
3. ✅ Run linter
4. ✅ Build Next.js app
5. ✅ Upload lên server
6. ✅ Backup files cũ
7. ✅ Deploy files mới
8. ✅ Set permissions

## 📁 Cấu trúc project
```
cicddemo/
├── .github/workflows/deploy.yml  # GitHub Actions workflow
├── app/                          # Next.js app directory
├── out/                          # Build output (static files)
├── deploy.sh                     # Linux/Mac deploy script
├── deploy.bat                    # Windows deploy script
├── .env.example                  # Environment variables template
└── README.md                     # Documentation
```

## 🔧 Cấu hình Next.js
- `output: 'export'`: Tạo static files
- `images: { unoptimized: true }`: Tắt tối ưu hóa ảnh
- `distDir: 'out'`: Output directory

## 🆘 Troubleshooting

### Build failed
- Kiểm tra Node.js version (cần >= 18)
- Chạy `npm install` để cài dependencies

### Deploy failed
- Kiểm tra SSH key và server access
- Đảm bảo server có đủ disk space
- Kiểm tra permissions của `/var/www/html`

### Website không load
- Kiểm tra nginx/apache configuration
- Kiểm tra file permissions
- Kiểm tra firewall settings