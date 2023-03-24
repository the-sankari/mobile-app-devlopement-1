import UIKit

// Returns true if year is a leap year, false if not
func isLeapYear(year: Int) -> Bool {
    return (year % 4 == 0 && !(year % 100 == 0)) || (year % 400 == 0)
}

// Returns the number of days in a given month of a given year
func daysInMonth(year: Int, month: Int) -> Int {
    guard (1...12).contains(month) else {
        print("Month must be 1...12!")
        return 0
    }
    
    var result = 0
    
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        result = 31
    case 4, 6, 9, 11:
        result = 30
    case 2:
        result = 28
        if isLeapYear(year: year) {
            result += 1
        }
    default:
        break
    }
    
    return result
}

func dayOfYear(year: Int, month: Int, day: Int) -> Int {
    var result = 0
    
    var m = 1
    while m < month {
        result += daysInMonth(year: year, month: m)
        m += 1
    }
    
    result += day
    
    return result
}

// Hard-code the current date:
let todayYear = 2023
let todayMonth = 3
let todayDay = 23
print("Today is \(todayYear)-\(todayMonth)-\(todayDay)")

// And the birth date:
let birthYear = 1997
let birthMonth = 8
let birthDay = 16
print("You were born \(birthYear)-\(birthMonth)-\(birthDay)")

var totalDays = 0

// Find out how many days there are left in the month of birth
var daysToAdd = daysInMonth(year: birthYear, month: birthMonth) - birthDay
print("\(birthYear)-\(birthMonth) = +\(daysToAdd)")
totalDays += daysToAdd

// Find out how many days there are left in the rest of the birth year.
// Start from the month following the birth month. In case of December,
// the while loop will never be executed, because the condition will be
// false right away.

for month in (birthMonth+1)...12{
    daysToAdd = daysInMonth(year: birthYear, month: month)
    print("\(birthYear) -\(month) = +\(daysToAdd)")
    totalDays += daysToAdd
}

// Add the days of all the complete years from the one following the birth
// year to the one before the current year. For normal years, add 365;
// for leap years, add 366.
for year in (birthYear+1)..<todayYear{
    daysToAdd = 365
    if isLeapYear(year: year){
        daysToAdd += 1
    }
    print("\(year) = +\(daysToAdd)")
    totalDays += daysToAdd
}


// Add the days that have passed in the current year, starting from January.
// First add only the complete months, so go from 1 to one less than the
// current month.
for month in 1..<todayMonth{
    daysToAdd = daysInMonth(year: todayYear, month: month)
    print("\(todayYear)-\(month) = \(daysToAdd)")
    totalDays += daysToAdd
}

// Finally, add the days of the current month up until yesterday.


print("Your age in days is \(totalDays)")

//Exercise 7

// Remaining days of the user's birth year
func daysRaminingInYearOfBirth(year: Int, month: Int, day: Int) -> Int{
    let dayOfYear = dayOfYear(year: year, month: month, day: day)
    let daysInYear = isLeapYear(year: year) ? 366 : 365
    let daysRemaining = daysInYear - dayOfYear
    return daysRemaining}

let daysRemaining = daysRaminingInYearOfBirth(year: birthYear, month: birthMonth, day: birthDay)

print("There are \(daysRemaining) days remaining in the birth year")



//Exercise 8

func ageInDays(birthYear: Int, birthMonth: Int, birthDay: Int, todayYear: Int, todayMonth: Int, todayDay: Int) -> Int{
    var age = 0
    var year = birthYear
    var month = birthMonth
    var day = birthDay

    while year < todayYear || (year == todayYear && month < todayMonth || year == todayYear && month == todayMonth && day <= todayDay){
        let dasInCurrentMonth = daysInMonth(year: year, month: month)
        age += dasInCurrentMonth - (day - 1)
        day = 1
        month += 1
        if month > 12{
            month = 1
            year += 1
        }
    }
    return age
}

let ageInDay = ageInDays(birthYear: birthYear, birthMonth: birthMonth, birthDay: birthDay, todayYear: todayYear, todayMonth: todayMonth, todayDay: todayDay)

print("Your age in days is \(ageInDay) days")

