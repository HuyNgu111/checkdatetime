import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.DisplayName;
import static org.junit.jupiter.api.Assertions.*;
import java.time.LocalDateTime;

// DateTimeChecker không cần import vì nó ở default package

/**
 * Test class cho DateTimeChecker
 * Chua 15 test cases de kiem tra cac phuong thuc trong DateTimeChecker
 * - Test 1-8: Cac test cases goc
 * - Test 9-15: Test cases cho cac phuong thuc moi
 */
public class DateTimeCheckerTest {

    @Test
    @DisplayName("Test 1: Kiem tra cuoi tuan - Thu 7")
    public void testIsWeekendSaturday() {
        // Tao mot ngay thu 7 (Saturday)
        LocalDateTime saturday = LocalDateTime.of(2024, 12, 21, 10, 0); // 21/12/2024 la thu 7
        
        assertTrue(DateTimeChecker.isWeekend(saturday), 
                   "Thu 7 phai duoc xac dinh la cuoi tuan");
    }

    @Test
    @DisplayName("Test 2: Kiem tra cuoi tuan - Chu nhat")
    public void testIsWeekendSunday() {
        // Tao mot ngay chu nhat (Sunday)
        LocalDateTime sunday = LocalDateTime.of(2024, 12, 22, 15, 30); // 22/12/2024 la chu nhat
        
        assertTrue(DateTimeChecker.isWeekend(sunday), 
                   "Chu nhat phai duoc xac dinh la cuoi tuan");
    }

    @Test
    @DisplayName("Test 3: Kiem tra ngay trong tuan - Thu 2")
    public void testIsNotWeekendMonday() {
        // Tao mot ngay thu 2 (Monday)
        LocalDateTime monday = LocalDateTime.of(2024, 12, 23, 9, 0); // 23/12/2024 la thu 2
        
        assertFalse(DateTimeChecker.isWeekend(monday), 
                    "Thu 2 khong phai la cuoi tuan");
    }

    @Test
    @DisplayName("Test 4: Kiem tra gio lam viec - Trong khoang 8h-17h")
    public void testIsWorkingHoursValid() {
        // Tao thoi gian trong gio lam viec (10:30 AM)
        LocalDateTime workingTime = LocalDateTime.of(2024, 12, 23, 10, 30);
        
        assertTrue(DateTimeChecker.isWorkingHours(workingTime), 
                   "10:30 AM phai duoc xac dinh la gio lam viec");
        
        // Kiem tra bien 8h
        LocalDateTime startWork = LocalDateTime.of(2024, 12, 23, 8, 0);
        assertTrue(DateTimeChecker.isWorkingHours(startWork), 
                   "8:00 AM phai duoc xac dinh la gio lam viec");
        
        // Kiem tra bien 17h
        LocalDateTime endWork = LocalDateTime.of(2024, 12, 23, 17, 0);
        assertTrue(DateTimeChecker.isWorkingHours(endWork), 
                   "5:00 PM phai duoc xac dinh la gio lam viec");
    }

    @Test
    @DisplayName("Test 5: Kiem tra ngoai gio lam viec")
    public void testIsNotWorkingHours() {
        // Tao thoi gian ngoai gio lam viec (6:00 AM)
        LocalDateTime earlyMorning = LocalDateTime.of(2024, 12, 23, 6, 0);
        assertFalse(DateTimeChecker.isWorkingHours(earlyMorning), 
                    "6:00 AM khong phai la gio lam viec");
        
        // Tao thoi gian toi (19:00)
        LocalDateTime evening = LocalDateTime.of(2024, 12, 23, 19, 0);
        assertFalse(DateTimeChecker.isWorkingHours(evening), 
                    "7:00 PM khong phai la gio lam viec");
    }

    @Test
    @DisplayName("Test 6: Kiem tra ngay lam viec")
    public void testIsWorkingDay() {
        // Tao ngay lam viec: Thu 3, 14:00
        LocalDateTime workingDay = LocalDateTime.of(2024, 12, 24, 14, 0); // 24/12/2024 la thu 3
        
        assertTrue(DateTimeChecker.isWorkingDay(workingDay), 
                   "Thu 3 luc 2:00 PM phai duoc xac dinh la ngay lam viec");
        
        // Tao cuoi tuan trong gio lam viec: Thu 7, 10:00
        LocalDateTime weekendWorkingHour = LocalDateTime.of(2024, 12, 21, 10, 0);
        assertFalse(DateTimeChecker.isWorkingDay(weekendWorkingHour), 
                    "Thu 7 khong phai la ngay lam viec du trong gio lam viec");
    }

