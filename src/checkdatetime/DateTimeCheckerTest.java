package checkdatetime;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.AfterAll;
import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDateTime;

@DisplayName("DateTimeChecker Test Suite - Coverage: 100%")
public class DateTimeCheckerTest {
    
    private static int totalTests = 0;
    private static int passedTests = 0;
    private static final int TOTAL_METHODS = 8;
    
    @BeforeAll
    static void setup() {
        System.out.println("\n=== Starting DateTimeChecker Tests ===");
        System.out.println("Total Methods to Test: " + TOTAL_METHODS);
    }
    
    @Test
    @DisplayName("[25%] Test 1: Cuối tuần - Thứ 7")
    void testIsWeekendSaturday() {
        System.out.println("📊 Coverage: 25% (2/8 methods)");
        totalTests++;
        LocalDateTime saturday = LocalDateTime.of(2025, 10, 18, 14, 30);
        
        assertTrue(DateTimeChecker.isWeekend(saturday), 
                  "Thứ 7 phải là cuối tuần");
        assertTrue(DateTimeChecker.isWorkingHours(saturday), 
                  "14:30 phải là giờ làm việc");
        
        passedTests++;
        printCoverage(2); // 2/8 methods tested
    }
    
    @Test
    @DisplayName("[25%] Test 2: Cuối tuần - Chủ nhật")
    void testIsWeekendSunday() {
        System.out.println("📊 Coverage: 25% (2/8 methods)");
        totalTests++;
        LocalDateTime sunday = LocalDateTime.of(2025, 10, 19, 10, 0);
        
        assertTrue(DateTimeChecker.isWeekend(sunday), 
                  "Chủ nhật phải là cuối tuần");
        assertTrue(DateTimeChecker.isMorning(sunday), 
                  "10:00 phải là buổi sáng");
        
        passedTests++;
        printCoverage(2);
    }
    
    @Test
    @DisplayName("[25%] Test 3: Ngày thường - Thứ Hai")
    void testIsNotWeekendMonday() {
        System.out.println("📊 Coverage: 25% (2/8 methods)");
        totalTests++;
        LocalDateTime monday = LocalDateTime.of(2025, 10, 13, 9, 0);
        
        assertFalse(DateTimeChecker.isWeekend(monday), 
                   "Thứ Hai không phải cuối tuần");
        assertTrue(DateTimeChecker.isWorkingHours(monday), 
                  "9:00 là giờ làm việc");
        
        passedTests++;
        printCoverage(2);
    }
    
    @Test
    @DisplayName("[13%] Test 4: Giờ làm việc hợp lệ")
    void testIsWorkingHoursValid() {
        System.out.println("📊 Coverage: 13% (1/8 methods)");
        totalTests++;
        LocalDateTime workTime = LocalDateTime.of(2025, 10, 16, 9, 30);
        
        assertTrue(DateTimeChecker.isWorkingHours(workTime), 
                  "9:30 phải là giờ làm việc");
        
        passedTests++;
        printCoverage(1);
    }
    
    @Test
    @DisplayName("[13%] Test 5: Ngoài giờ làm việc")
    void testIsNotWorkingHours() {
        System.out.println("📊 Coverage: 13% (1/8 methods)");
        totalTests++;
        LocalDateTime afterWork = LocalDateTime.of(2025, 10, 16, 19, 0);
        
        assertFalse(DateTimeChecker.isWorkingHours(afterWork), 
                   "19:00 không phải giờ làm việc");
        
        passedTests++;
        printCoverage(1);
    }
    
    @Test
    @DisplayName("[38%] Test 6: Ngày làm việc")
    void testIsWorkingDay() {
        System.out.println("📊 Coverage: 38% (3/8 methods)");
        totalTests++;
        LocalDateTime workday = LocalDateTime.of(2025, 10, 16, 14, 0);
        
        assertFalse(DateTimeChecker.isWeekend(workday), 
                   "Thứ 5 không phải cuối tuần");
        assertTrue(DateTimeChecker.isWorkingHours(workday), 
                  "14:00 là giờ làm việc");
        assertTrue(DateTimeChecker.isWorkingDay(workday), 
                  "Thứ 5 14:00 là ngày làm việc");
        
        passedTests++;
        printCoverage(3);
    }
    
    @Test
    @DisplayName("[13%] Test 7: Giờ nghỉ trưa (12h-13h)")
    void testIsLunchTime() {
        System.out.println("📊 Coverage: 13% (1/8 methods)");
        totalTests++;
        LocalDateTime lunchTime = LocalDateTime.of(2025, 10, 16, 12, 30);
        
        assertTrue(DateTimeChecker.isLunchTime(lunchTime), 
                  "12:30 phải là giờ nghỉ trưa");
        
        passedTests++;
        printCoverage(1);
    }
    
    @Test
    @DisplayName("[13%] Test 8: Buổi sáng")
    void testIsMorning() {
        System.out.println("📊 Coverage: 13% (1/8 methods)");
        totalTests++;
        LocalDateTime morning = LocalDateTime.of(2025, 10, 16, 7, 0);
        
        assertTrue(DateTimeChecker.isMorning(morning), 
                  "7:00 phải là buổi sáng");
        
        passedTests++;
        printCoverage(1);
    }
    
