/** @type {import('next').NextConfig} */
const nextConfig = {
	reactStrictMode: true,
	// Bật xuất tĩnh để deploy lên server
	output: 'export',
	// Tắt tối ưu hóa hình ảnh cho static export
	images: { unoptimized: true },
	// Đảm bảo không có trailing slash
	trailingSlash: false,
	// Tắt các tính năng không cần thiết cho static export
	distDir: 'out',
};

module.exports = nextConfig;
