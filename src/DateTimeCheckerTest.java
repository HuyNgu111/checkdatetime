import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.DisplayName;
import static org.junit.jupiter.api.Assertions.*;
import java.time.LocalDateTime;

/**
 * Test class cho DateTimeChecker
 * Chứa 8 test cases để kiểm tra các phương thức trong DateTimeChecker
 */
public class DateTimeCheckerTest {

    @Test
    @DisplayName("Test 1: Kiểm tra cuối tuần - Thứ 7")
    public void testIsWeekendSaturday() {
        // Tạo một ngày thứ 7 (Saturday)
        LocalDateTime saturday = LocalDateTime.of(2024, 12, 21, 10, 0); // 21/12/2024 là thứ 7
        
        assertTrue(DateTimeChecker.isWeekend(saturday), 
                   "Thứ 7 phải được xác định là cuối tuần");
    }

    @Test
    @DisplayName("Test 2: Kiểm tra cuối tuần - Chủ nhật")
    public void testIsWeekendSunday() {
        // Tạo một ngày chủ nhật (Sunday)
        LocalDateTime sunday = LocalDateTime.of(2024, 12, 22, 15, 30); // 22/12/2024 là chủ nhật
        
        assertTrue(DateTimeChecker.isWeekend(sunday), 
                   "Chủ nhật phải được xác định là cuối tuần");
    }

    @Test
    @DisplayName("Test 3: Kiểm tra ngày trong tuần - Thứ 2")
    public void testIsNotWeekendMonday() {
        // Tạo một ngày thứ 2 (Monday)
        LocalDateTime monday = LocalDateTime.of(2024, 12, 23, 9, 0); // 23/12/2024 là thứ 2
        
        assertFalse(DateTimeChecker.isWeekend(monday), 
                    "Thứ 2 không phải là cuối tuần");
    }

    @Test
    @DisplayName("Test 4: Kiểm tra giờ làm việc - Trong khoảng 8h-17h")
    public void testIsWorkingHoursValid() {
        // Tạo thời gian trong giờ làm việc (10:30 AM)
        LocalDateTime workingTime = LocalDateTime.of(2024, 12, 23, 10, 30);
        
        assertTrue(DateTimeChecker.isWorkingHours(workingTime), 
                   "10:30 AM phải được xác định là giờ làm việc");
        
        // Kiểm tra biên 8h
        LocalDateTime startWork = LocalDateTime.of(2024, 12, 23, 8, 0);
        assertTrue(DateTimeChecker.isWorkingHours(startWork), 
                   "8:00 AM phải được xác định là giờ làm việc");
        
        // Kiểm tra biên 17h
        LocalDateTime endWork = LocalDateTime.of(2024, 12, 23, 17, 0);
        assertTrue(DateTimeChecker.isWorkingHours(endWork), 
                   "5:00 PM phải được xác định là giờ làm việc");
    }

    @Test
    @DisplayName("Test 5: Kiểm tra ngoài giờ làm việc")
    public void testIsNotWorkingHours() {
        // Tạo thời gian ngoài giờ làm việc (6:00 AM)
        LocalDateTime earlyMorning = LocalDateTime.of(2024, 12, 23, 6, 0);
        assertFalse(DateTimeChecker.isWorkingHours(earlyMorning), 
                    "6:00 AM không phải là giờ làm việc");
        
        // Tạo thời gian tối (19:00)
        LocalDateTime evening = LocalDateTime.of(2024, 12, 23, 19, 0);
        assertFalse(DateTimeChecker.isWorkingHours(evening), 
                    "7:00 PM không phải là giờ làm việc");
    }

    @Test
    @DisplayName("Test 6: Kiểm tra ngày làm việc (không phải cuối tuần và trong giờ làm việc)")
    public void testIsWorkingDay() {
        // Tạo ngày làm việc: Thứ 3, 14:00
        LocalDateTime workingDay = LocalDateTime.of(2024, 12, 24, 14, 0); // 24/12/2024 là thứ 3
        
        assertTrue(DateTimeChecker.isWorkingDay(workingDay), 
                   "Thứ 3 lúc 2:00 PM phải được xác định là ngày làm việc");
        
        // Tạo cuối tuần trong giờ làm việc: Thứ 7, 10:00
        LocalDateTime weekendWorkingHour = LocalDateTime.of(2024, 12, 21, 10, 0);
        assertFalse(DateTimeChecker.isWorkingDay(weekendWorkingHour), 
                    "Thứ 7 không phải là ngày làm việc dù trong giờ làm việc");
    }

    @Test
    @DisplayName("Test 7: Kiểm tra giờ nghỉ trưa (12h-13h)")
    public void testIsLunchTime() {
        // Tạo thời gian nghỉ trưa (12:30)
        LocalDateTime lunchTime = LocalDateTime.of(2024, 12, 23, 12, 30);
        assertTrue(DateTimeChecker.isLunchTime(lunchTime), 
                   "12:30 PM phải được xác định là giờ nghỉ trưa");
        
        // Kiểm tra biên bắt đầu (12:00)
        LocalDateTime lunchStart = LocalDateTime.of(2024, 12, 23, 12, 0);
        assertTrue(DateTimeChecker.isLunchTime(lunchStart), 
                   "12:00 PM phải được xác định là giờ nghỉ trưa");
        
        // Kiểm tra ngoài giờ nghỉ trưa (13:00)
        LocalDateTime afterLunch = LocalDateTime.of(2024, 12, 23, 13, 0);
        assertFalse(DateTimeChecker.isLunchTime(afterLunch), 
                    "1:00 PM không phải là giờ nghỉ trưa");
    }

    @Test
    @DisplayName("Test 8: Kiểm tra buổi sáng, buổi tối và message functions")
    public void testTimePeriodsAndMessages() {
        // Test buổi sáng (8:00 AM)
        LocalDateTime morning = LocalDateTime.of(2024, 12, 23, 8, 0);
        assertTrue(DateTimeChecker.isMorning(morning), 
                   "8:00 AM phải được xác định là buổi sáng");
        
        // Test buổi tối (20:00)
        LocalDateTime evening = LocalDateTime.of(2024, 12, 23, 20, 0);
        assertTrue(DateTimeChecker.isEvening(evening), 
                   "8:00 PM phải được xác định là buổi tối");
        
        // Test weekend message
        LocalDateTime saturday = LocalDateTime.of(2024, 12, 21, 10, 0);
        String weekendMsg = DateTimeChecker.getWeekendMessage(saturday);
        assertEquals("Hôm nay là cuối tuần 🎉", weekendMsg, 
                     "Message cuối tuần không chính xác");
        
        // Test working hours message
        LocalDateTime workingTime = LocalDateTime.of(2024, 12, 23, 10, 0);
        String workingMsg = DateTimeChecker.getWorkingHoursMessage(workingTime);
        assertEquals("Đang trong giờ làm việc ⏰", workingMsg, 
                     "Message giờ làm việc không chính xác");
        
        // Test non-working hours message
        LocalDateTime nonWorkingTime = LocalDateTime.of(2024, 12, 23, 6, 0);
        String nonWorkingMsg = DateTimeChecker.getWorkingHoursMessage(nonWorkingTime);
        assertEquals("Ngoài giờ làm việc 💤", nonWorkingMsg, 
                     "Message ngoài giờ làm việc không chính xác");
    }
}