# Script để tải JUnit 5 libraries
Write-Host "Đang tải JUnit 5 libraries..."

# Tạo thư mục lib nếu chưa có
if (-not (Test-Path "lib")) {
    New-Item -ItemType Directory -Path "lib" -Force
    Write-Host "Đã tạo thư mục lib/"
}

# Danh sách các JAR files cần tải
$jarFiles = @(
    @{
        url = "https://repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter/5.10.1/junit-jupiter-5.10.1.jar"
        filename = "junit-jupiter-5.10.1.jar"
    },
    @{
        url = "https://repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter-api/5.10.1/junit-jupiter-api-5.10.1.jar"
        filename = "junit-jupiter-api-5.10.1.jar"
    },
    @{
        url = "https://repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter-engine/5.10.1/junit-jupiter-engine-5.10.1.jar"
        filename = "junit-jupiter-engine-5.10.1.jar"
    },
    @{
        url = "https://repo1.maven.org/maven2/org/junit/platform/junit-platform-commons/1.10.1/junit-platform-commons-1.10.1.jar"
        filename = "junit-platform-commons-1.10.1.jar"
    },
    @{
        url = "https://repo1.maven.org/maven2/org/junit/platform/junit-platform-engine/1.10.1/junit-platform-engine-1.10.1.jar"
        filename = "junit-platform-engine-1.10.1.jar"
    },
    @{
        url = "https://repo1.maven.org/maven2/org/junit/platform/junit-platform-launcher/1.10.1/junit-platform-launcher-1.10.1.jar"
        filename = "junit-platform-launcher-1.10.1.jar"
    },
    @{
        url = "https://repo1.maven.org/maven2/org/apiguardian/apiguardian-api/1.1.2/apiguardian-api-1.1.2.jar"
        filename = "apiguardian-api-1.1.2.jar"
    },
    @{
        url = "https://repo1.maven.org/maven2/org/opentest4j/opentest4j/1.3.0/opentest4j-1.3.0.jar"
        filename = "opentest4j-1.3.0.jar"
    }
)

# Tải từng file
foreach ($jar in $jarFiles) {
    $filePath = "lib/$($jar.filename)"
    
    if (Test-Path $filePath) {
        Write-Host "Đã tồn tại: $($jar.filename)" -ForegroundColor Yellow
    } else {
        try {
            Write-Host "Đang tải: $($jar.filename)..." -ForegroundColor Green
            Invoke-WebRequest -Uri $jar.url -OutFile $filePath -TimeoutSec 30
            Write-Host "Tải thành công: $($jar.filename)" -ForegroundColor Green
        } catch {
            Write-Host "Lỗi khi tải $($jar.filename): $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

Write-Host "`nHoàn thành! Các JUnit libraries đã được tải vào thư mục lib/" -ForegroundColor Cyan
Write-Host "Bây giờ bạn có thể chạy tests bằng lệnh: ant test-junit5" -ForegroundColor Cyan