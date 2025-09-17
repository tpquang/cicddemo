# CI/CD Demo: Next.js + GitHub Actions + GitHub Pages

## Chạy cục bộ
```bash
npm install
npm run dev
```

## Build & Export tĩnh
```bash
npm run build
npm run export # xuất static vào thư mục ./out
```

## Bật GitHub Pages
1) Push code lên GitHub (nhánh `main`).
2) Vào Settings → Pages → Build and deployment → Source: chọn "GitHub Actions".
3) Mỗi lần push lên `main`, workflow sẽ build và deploy tự động.

Lưu ý: Nếu dùng Project Pages (host tại `/<repository>`), bạn có thể cần cấu hình `basePath`/`assetPrefix` để phục vụ dưới sub-path.
