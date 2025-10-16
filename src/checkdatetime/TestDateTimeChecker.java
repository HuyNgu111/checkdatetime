package checkdatetime;

import java.time.LocalDateTime;

public class TestDateTimeChecker {
    
    // Biến đếm cho coverage
    private static int totalMethods = 8; // Tổng số phương thức cần test
    private static int[] methodsCovered = new int[totalMethods]; // Theo dõi các method đã test
    
    public static void main(String[] args) {
        System.out.println("=== TEST DATETIME CHECKER ===\n");
        
        // Test 1: Thời gian hiện tại
        System.out.println("1. THỜI GIAN HIỆN TẠI:");
        LocalDateTime now = LocalDateTime.now();
        testDateTime(now, 1);
        
        // Test 2: Cuối tuần (Thứ 7)
        System.out.println("\n2. CUỐI TUẦN - THỨ 7:");
        LocalDateTime saturday = LocalDateTime.of(2025, 10, 18, 14, 30); // Thứ 7, 14:30
        testDateTime(saturday, 2);
        
        // Test 3: Cuối tuần (Chủ nhật)
        System.out.println("\n3. CUỐI TUẦN - CHỦ NHẬT:");
        LocalDateTime sunday = LocalDateTime.of(2025, 10, 19, 10, 0); // Chủ nhật, 10:00
        testDateTime(sunday, 3);
        
        // Test 4: Ngày thường, giờ làm việc
        System.out.println("\n4. NGÀY THƯỜNG - GIỜ LÀM VIỆC:");
        LocalDateTime workday = LocalDateTime.of(2025, 10, 16, 9, 30); // Thứ 5, 9:30
        testDateTime(workday, 4);
        
        // Test 5: Ngày thường, ngoài giờ làm việc
        System.out.println("\n5. NGÀY THƯỜNG - NGOÀI GIỜ:");
        LocalDateTime afterWork = LocalDateTime.of(2025, 10, 16, 19, 0); // Thứ 5, 19:00
        testDateTime(afterWork, 5);
        
        // Test 6: Giờ nghỉ trưa
        System.out.println("\n6. GIỜ NGHỈ TRƯA:");
        LocalDateTime lunch = LocalDateTime.of(2025, 10, 16, 12, 30); // Thứ 5, 12:30
        testDateTime(lunch, 6);
        
        // Test 7: Buổi sáng sớm
        System.out.println("\n7. BUỔI SÁNG SỚM:");
        LocalDateTime morning = LocalDateTime.of(2025, 10, 16, 7, 0); // Thứ 5, 7:00
        testDateTime(morning, 7);
        
        // Test 8: Buổi tối
        System.out.println("\n8. BUỔI TỐI:");
        LocalDateTime evening = LocalDateTime.of(2025, 10, 16, 20, 0); // Thứ 5, 20:00
        testDateTime(evening, 8);
        
        // Hiển thị tổng kết coverage
        printCoverageSummary();
        
        System.out.println("\n=== TẤT CẢ TEST HOÀN THÀNH ===");
    }
    
