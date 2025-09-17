#!/bin/bash

# Script deploy thủ công lên server
# Sử dụng: ./deploy.sh

echo "🚀 Bắt đầu quá trình deploy..."

# Build ứng dụng
echo "📦 Building Next.js app..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

# Tạo file nén
echo "📁 Creating deployment archive..."
cd out
tar -czf ../deployment.tar.gz .
cd ..

# Upload lên server (thay đổi thông tin server của bạn)
echo "⬆️ Uploading to server..."
scp deployment.tar.gz root@103.142.24.175:/tmp/

# Deploy trên server
echo "🔧 Deploying on server..."
ssh root@103.142.24.175 << 'EOF'
    # Backup nếu cần
    if [ -d "/var/www/html" ]; then
        cp -r /var/www/html /var/www/html.backup.$(date +%Y%m%d_%H%M%S) 2>/dev/null || true
    fi
    
    # Tạo thư mục nếu chưa có
    mkdir -p /var/www/html
    
    # Xóa nội dung cũ
    rm -rf /var/www/html/*
    
    # Giải nén file mới
    cd /var/www/html
    tar -xzf /tmp/deployment.tar.gz
    
    # Xóa file tar
    rm /tmp/deployment.tar.gz
    
    # Set permissions
    chown -R www-data:www-data /var/www/html
    chmod -R 755 /var/www/html
    
    echo "✅ Deploy completed successfully!"
EOF

# Cleanup local files
rm -f deployment.tar.gz

echo "🎉 Deploy hoàn thành!"
