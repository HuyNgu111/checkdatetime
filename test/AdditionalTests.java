import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.DisplayName;
import static org.junit.jupiter.api.Assertions.*;
import java.time.LocalDateTime;

/**
 * Additional test cases for new methods in DateTimeChecker
 * Run these tests to improve coverage after adding new methods
 */
public class AdditionalTests {

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
        assertEquals("Đây là thời gian đêm khuya 🌙", lateNightMsg);
        
        // Test gio cao diem sang
        LocalDateTime morningRush = LocalDateTime.of(2024, 12, 23, 8, 0);
        String morningRushMsg = DateTimeChecker.getDetailedTimeMessage(morningRush);
        assertEquals("Buổi sáng - Giờ cao điểm 🚗", morningRushMsg);
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
        
        // Test cuoi thang
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
        
        // Test trong gio lam viec (14:00)
        LocalDateTime duringWork = LocalDateTime.of(2024, 12, 23, 14, 0);
        assertEquals(3, DateTimeChecker.getHoursUntilEndOfWork(duringWork), 
                     "Luc 14h phai con 3 gio lam viec");
        
        // Test sau gio lam viec (18:00)
        LocalDateTime afterWork = LocalDateTime.of(2024, 12, 23, 18, 0);
        assertEquals(-1, DateTimeChecker.getHoursUntilEndOfWork(afterWork), 
                     "Sau gio lam viec phai tra ve -1");
    }
}