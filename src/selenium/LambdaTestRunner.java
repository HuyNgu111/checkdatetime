package selenium;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.JavascriptExecutor;
import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * LambdaTest Automation Runner cho DateTimeChecker
 * Test trên nhiều browsers và operating systems
 */
public class LambdaTestRunner {
    
    // LambdaTest credentials - Lấy từ https://accounts.lambdatest.com/profile
    private static final String USERNAME = System.getenv("LAMBDATEST_USERNAME") != null 
        ? System.getenv("LAMBDATEST_USERNAME") 
        : "YOUR_LAMBDATEST_USERNAME";
    
    private static final String ACCESS_KEY = System.getenv("LAMBDATEST_ACCESS_KEY") != null 
        ? System.getenv("LAMBDATEST_ACCESS_KEY") 
        : "YOUR_LAMBDATEST_ACCESS_KEY";
    
    private static final String GRID_URL = "@hub.lambdatest.com/wd/hub";
    
    private WebDriver driver;
    private String buildName;
    private String testName;
    
    public LambdaTestRunner(String browser, String version, String platform) throws Exception {
        this.buildName = "DateTimeChecker Build - " + getCurrentDateTime();
        this.testName = "Test on " + browser + " " + version + " - " + platform;
        
        // Cấu hình capabilities cho LambdaTest
        DesiredCapabilities capabilities = new DesiredCapabilities();
        capabilities.setCapability("build", buildName);
        capabilities.setCapability("name", testName);
        capabilities.setCapability("platform", platform);
        capabilities.setCapability("browserName", browser);
        capabilities.setCapability("version", version);
        capabilities.setCapability("resolution", "1920x1080");
        
        // Enable features
        capabilities.setCapability("network", true);      // Network logs
        capabilities.setCapability("visual", true);       // Visual regression
        capabilities.setCapability("video", true);        // Video recording
        capabilities.setCapability("console", true);      // Console logs
        capabilities.setCapability("terminal", true);     // Terminal logs
        
        // Khởi tạo RemoteWebDriver
        String hubURL = "https://" + USERNAME + ":" + ACCESS_KEY + GRID_URL;
        this.driver = new RemoteWebDriver(new URL(hubURL), capabilities);
        
        System.out.println("🚀 Started session: " + testName);
        System.out.println("📍 Platform: " + platform);
        System.out.println("🌐 Browser: " + browser + " " + version);
    }
    
    /**
     * Chạy các test cases
     */
    public void runTests() {
        boolean allPassed = true;
        
        try {
            System.out.println("\n=== RUNNING TEST SUITE ===\n");
            
            // Test 1: Mở Google (để demo - thay bằng app của bạn)
            allPassed &= testCase1_OpenWebsite();
            Thread.sleep(2000);
            
            // Test 2: Verify page title
            allPassed &= testCase2_VerifyTitle();
            Thread.sleep(2000);
            
            // Test 3: Search functionality
            allPassed &= testCase3_SearchFunctionality();
            Thread.sleep(2000);
            
            // Test 4: Verify search results
            allPassed &= testCase4_VerifyResults();
            Thread.sleep(2000);
            
            if (allPassed) {
                markTestStatus("passed", "All test cases passed successfully!");
                System.out.println("\n✅ ALL TESTS PASSED!");
            } else {
                markTestStatus("failed", "Some test cases failed");
                System.out.println("\n❌ SOME TESTS FAILED!");
            }
            
        } catch (Exception e) {
            System.err.println("\n❌ TEST SUITE FAILED: " + e.getMessage());
            e.printStackTrace();
            markTestStatus("failed", "Exception: " + e.getMessage());
        }
    }
    
