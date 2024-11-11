+++
title = 'Temp'
date = 2024-11-11T15:23:41-05:00
+++

```java
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.Month;
import java.time.YearMonth;
import java.util.HashSet;
import java.util.Set;

public class BusinessDayCalculator {

    public static void main(String[] args) {
        Set<LocalDate> holidays = new HashSet<>();
        holidays.add(LocalDate.of(2024, Month.JANUARY, 1)); // New Year's Day
        holidays.add(LocalDate.of(2024, Month.JULY, 4));    // Independence Day
        holidays.add(LocalDate.of(2024, Month.DECEMBER, 25)); // Christmas Day
        // Add other holidays as needed

        LocalDate firstBusinessDay = getFirstBusinessDayOfNextMonth(holidays);
        System.out.println("First business day of the next month: " + firstBusinessDay);
    }

    public static LocalDate getFirstBusinessDayOfNextMonth(Set<LocalDate> holidays) {
        // Get the current date
        LocalDate today = LocalDate.now();
        
        // Get the first day of the next month
        LocalDate firstDayOfNextMonth = YearMonth.from(today).plusMonths(1).atDay(1);

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
}
```