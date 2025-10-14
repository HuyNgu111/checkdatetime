package checkdatetime;

import java.time.LocalDateTime;
import java.time.DayOfWeek;

public class DateTimeChecker {
    
    /**
     * Kiểm tra xem ngày đã cho có phải là cuối tuần không
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là cuối tuần (thứ 7 hoặc chủ nhật), false nếu không
     */
    public static boolean isWeekend(LocalDateTime dateTime) {
        DayOfWeek day = dateTime.getDayOfWeek();
        return day == DayOfWeek.SATURDAY || day == DayOfWeek.SUNDAY;
    }
    
    /**
     * Kiểm tra xem giờ đã cho có phải là giờ làm việc không (8h - 17h)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu trong giờ làm việc, false nếu không
     */
    public static boolean isWorkingHours(LocalDateTime dateTime) {
        int hour = dateTime.getHour();
        return hour >= 8 && hour <= 17;
    }
    
    /**
     * Kiểm tra xem có phải là ngày làm việc không (không phải cuối tuần và trong giờ làm việc)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là ngày làm việc, false nếu không
     */
    public static boolean isWorkingDay(LocalDateTime dateTime) {
        return !isWeekend(dateTime) && isWorkingHours(dateTime);
    }
    
    /**
     * Lấy thông điệp mô tả về tình trạng cuối tuần
     * @param dateTime thời gian cần kiểm tra
     * @return thông điệp mô tả
     */
    public static String getWeekendMessage(LocalDateTime dateTime) {
        if (isWeekend(dateTime)) {
            return "Hôm nay là cuối tuần 🎉";
        } else {
            return "Hôm nay là ngày trong tuần 📅";
        }
    }
    
    /**
     * Lấy thông điệp mô tả về tình trạng giờ làm việc
     * @param dateTime thời gian cần kiểm tra
     * @return thông điệp mô tả
     */
    public static String getWorkingHoursMessage(LocalDateTime dateTime) {
        if (isWorkingHours(dateTime)) {
            return "Đang trong giờ làm việc ⏰";
        } else {
            return "Ngoài giờ làm việc 💤";
        }
    }
    
    /**
     * Kiểm tra xem có phải là giờ nghỉ trưa không (12h - 13h)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là giờ nghỉ trưa, false nếu không
     */
    public static boolean isLunchTime(LocalDateTime dateTime) {
        int hour = dateTime.getHour();
        return hour >= 12 && hour < 13;
    }
    
    /**
     * Kiểm tra xem có phải là buổi sáng không (6h - 12h)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là buổi sáng, false nếu không
     */
    public static boolean isMorning(LocalDateTime dateTime) {
        int hour = dateTime.getHour();
        return hour >= 6 && hour < 12;
    }
    
    /**
     * Kiểm tra xem có phải là buổi tối không (18h - 22h)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là buổi tối, false nếu không
     */
    public static boolean isEvening(LocalDateTime dateTime) {
        int hour = dateTime.getHour();
        return hour >= 18 && hour < 22;
    }

    public static void main(String[] args) {
        LocalDateTime now = LocalDateTime.now();

        System.out.println("Thời gian hiện tại: " + now);
        System.out.println(getWeekendMessage(now));
        System.out.println(getWorkingHoursMessage(now));
    }
}