    private static void testDateTime(LocalDateTime dt, int testNumber) {
        System.out.println("Thời gian: " + dt);
        System.out.println("Ngày: " + dt.getDayOfWeek());
        System.out.println("Giờ: " + dt.getHour() + ":" + String.format("%02d", dt.getMinute()));
        System.out.println();
        
        // Đếm số methods được test trong test case này
        int methodsTestedInThisCase = 0;
        
        // Test các phương thức và đánh dấu coverage
        boolean result1 = DateTimeChecker.isWeekend(dt);
        methodsCovered[0] = 1;
        methodsTestedInThisCase++;
        System.out.printf("✓ isWeekend(): %-5s", result1);
        printMethodCoverage(1, methodsTestedInThisCase);
        
        boolean result2 = DateTimeChecker.isWorkingHours(dt);
        methodsCovered[1] = 1;
        methodsTestedInThisCase++;
        System.out.printf("✓ isWorkingHours(): %-5s", result2);
        printMethodCoverage(2, methodsTestedInThisCase);
        
        boolean result3 = DateTimeChecker.isWorkingDay(dt);
        methodsCovered[2] = 1;
        methodsTestedInThisCase++;
        System.out.printf("✓ isWorkingDay(): %-5s", result3);
        printMethodCoverage(3, methodsTestedInThisCase);
        
        boolean result4 = DateTimeChecker.isLunchTime(dt);
        methodsCovered[3] = 1;
        methodsTestedInThisCase++;
        System.out.printf("✓ isLunchTime(): %-5s", result4);
        printMethodCoverage(4, methodsTestedInThisCase);
        
        boolean result5 = DateTimeChecker.isMorning(dt);
        methodsCovered[4] = 1;
        methodsTestedInThisCase++;
        System.out.printf("✓ isMorning(): %-5s", result5);
        printMethodCoverage(5, methodsTestedInThisCase);
        
        boolean result6 = DateTimeChecker.isEvening(dt);
        methodsCovered[5] = 1;
        methodsTestedInThisCase++;
        System.out.printf("✓ isEvening(): %-5s", result6);
        printMethodCoverage(6, methodsTestedInThisCase);
        
        System.out.println();
        
        String msg1 = DateTimeChecker.getWeekendMessage(dt);
        methodsCovered[6] = 1;
        methodsTestedInThisCase++;
        System.out.printf("→ %s", msg1);
        printMethodCoverage(7, methodsTestedInThisCase);
        
        String msg2 = DateTimeChecker.getWorkingHoursMessage(dt);
        methodsCovered[7] = 1;
        methodsTestedInThisCase++;
        System.out.printf("→ %s", msg2);
        printMethodCoverage(8, methodsTestedInThisCase);
        
        // Hiển thị coverage cho test case này
        double testCaseCoverage = (methodsTestedInThisCase * 100.0) / totalMethods;
        System.out.println();
        System.out.printf("📊 Test Case #%d Coverage: %.0f%% (%d/%d methods)\n", 
                         testNumber, testCaseCoverage, methodsTestedInThisCase, totalMethods);
    }
    
    private static void printMethodCoverage(int methodNumber, int totalTested) {
        double currentCoverage = (totalTested * 100.0) / totalMethods;
        System.out.printf("  [Coverage: %.0f%%]\n", currentCoverage);
    }
    
    private static void printCoverageSummary() {
        String separator = "============================================================";
        System.out.println("\n" + separator);
        System.out.println("📊 TỔNG KẾT ĐỘ BAO PHỦ (COVERAGE SUMMARY)");
        System.out.println(separator);
        
        int coveredMethods = 0;
        for (int i = 0; i < totalMethods; i++) {
            if (methodsCovered[i] == 1) {
                coveredMethods++;
            }
        }
        
        double totalCoverage = (coveredMethods * 100.0) / totalMethods;
        
        System.out.println("\nCác phương thức đã được test:");
        String[] methodNames = {
            "isWeekend()",
            "isWorkingHours()",
            "isWorkingDay()",
            "isLunchTime()",
            "isMorning()",
            "isEvening()",
            "getWeekendMessage()",
            "getWorkingHoursMessage()"
        };
        
        for (int i = 0; i < totalMethods; i++) {
            String status = methodsCovered[i] == 1 ? "✅" : "❌";
            System.out.printf("  %s %d. %-30s %s\n", 
                             status, i + 1, methodNames[i], 
                             methodsCovered[i] == 1 ? "TESTED" : "NOT TESTED");
        }
        
        System.out.println("\n" + separator);
        System.out.printf("TỔNG ĐỘ BAO PHỦ: %.0f%% (%d/%d methods)\n", 
                         totalCoverage, coveredMethods, totalMethods);
        System.out.println(separator);
    }
}