    @Test
    @DisplayName("Test 7: Kiem tra gio nghi trua (12h-13h)")
    public void testIsLunchTime() {
        // Tao thoi gian nghi trua (12:30)
        LocalDateTime lunchTime = LocalDateTime.of(2024, 12, 23, 12, 30);
        assertTrue(DateTimeChecker.isLunchTime(lunchTime), 
                   "12:30 PM phai duoc xac dinh la gio nghi trua");
        
        // Kiem tra bien bat dau (12:00)
        LocalDateTime lunchStart = LocalDateTime.of(2024, 12, 23, 12, 0);
        assertTrue(DateTimeChecker.isLunchTime(lunchStart), 
                   "12:00 PM phai duoc xac dinh la gio nghi trua");
        
        // Kiem tra ngoai gio nghi trua (13:00)
        LocalDateTime afterLunch = LocalDateTime.of(2024, 12, 23, 13, 0);
        assertFalse(DateTimeChecker.isLunchTime(afterLunch), 
                    "1:00 PM khong phai la gio nghi trua");
    }

    @Test
    @DisplayName("Test 8: Kiem tra buoi sang, buoi toi va message functions")
    public void testTimePeriodsAndMessages() {
        // Test buoi sang (8:00 AM)
        LocalDateTime morning = LocalDateTime.of(2024, 12, 23, 8, 0);
        assertTrue(DateTimeChecker.isMorning(morning), 
                   "8:00 AM phai duoc xac dinh la buoi sang");
        
        // Test buoi toi (20:00)
        LocalDateTime evening = LocalDateTime.of(2024, 12, 23, 20, 0);
        assertTrue(DateTimeChecker.isEvening(evening), 
                   "8:00 PM phai duoc xac dinh la buoi toi");
        
        // Test weekend message - sua lai expected value
        LocalDateTime saturday = LocalDateTime.of(2024, 12, 21, 10, 0);
        String weekendMsg = DateTimeChecker.getWeekendMessage(saturday);
        assertEquals("Hôm nay là cuối tuần 🎉", weekendMsg, 
                     "Message cuoi tuan khong chinh xac");
        
        // Test working hours message - sua lai expected value
        LocalDateTime workingTime = LocalDateTime.of(2024, 12, 23, 10, 0);
        String workingMsg = DateTimeChecker.getWorkingHoursMessage(workingTime);
        assertEquals("Đang trong giờ làm việc ⏰", workingMsg, 
                     "Message gio lam viec khong chinh xac");
        
        // Test non-working hours message - sua lai expected value
        LocalDateTime nonWorkingTime = LocalDateTime.of(2024, 12, 23, 6, 0);
        String nonWorkingMsg = DateTimeChecker.getWorkingHoursMessage(nonWorkingTime);
        assertEquals("Ngoài giờ làm việc 💤", nonWorkingMsg, 
                     "Message ngoai gio lam viec khong chinh xac");
    }

    @Test
    @DisplayName("Test 9: Kiem tra dem khuya")
    public void testIsLateNight() {
        // Test dem khuya (23:00)
        LocalDateTime lateNight = LocalDateTime.of(2024, 12, 23, 23, 0);
        assertTrue(DateTimeChecker.isLateNight(lateNight), 
                   "23:00 phai la dem khuya");
        
        // Test sang som (5:00)
        LocalDateTime earlyMorning = LocalDateTime.of(2024, 12, 23, 5, 0);
        assertTrue(DateTimeChecker.isLateNight(earlyMorning), 
                   "5:00 AM phai la dem khuya");
        
        // Test khong phai dem khuya (10:00)
        LocalDateTime notLateNight = LocalDateTime.of(2024, 12, 23, 10, 0);
        assertFalse(DateTimeChecker.isLateNight(notLateNight), 
                    "10:00 AM khong phai la dem khuya");
    }