    @Test
    @DisplayName("[13%] Test 9: Đêm khuya")
    void testIsNotMorning() {
        System.out.println("📊 Coverage: 13% (1/8 methods)");
        totalTests++;
        LocalDateTime night = LocalDateTime.of(2025, 10, 16, 23, 0);
        
        assertFalse(DateTimeChecker.isMorning(night), 
                   "23:00 không phải buổi sáng");
        
        passedTests++;
        printCoverage(1);
    }
    
    @Test
    @DisplayName("[13%] Test 10: Buổi tối")
    void testIsEvening() {
        System.out.println("📊 Coverage: 13% (1/8 methods)");
        totalTests++;
        LocalDateTime evening = LocalDateTime.of(2025, 10, 16, 20, 0);
        
        assertTrue(DateTimeChecker.isEvening(evening), 
                  "20:00 phải là buổi tối");
        
        passedTests++;
        printCoverage(1);
    }
    
    @Test
    @DisplayName("[25%] Test 11: Giờ cao điểm sáng")
    void testMorningRushHour() {
        System.out.println("📊 Coverage: 25% (2/8 methods)");
        totalTests++;
        LocalDateTime rushHour = LocalDateTime.of(2025, 10, 16, 8, 0);
        
        assertTrue(DateTimeChecker.isMorning(rushHour), 
                  "8:00 là buổi sáng");
        assertTrue(DateTimeChecker.isWorkingHours(rushHour), 
                  "8:00 là giờ làm việc");
        
        passedTests++;
        printCoverage(2);
    }
    
    @Test
    @DisplayName("[13%] Test 12: Giờ cao điểm chiều")
    void testEveningRushHour() {
        System.out.println("📊 Coverage: 13% (1/8 methods)");
        totalTests++;
        LocalDateTime rushHour = LocalDateTime.of(2025, 10, 16, 17, 0);
        
        assertTrue(DateTimeChecker.isWorkingHours(rushHour), 
                  "17:00 vẫn là giờ làm việc");
        
        passedTests++;
        printCoverage(1);
    }
    
    @Test
    @DisplayName("[25%] Test 13: Thông điệp chi tiết")
    void testTimePeriodsAndMessages() {
        System.out.println("📊 Coverage: 25% (2/8 methods)");
        totalTests++;
        LocalDateTime weekday = LocalDateTime.of(2025, 10, 16, 10, 0);
        
        String weekendMsg = DateTimeChecker.getWeekendMessage(weekday);
        String workMsg = DateTimeChecker.getWorkingHoursMessage(weekday);
        
        assertNotNull(weekendMsg, "Thông điệp cuối tuần không được null");
        assertNotNull(workMsg, "Thông điệp giờ làm không được null");
        assertTrue(weekendMsg.contains("ngày trong tuần") || 
                  weekendMsg.contains("cuối tuần"), 
                  "Thông điệp phải chứa thông tin về tuần");
        
        passedTests++;
        printCoverage(2);
    }
    
    @Test
    @DisplayName("[50%] Test 14: Ngày đặc biệt 🌟")
    void testSpecialDay() {
        System.out.println("📊 Coverage: 50% (4/8 methods) - HIGHEST!");
        totalTests++;
        // Kiểm tra một ngày đặc biệt: Đầu giờ làm việc của thứ 2
        LocalDateTime mondayMorning = LocalDateTime.of(2025, 10, 13, 8, 0);
        
        assertFalse(DateTimeChecker.isWeekend(mondayMorning), 
                   "Thứ 2 không phải cuối tuần");
        assertTrue(DateTimeChecker.isWorkingHours(mondayMorning), 
                  "8:00 là giờ làm việc");
        assertTrue(DateTimeChecker.isWorkingDay(mondayMorning), 
                  "Thứ 2 8:00 là ngày làm việc");
        assertTrue(DateTimeChecker.isMorning(mondayMorning), 
                  "8:00 là buổi sáng");
        
        passedTests++;
        printCoverage(4);
    }
    
    @AfterAll
    static void tearDown() {
        double successRate = (passedTests * 100.0) / totalTests;
        System.out.println("\n=== Test Summary ===");
        System.out.println("Total Tests Run: " + totalTests);
        System.out.println("Passed: " + passedTests);
        System.out.println("Failed: " + (totalTests - passedTests));
        System.out.printf("Success Rate: %.1f%%\n", successRate);
        System.out.println("Overall Coverage: 100% (All " + TOTAL_METHODS + " methods tested)");
        System.out.println("===================\n");
    }
    
    private void printCoverage(int methodsTested) {
        double coverage = (methodsTested * 100.0) / TOTAL_METHODS;
        System.out.printf("  → Methods tested in this case: %d/%d (%.0f%%)\n", 
                         methodsTested, TOTAL_METHODS, coverage);
    }
}
