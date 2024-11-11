+++
title = 'Temp'
date = 2024-11-11T15:23:41-05:00
+++

```java
import de.jollyday.HolidayCalendar;
import de.jollyday.HolidayManager;
import de.jollyday.Holiday;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Set;
import java.util.stream.Collectors;

public class BusinessDayCalculator {

    public static void main(String[] args) {
        LocalDate firstBusinessDay = getFirstBusinessDayOfNextMonth("US");
        System.out.println("First business day of the next month: " + firstBusinessDay);
    }

    public static LocalDate getFirstBusinessDayOfNextMonth(String countryCode) {
        // Get the current date
        LocalDate today = LocalDate.now();
        
        // Get the first day of the next month
        LocalDate firstDayOfNextMonth = YearMonth.from(today).plusMonths(1).atDay(1);

        // Get the holidays for the next month
        Set<LocalDate> holidays = getHolidaysForMonth(firstDayOfNextMonth.getYear(), firstDayOfNextMonth.getMonthValue(), countryCode);

        // Check if the first day is a business day
        while (isHolidayOrWeekend(firstDayOfNextMonth, holidays)) {
            // Move to the next day if it's a holiday or weekend
            firstDayOfNextMonth = firstDayOfNextMonth.plusDays(1);
        }

        return firstDayOfNextMonth;
    }

    private static boolean isHolidayOrWeekend(LocalDate date, Set<LocalDate> holidays) {
        // Check if the date is a weekend
        if (date.getDayOfWeek() == DayOfWeek.SATURDAY || date.getDayOfWeek() == DayOfWeek.SUNDAY) {
            return true;
        }
        
        // Check if the date is a holiday
        return holidays.contains(date);
    }

    private static Set<LocalDate> getHolidaysForMonth(int year, int month, String countryCode) {
        // Initialize the HolidayManager with the specified country
        HolidayManager holidayManager = HolidayManager.getInstance(HolidayCalendar.valueOf(countryCode));
        
        // Get all holidays for the given year
        Set<Holiday> allHolidays = holidayManager.getHolidays(year);
        
        // Filter holidays to only include those in the specified month and return as LocalDate set
        return allHolidays.stream()
                .map(Holiday::getDate)
                .filter(date -> date.getMonthValue() == month)
                .collect(Collectors.toSet());
    }
}
```