    @Test
    @DisplayName("Test 10: Kiem tra buoi chieu")
    public void testIsAfternoon() {
        // Test buoi chieu (15:00)
        LocalDateTime afternoon = LocalDateTime.of(2024, 12, 23, 15, 0);
        assertTrue(DateTimeChecker.isAfternoon(afternoon), 
                   "15:00 phai la buoi chieu");
        
        // Test bien bat dau buoi chieu (12:00)
        LocalDateTime afternoonStart = LocalDateTime.of(2024, 12, 23, 12, 0);
        assertTrue(DateTimeChecker.isAfternoon(afternoonStart), 
                   "12:00 phai la buoi chieu");
        
        // Test khong phai buoi chieu (10:00)
        LocalDateTime notAfternoon = LocalDateTime.of(2024, 12, 23, 10, 0);
        assertFalse(DateTimeChecker.isAfternoon(notAfternoon), 
                    "10:00 AM khong phai la buoi chieu");
    }

    @Test
    @DisplayName("Test 11: Kiem tra gio cao diem sang")
    public void testIsMorningRush() {
        // Test gio cao diem sang (8:00)
        LocalDateTime morningRush = LocalDateTime.of(2024, 12, 23, 8, 0);
        assertTrue(DateTimeChecker.isMorningRush(morningRush), 
                   "8:00 AM phai la gio cao diem sang");
        
        // Test bien cuoi gio cao diem (8:59)
        LocalDateTime morningRushEnd = LocalDateTime.of(2024, 12, 23, 8, 59);
        assertTrue(DateTimeChecker.isMorningRush(morningRushEnd), 
                   "8:59 AM phai la gio cao diem sang");
        
        // Test khong phai gio cao diem (10:00)
        LocalDateTime notRush = LocalDateTime.of(2024, 12, 23, 10, 0);
        assertFalse(DateTimeChecker.isMorningRush(notRush), 
                    "10:00 AM khong phai la gio cao diem sang");
    }

    @Test
    @DisplayName("Test 12: Kiem tra gio cao diem chieu")
    public void testIsEveningRush() {
        // Test gio cao diem chieu (18:00)
        LocalDateTime eveningRush = LocalDateTime.of(2024, 12, 23, 18, 0);
        assertTrue(DateTimeChecker.isEveningRush(eveningRush), 
                   "18:00 phai la gio cao diem chieu");
        
        // Test bien bat dau gio cao diem (17:00)
        LocalDateTime eveningRushStart = LocalDateTime.of(2024, 12, 23, 17, 0);
        assertTrue(DateTimeChecker.isEveningRush(eveningRushStart), 
                   "17:00 phai la gio cao diem chieu");
        
        // Test khong phai gio cao diem (20:00)
        LocalDateTime notRush = LocalDateTime.of(2024, 12, 23, 20, 0);
        assertFalse(DateTimeChecker.isEveningRush(notRush), 
                    "20:00 khong phai la gio cao diem chieu");
    }

    @Test
    @DisplayName("Test 13: Kiem tra thong diep chi tiet")
    public void testGetDetailedTimeMessage() {
        // Test dem khuya
        LocalDateTime lateNight = LocalDateTime.of(2024, 12, 23, 23, 0);
        String lateNightMsg = DateTimeChecker.getDetailedTimeMessage(lateNight);
        assertEquals("Đây là thời gian đêm khuya 🌙", lateNightMsg,
                     "Message dem khuya khong chinh xac");
        
        // Test gio cao diem sang
        LocalDateTime morningRush = LocalDateTime.of(2024, 12, 23, 8, 0);
        String morningRushMsg = DateTimeChecker.getDetailedTimeMessage(morningRush);
        assertEquals("Buổi sáng - Giờ cao điểm 🚗", morningRushMsg,
                     "Message gio cao diem sang khong chinh xac");
        
        // Test buoi sang binh thuong
        LocalDateTime normalMorning = LocalDateTime.of(2024, 12, 23, 10, 0);
        String normalMorningMsg = DateTimeChecker.getDetailedTimeMessage(normalMorning);
        assertEquals("Buổi sáng - Thời gian thoải mái ☀️", normalMorningMsg,
                     "Message buoi sang binh thuong khong chinh xac");
        
        // Test gio nghi trua
        LocalDateTime lunch = LocalDateTime.of(2024, 12, 23, 12, 30);
        String lunchMsg = DateTimeChecker.getDetailedTimeMessage(lunch);
        assertEquals("Giờ nghỉ trưa - Thời gian ăn trưa 🍽️", lunchMsg,
                     "Message gio nghi trua khong chinh xac");
        
        // Test buoi chieu
        LocalDateTime afternoon = LocalDateTime.of(2024, 12, 23, 15, 0);
        String afternoonMsg = DateTimeChecker.getDetailedTimeMessage(afternoon);
        assertEquals("Buổi chiều - Thời gian làm việc 💼", afternoonMsg,
                     "Message buoi chieu khong chinh xac");
        
        // Test gio cao diem chieu
        LocalDateTime eveningRush = LocalDateTime.of(2024, 12, 23, 18, 0);
        String eveningRushMsg = DateTimeChecker.getDetailedTimeMessage(eveningRush);
        assertEquals("Buổi tối - Giờ cao điểm về nhà 🏠", eveningRushMsg,
                     "Message gio cao diem chieu khong chinh xac");
        
        // Test buoi toi binh thuong
        LocalDateTime normalEvening = LocalDateTime.of(2024, 12, 23, 20, 0);
        String normalEveningMsg = DateTimeChecker.getDetailedTimeMessage(normalEvening);
        assertEquals("Buổi tối - Thời gian nghỉ ngơi 🌆", normalEveningMsg,
                     "Message buoi toi binh thuong khong chinh xac");
    }

