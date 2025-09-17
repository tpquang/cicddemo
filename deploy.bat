@echo off
REM Script deploy thủ công lên server cho Windows
REM Sử dụng: deploy.bat

echo 🚀 Bắt đầu quá trình deploy...

REM Build ứng dụng
echo 📦 Building Next.js app...
call npm run build

if %ERRORLEVEL% neq 0 (
    echo ❌ Build failed!
    exit /b 1
)

REM Tạo file nén (cần có 7-zip hoặc WinRAR)
echo 📁 Creating deployment archive...
cd out
powershell Compress-Archive -Path * -DestinationPath ..\deployment.zip -Force
cd ..

REM Upload lên server (thay đổi thông tin server của bạn)
echo ⬆️ Uploading to server...
scp deployment.zip root@103.142.24.175:/tmp/

REM Deploy trên server
echo 🔧 Deploying on server...
ssh root@103.142.24.175 "mkdir -p /var/www/html && rm -rf /var/www/html/* && cd /var/www/html && unzip /tmp/deployment.zip && rm /tmp/deployment.zip && chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html && echo '✅ Deploy completed successfully!'"

REM Cleanup local files
del deployment.zip

echo 🎉 Deploy hoàn thành!
pause
