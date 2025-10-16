#!/bin/bash

# LambdaTest Automation Runner for Linux/Mac
# DateTimeChecker Cloud Testing

echo ""
echo "╔═══════════════════════════════════════════════════════╗"
echo "║        LAMBDATEST AUTOMATION RUNNER                   ║"
echo "║        DateTimeChecker Cloud Testing                  ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Check Java
echo "[Bước 1/5] Kiểm tra Java..."
if ! command -v java &> /dev/null; then
    echo -e "${RED}❌ Java không được tìm thấy!${NC}"
    echo "   Cài đặt Java:"
    echo "   macOS: brew install openjdk@8"
    echo "   Ubuntu: sudo apt install openjdk-8-jdk"
    exit 1
fi
echo -e "${GREEN}✅ Java đã cài đặt${NC}"
java -version
echo ""

# Step 2: Check Maven
echo "[Bước 2/5] Kiểm tra Maven..."
if ! command -v mvn &> /dev/null; then
    echo -e "${RED}❌ Maven không được tìm thấy!${NC}"
    echo "   Cài đặt Maven:"
    echo "   macOS: brew install maven"
    echo "   Ubuntu: sudo apt install maven"
    echo ""
    echo "   Hoặc chạy bằng Java trực tiếp:"
    echo "   javac -cp 'selenium-libs/*' src/selenium/LambdaTestRunner.java"
    echo "   java -cp 'selenium-libs/*:src' selenium.LambdaTestRunner"
    exit 1
fi
echo -e "${GREEN}✅ Maven đã cài đặt${NC}"
mvn -version
echo ""

# Step 3: Check LambdaTest credentials
echo "[Bước 3/5] Kiểm tra LambdaTest credentials..."
if [ -z "$LAMBDATEST_USERNAME" ]; then
    echo -e "${YELLOW}⚠️  LAMBDATEST_USERNAME chưa được set${NC}"
    echo ""
    read -p "Nhập LambdaTest Username: " LAMBDATEST_USERNAME
    export LAMBDATEST_USERNAME
fi

if [ -z "$LAMBDATEST_ACCESS_KEY" ]; then
    echo -e "${YELLOW}⚠️  LAMBDATEST_ACCESS_KEY chưa được set${NC}"
    echo ""
    read -sp "Nhập LambdaTest Access Key: " LAMBDATEST_ACCESS_KEY
    echo ""
    export LAMBDATEST_ACCESS_KEY
fi

echo -e "${GREEN}✅ Credentials:${NC}"
echo "   Username: $LAMBDATEST_USERNAME"
echo "   Access Key: ${LAMBDATEST_ACCESS_KEY:0:10}***"
echo ""
echo "💡 Lấy credentials tại: https://accounts.lambdatest.com/profile"
echo ""

# Step 4: Install dependencies
echo "[Bước 4/5] Cài đặt dependencies (Selenium, TestNG)..."
mvn clean install -DskipTests -q
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Maven install thất bại!${NC}"
    echo "   Kiểm tra pom.xml và internet connection"
    exit 1
fi
echo -e "${GREEN}✅ Dependencies đã được cài đặt${NC}"
echo ""

# Step 5: Compile code
echo "[Bước 5/5] Compile test code..."
mvn compile -q
if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Compilation thất bại!${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Code đã được compile${NC}"
echo ""

echo "╔═══════════════════════════════════════════════════════╗"
echo "║           CHẠY TESTS TRÊN LAMBDATEST CLOUD            ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo ""
echo "🌐 Tests sẽ chạy song song trên 5 browsers:"
echo "   1. Chrome on Windows 10"
echo "   2. Firefox on Windows 10"
echo "   3. Edge on Windows 10"
echo "   4. Safari on macOS Monterey"
echo "   5. Chrome on macOS Monterey"
echo ""
echo "📊 Xem real-time tại: https://automation.lambdatest.com/timeline"
echo ""

# Choose mode
echo "Chọn chế độ chạy:"
echo "[1] Chạy 1 browser (nhanh - Chrome on Windows)"
echo "[2] Chạy tất cả 5 browsers song song (đầy đủ)"
echo ""
read -p "Nhập lựa chọn (1 hoặc 2): " mode

if [ "$mode" = "1" ]; then
    echo ""
    echo "🚀 Chạy test trên Chrome Windows 10..."
    echo ""
    mvn exec:java -Dexec.mainClass="selenium.LambdaTestRunner" -Dexec.args="Chrome latest 'Windows 10'"
else
    echo ""
    echo "🚀 Chạy tests song song trên 5 browsers..."
    echo ""
    mvn test -DsuiteXmlFile=testng.xml
fi

if [ $? -eq 0 ]; then
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║              ✅ TESTS HOÀN THÀNH THÀNH CÔNG!          ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
    echo "📊 Xem chi tiết kết quả tại:"
    echo "   https://automation.lambdatest.com/timeline"
    echo ""
    echo "🎥 Video recordings và screenshots có sẵn trong dashboard"
    echo "📈 Network logs và console logs đã được ghi lại"
    echo ""
else
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║              ❌ MỘT SỐ TESTS THẤT BẠI                 ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
    echo "🔍 Kiểm tra logs phía trên để biết chi tiết"
    echo "📊 Xem dashboard: https://automation.lambdatest.com/timeline"
    echo ""
fi
