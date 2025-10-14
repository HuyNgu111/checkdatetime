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

    @Test
    @DisplayName("Test 9: Kiểm tra đêm khuya (22h-6h)")
    public void testIsLateNight() {
        // Test 23:00 - đêm khuya
        LocalDateTime lateNight = LocalDateTime.of(2024, 12, 23, 23, 0);
        assertTrue(DateTimeChecker.isLateNight(lateNight), 
                   "23:00 phải được xác định là đêm khuya");
        
        // Test 2:00 AM - đêm khuya
        LocalDateTime earlyMorning = LocalDateTime.of(2024, 12, 23, 2, 0);
        assertTrue(DateTimeChecker.isLateNight(earlyMorning), 
                   "2:00 AM phải được xác định là đêm khuya");
        
        // Test 10:00 AM - không phải đêm khuya
        LocalDateTime daytime = LocalDateTime.of(2024, 12, 23, 10, 0);
        assertFalse(DateTimeChecker.isLateNight(daytime), 
                    "10:00 AM không phải là đêm khuya");
    }

    @Test
    @DisplayName("Test 10: Kiểm tra buổi chiều (13h-18h)")
    public void testIsAfternoon() {
        // Test 15:00 - buổi chiều
        LocalDateTime afternoon = LocalDateTime.of(2024, 12, 23, 15, 0);
        assertTrue(DateTimeChecker.isAfternoon(afternoon), 
                   "15:00 phải được xác định là buổi chiều");
        
        // Test 13:00 - bắt đầu buổi chiều
        LocalDateTime afternoonStart = LocalDateTime.of(2024, 12, 23, 13, 0);
        assertTrue(DateTimeChecker.isAfternoon(afternoonStart), 
                   "13:00 phải được xác định là buổi chiều");
        
        // Test 11:00 - không phải buổi chiều
        LocalDateTime morning = LocalDateTime.of(2024, 12, 23, 11, 0);
        assertFalse(DateTimeChecker.isAfternoon(morning), 
                    "11:00 không phải là buổi chiều");
    }

    @Test
    @DisplayName("Test 11: Kiểm tra giờ cao điểm sáng (7h-9h)")
    public void testIsMorningRush() {
        // Test 8:00 - giờ cao điểm sáng
        LocalDateTime morningRush = LocalDateTime.of(2024, 12, 23, 8, 0);
        assertTrue(DateTimeChecker.isMorningRush(morningRush), 
                   "8:00 phải được xác định là giờ cao điểm sáng");
        
        // Test 7:30 - giờ cao điểm sáng
        LocalDateTime earlyRush = LocalDateTime.of(2024, 12, 23, 7, 30);
        assertTrue(DateTimeChecker.isMorningRush(earlyRush), 
                   "7:30 phải được xác định là giờ cao điểm sáng");
        
        // Test 10:00 - không phải giờ cao điểm sáng
        LocalDateTime notRush = LocalDateTime.of(2024, 12, 23, 10, 0);
        assertFalse(DateTimeChecker.isMorningRush(notRush), 
                    "10:00 không phải là giờ cao điểm sáng");
    }

    @Test
    @DisplayName("Test 12: Kiểm tra giờ cao điểm chiều (17h-19h)")
    public void testIsEveningRush() {
        // Test 18:00 - giờ cao điểm chiều
        LocalDateTime eveningRush = LocalDateTime.of(2024, 12, 23, 18, 0);
        assertTrue(DateTimeChecker.isEveningRush(eveningRush), 
                   "18:00 phải được xác định là giờ cao điểm chiều");
        
        // Test 17:30 - giờ cao điểm chiều
        LocalDateTime rushStart = LocalDateTime.of(2024, 12, 23, 17, 30);
        assertTrue(DateTimeChecker.isEveningRush(rushStart), 
                   "17:30 phải được xác định là giờ cao điểm chiều");
        
        // Test 20:00 - không phải giờ cao điểm chiều
        LocalDateTime notRush = LocalDateTime.of(2024, 12, 23, 20, 0);
        assertFalse(DateTimeChecker.isEveningRush(notRush), 
                    "20:00 không phải là giờ cao điểm chiều");
    }

    @Test
    @DisplayName("Test 13: Kiểm tra message chi tiết theo thời gian")
    public void testGetDetailedTimeMessage() {
        // Test message buổi sáng
        LocalDateTime morning = LocalDateTime.of(2024, 12, 23, 9, 0);
        String morningMsg = DateTimeChecker.getDetailedTimeMessage(morning);
        assertNotNull(morningMsg, "Message buổi sáng không được null");
        assertTrue(morningMsg.contains("sáng"), "Message phải chứa từ 'sáng'");
        
        // Test message buổi chiều
        LocalDateTime afternoon = LocalDateTime.of(2024, 12, 23, 15, 0);
        String afternoonMsg = DateTimeChecker.getDetailedTimeMessage(afternoon);
        assertNotNull(afternoonMsg, "Message buổi chiều không được null");
        assertTrue(afternoonMsg.contains("chiều"), "Message phải chứa từ 'chiều'");
        
        // Test message đêm khuya
        LocalDateTime lateNight = LocalDateTime.of(2024, 12, 23, 23, 0);
        String nightMsg = DateTimeChecker.getDetailedTimeMessage(lateNight);
        assertNotNull(nightMsg, "Message đêm khuya không được null");
        assertTrue(nightMsg.contains("đêm") || nightMsg.contains("khuya"), 
                   "Message phải chứa từ 'đêm' hoặc 'khuya'");
    }

    @Test
    @DisplayName("Test 14: Kiểm tra ngày đặc biệt")
    public void testIsSpecialDay() {
        // Test ngày lễ Tết (1/1)
        LocalDateTime newYear = LocalDateTime.of(2024, 1, 1, 10, 0);
        assertTrue(DateTimeChecker.isSpecialDay(newYear), 
                   "1/1 phải được xác định là ngày đặc biệt");
        
        // Test ngày Valentine (14/2)
        LocalDateTime valentine = LocalDateTime.of(2024, 2, 14, 15, 0);
        assertTrue(DateTimeChecker.isSpecialDay(valentine), 
                   "14/2 phải được xác định là ngày đặc biệt");
        
        // Test ngày thông thường
        LocalDateTime normalDay = LocalDateTime.of(2024, 3, 15, 10, 0);
        assertFalse(DateTimeChecker.isSpecialDay(normalDay), 
                    "15/3 không phải là ngày đặc biệt");
    }

    @Test
    @DisplayName("Test 15: Kiểm tra số giờ còn lại đến hết giờ làm việc")
    public void testGetHoursUntilEndOfWork() {
        // Test lúc 14:00 - còn 3 giờ đến 17:00
        LocalDateTime afternoon = LocalDateTime.of(2024, 12, 23, 14, 0);
        int hoursLeft = DateTimeChecker.getHoursUntilEndOfWork(afternoon);
        assertEquals(3, hoursLeft, "Lúc 14:00 phải còn 3 giờ đến hết giờ làm việc");
        
        // Test lúc 16:00 - còn 1 giờ đến 17:00
        LocalDateTime lateAfternoon = LocalDateTime.of(2024, 12, 23, 16, 0);
        int oneHourLeft = DateTimeChecker.getHoursUntilEndOfWork(lateAfternoon);
        assertEquals(1, oneHourLeft, "Lúc 16:00 phải còn 1 giờ đến hết giờ làm việc");
        
        // Test sau 17:00 - trả về 0
        LocalDateTime afterWork = LocalDateTime.of(2024, 12, 23, 18, 0);
        int noHoursLeft = DateTimeChecker.getHoursUntilEndOfWork(afterWork);
        assertEquals(0, noHoursLeft, "Sau 17:00 phải trả về 0 giờ");
    }
}