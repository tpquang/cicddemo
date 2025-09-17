/** @type {import('next').NextConfig} */
const nextConfig = {
	reactStrictMode: true,
	// Bật xuất tĩnh để dễ deploy qua GitHub Pages (sử dụng `next export`)
	output: 'export',
	images: { unoptimized: true },
};

export default nextConfig;