    /**
     * Test Case 1: Mở website
     */
    private boolean testCase1_OpenWebsite() {
        try {
            System.out.println("[Test 1/4] Opening website...");
            
            // Thay bằng URL của bạn - hiện tại dùng Google để demo
            driver.get("https://www.google.com");
            
            System.out.println("✓ Website opened successfully");
            System.out.println("  URL: " + driver.getCurrentUrl());
            return true;
            
        } catch (Exception e) {
            System.err.println("✗ Test 1 FAILED: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Test Case 2: Verify page title
     */
    private boolean testCase2_VerifyTitle() {
        try {
            System.out.println("\n[Test 2/4] Verifying page title...");
            
            String title = driver.getTitle();
            System.out.println("  Page Title: " + title);
            
            if (title != null && !title.isEmpty()) {
                System.out.println("✓ Title verification passed");
                return true;
            } else {
                System.err.println("✗ Title is empty!");
                return false;
            }
            
        } catch (Exception e) {
            System.err.println("✗ Test 2 FAILED: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Test Case 3: Test search functionality
     */
    private boolean testCase3_SearchFunctionality() {
        try {
            System.out.println("\n[Test 3/4] Testing search functionality...");
            
            // Tìm search box
            WebElement searchBox = driver.findElement(By.name("q"));
            
            // Nhập search query
            String searchQuery = "DateTimeChecker automation testing";
            searchBox.sendKeys(searchQuery);
            System.out.println("  Entered: " + searchQuery);
            
            // Submit form
            searchBox.submit();
            Thread.sleep(2000);
            
            System.out.println("✓ Search functionality working");
            return true;
            
        } catch (Exception e) {
            System.err.println("✗ Test 3 FAILED: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Test Case 4: Verify search results
     */
    private boolean testCase4_VerifyResults() {
        try {
            System.out.println("\n[Test 4/4] Verifying search results...");
            
            // Đợi và kiểm tra results
            String currentUrl = driver.getCurrentUrl();
            System.out.println("  Current URL: " + currentUrl);
            
            if (currentUrl.contains("search")) {
                System.out.println("✓ Search results loaded successfully");
                return true;
            } else {
                System.err.println("✗ Results page not loaded");
                return false;
            }
            
        } catch (Exception e) {
            System.err.println("✗ Test 4 FAILED: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Đánh dấu trạng thái test trên LambdaTest dashboard
     */
    private void markTestStatus(String status, String reason) {
        try {
            ((JavascriptExecutor) driver).executeScript(
                "lambda-status=" + status
            );
            System.out.println("\n📊 Test Status: " + status.toUpperCase());
            System.out.println("📝 Reason: " + reason);
        } catch (Exception e) {
            System.err.println("⚠️ Could not mark test status: " + e.getMessage());
        }
    }
    
    /**
     * Đóng browser session
     */
    public void cleanup() {
        if (driver != null) {
            driver.quit();
            System.out.println("\n🔚 Browser session closed");
        }
    }
    
    /**
     * Lấy thời gian hiện tại
     */
    private static String getCurrentDateTime() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return LocalDateTime.now().format(formatter);
    }
    
    /**
     * Main method để chạy tests
     */
    public static void main(String[] args) {
        System.out.println("╔═══════════════════════════════════════════════╗");
        System.out.println("║   LAMBDATEST AUTOMATION - DATETIMECHECKER    ║");
        System.out.println("╚═══════════════════════════════════════════════╝");
        System.out.println();
        
        // Kiểm tra credentials
        if (USERNAME.equals("YOUR_LAMBDATEST_USERNAME") || ACCESS_KEY.equals("YOUR_LAMBDATEST_ACCESS_KEY")) {
            System.err.println("❌ ERROR: LambdaTest credentials not set!");
            System.err.println();
            System.err.println("Please set environment variables:");
            System.err.println("  LAMBDATEST_USERNAME=your_username");
            System.err.println("  LAMBDATEST_ACCESS_KEY=your_access_key");
            System.err.println();
            System.err.println("Or edit LambdaTestRunner.java and add your credentials");
            System.err.println();
            System.err.println("Get credentials from: https://accounts.lambdatest.com/profile");
            return;
        }
        
        LambdaTestRunner runner = null;
        
        try {
            // Test configuration - có thể thay đổi browser/platform
            String browser = args.length > 0 ? args[0] : "Chrome";
            String version = args.length > 1 ? args[1] : "latest";
            String platform = args.length > 2 ? args[2] : "Windows 10";
            
            // Khởi tạo runner
            runner = new LambdaTestRunner(browser, version, platform);
            
            // Chạy tests
            runner.runTests();
            
            System.out.println("\n╔═══════════════════════════════════════════════╗");
            System.out.println("║           TEST EXECUTION COMPLETED            ║");
            System.out.println("╚═══════════════════════════════════════════════╝");
            System.out.println();
            System.out.println("📊 View detailed results at:");
            System.out.println("   https://automation.lambdatest.com/timeline");
            System.out.println();
            
        } catch (Exception e) {
            System.err.println("\n❌ FATAL ERROR: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (runner != null) {
                runner.cleanup();
            }
        }
    }
}