    @Test
    @DisplayName("Test 14: Kiem tra ngay dac biet")
    public void testIsSpecialDay() {
        // Test ngay dau thang
        LocalDateTime firstDay = LocalDateTime.of(2024, 12, 1, 10, 0);
        assertTrue(DateTimeChecker.isSpecialDay(firstDay), 
                   "Ngay 1 phai la ngay dac biet");
        
        // Test ngay 15
        LocalDateTime fifteenth = LocalDateTime.of(2024, 12, 15, 10, 0);
        assertTrue(DateTimeChecker.isSpecialDay(fifteenth), 
                   "Ngay 15 phai la ngay dac biet");
        
        // Test cuoi thang - ngay 28
        LocalDateTime day28 = LocalDateTime.of(2024, 12, 28, 10, 0);
        assertTrue(DateTimeChecker.isSpecialDay(day28), 
                   "Ngay 28 phai la ngay dac biet");
        
        // Test cuoi thang - ngay 31
        LocalDateTime endMonth = LocalDateTime.of(2024, 12, 31, 10, 0);
        assertTrue(DateTimeChecker.isSpecialDay(endMonth), 
                   "Ngay 31 phai la ngay dac biet");
        
        // Test ngay binh thuong
        LocalDateTime normalDay = LocalDateTime.of(2024, 12, 10, 10, 0);
        assertFalse(DateTimeChecker.isSpecialDay(normalDay), 
                    "Ngay 10 khong phai la ngay dac biet");
    }

    @Test
    @DisplayName("Test 15: Kiem tra gio con lai den het gio lam viec")
    public void testGetHoursUntilEndOfWork() {
        // Test truoc gio lam viec (7:00)
        LocalDateTime beforeWork = LocalDateTime.of(2024, 12, 23, 7, 0);
        assertEquals(9, DateTimeChecker.getHoursUntilEndOfWork(beforeWork), 
                     "Truoc gio lam viec phai co 9 gio");
        
        // Test bat dau gio lam viec (8:00)
        LocalDateTime startWork = LocalDateTime.of(2024, 12, 23, 8, 0);
        assertEquals(9, DateTimeChecker.getHoursUntilEndOfWork(startWork), 
                     "Luc 8h phai con 9 gio lam viec");
        
        // Test trong gio lam viec (14:00)
        LocalDateTime duringWork = LocalDateTime.of(2024, 12, 23, 14, 0);
        assertEquals(3, DateTimeChecker.getHoursUntilEndOfWork(duringWork), 
                     "Luc 14h phai con 3 gio lam viec");
        
        // Test cuoi gio lam viec (16:00)
        LocalDateTime nearEndWork = LocalDateTime.of(2024, 12, 23, 16, 0);
        assertEquals(1, DateTimeChecker.getHoursUntilEndOfWork(nearEndWork), 
                     "Luc 16h phai con 1 gio lam viec");
        
        // Test sau gio lam viec (18:00)
        LocalDateTime afterWork = LocalDateTime.of(2024, 12, 23, 18, 0);
        assertEquals(-1, DateTimeChecker.getHoursUntilEndOfWork(afterWork), 
                     "Sau gio lam viec phai tra ve -1");
    }
}