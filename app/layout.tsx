export const metadata = {
  title: 'CI/CD Demo',
  description: 'Demo Next.js + GitHub Actions CI/CD'
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="vi">
      <body style={{
        fontFamily: 'system-ui, -apple-system, Segoe UI, Roboto, Helvetica, Arial, Noto Sans, Apple Color Emoji, Segoe UI Emoji',
        margin: 0,
        padding: 24
      }}>
        {children}
      </body>
    </html>
  );
}


