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
    
    /**
     * Kiểm tra xem có phải là đêm khuya không (22h - 6h)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là đêm khuya, false nếu không
     */
    public static boolean isLateNight(LocalDateTime dateTime) {
        int hour = dateTime.getHour();
        return hour >= 22 || hour < 6;
    }
    
    /**
     * Kiểm tra xem có phải là buổi chiều không (12h - 18h)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là buổi chiều, false nếu không
     */
    public static boolean isAfternoon(LocalDateTime dateTime) {
        int hour = dateTime.getHour();
        return hour >= 12 && hour < 18;
    }
    
    /**
     * Kiểm tra xem có phải là giờ cao điểm sáng không (7h - 9h)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là giờ cao điểm sáng, false nếu không
     */
    public static boolean isMorningRush(LocalDateTime dateTime) {
        int hour = dateTime.getHour();
        return hour >= 7 && hour < 9;
    }
    
    /**
     * Kiểm tra xem có phải là giờ cao điểm chiều không (17h - 19h)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là giờ cao điểm chiều, false nếu không
     */
    public static boolean isEveningRush(LocalDateTime dateTime) {
        int hour = dateTime.getHour();
        return hour >= 17 && hour < 19;
    }
    
    /**
     * Lấy thông điệp mô tả chi tiết về thời gian trong ngày
     * @param dateTime thời gian cần kiểm tra
     * @return thông điệp mô tả chi tiết
     */
    public static String getDetailedTimeMessage(LocalDateTime dateTime) {
        if (isLateNight(dateTime)) {
            return "Đây là thời gian đêm khuya 🌙";
        } else if (isMorning(dateTime)) {
            if (isMorningRush(dateTime)) {
                return "Buổi sáng - Giờ cao điểm 🚗";
            } else {
                return "Buổi sáng - Thời gian thoải mái ☀️";
            }
        } else if (isLunchTime(dateTime)) {
            return "Giờ nghỉ trưa - Thời gian ăn trưa 🍽️";
        } else if (isAfternoon(dateTime)) {
            return "Buổi chiều - Thời gian làm việc 💼";
        } else if (isEvening(dateTime)) {
            if (isEveningRush(dateTime)) {
                return "Buổi tối - Giờ cao điểm về nhà 🏠";
            } else {
                return "Buổi tối - Thời gian nghỉ ngơi 🌆";
            }
        } else {
            return "Thời gian khác trong ngày ⏰";
        }
    }
    
    /**
     * Kiểm tra có phải là ngày đặc biệt không (dựa vào ngày trong tháng)
     * @param dateTime thời gian cần kiểm tra
     * @return true nếu là ngày đặc biệt, false nếu không
     */
    public static boolean isSpecialDay(LocalDateTime dateTime) {
        int day = dateTime.getDayOfMonth();
        // Ngày đặc biệt: 1, 15, cuối tháng (28, 29, 30, 31)
        return day == 1 || day == 15 || day >= 28;
    }
    
    /**
     * Tính toán số giờ còn lại đến cuối ngày làm việc
     * @param dateTime thời gian hiện tại
     * @return số giờ còn lại, -1 nếu đã hết giờ làm việc
     */
    public static int getHoursUntilEndOfWork(LocalDateTime dateTime) {
        int currentHour = dateTime.getHour();
        if (currentHour < 8) {
            return 9; // 17 - 8 = 9 giờ làm việc
        } else if (currentHour >= 8 && currentHour < 17) {
            return 17 - currentHour;
        } else {
            return -1; // Đã hết giờ làm việc
        }
    }

    public static void main(String[] args) {
        LocalDateTime now = LocalDateTime.now();

        System.out.println("Thời gian hiện tại: " + now);
        System.out.println(getWeekendMessage(now));
        System.out.println(getWorkingHoursMessage(now));
    }
}
