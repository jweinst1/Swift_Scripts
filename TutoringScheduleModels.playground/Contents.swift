//: Playground - noun: a place where people can play

import Cocoa

//file to implement Tutor Scheduling

let currentDate = NSDate()
var dateAsString = "12-24-2015 23:59"
let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
var newdate = dateFormatter.dateFromString(dateAsString)
currentDate.timeIntervalSinceDate(newdate!)



let calendar = NSCalendar.currentCalendar()

let dateComponents = calendar.components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: newdate!)

print("day = \(dateComponents.day)", "month = \(dateComponents.month)", "year = \(dateComponents.year)", "week of year = \(dateComponents.weekOfYear)", "hour = \(dateComponents.hour)", "minute = \(dateComponents.minute)", "second = \(dateComponents.second)", "nanosecond = \(dateComponents.nanosecond)" , separator: ", ", terminator: "")

//"day = 24, month = 12, year = 2015, week of year = 52, hour = 23, minute = 59, second = 0, nanosecond = 0"


struct SessionBlock {
    //two constructors, one for a date and string starting points
    var startstring:String?
    var endstring:String?
    var format:NSDateFormatter
    let calendar:NSCalendar
    var startdate:NSDate?
    var enddate:NSDate?
    let startcomponents:NSDateComponents
    let endcomponents:NSDateComponents
    let diffcomponents:NSDateComponents
    
    //initalizer from strings, will be used when pulling date strings out of DB
    init(start:String, end:String) {
        self.format = NSDateFormatter()
        self.format.dateFormat = "MM-dd-yyyy HH:mm"
        self.calendar = NSCalendar.currentCalendar()
        self.startstring = start
        self.endstring = end
        
        self.startdate = self.format.dateFromString(start)!
        self.enddate = self.format.dateFromString(end)!
        //gives individual numbers of the date
        self.startcomponents = self.calendar.components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: self.startdate!)
        
        self.endcomponents = self.calendar.components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: self.enddate!)
        
        
        self.diffcomponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: self.startdate!, toDate: self.enddate!, options: NSCalendarOptions.init(rawValue: 0))
    }
    //initalizer from dates, will be used when an app user schedules
    init(start:NSDate, end:NSDate) {
        self.format = NSDateFormatter()
        self.format.dateFormat = "MM-dd-yyyy HH:mm"
        self.calendar = NSCalendar.currentCalendar()
        self.startdate = start
        self.enddate = end
        
        self.startstring = self.format.stringFromDate(start)
        self.endstring = self.format.stringFromDate(end)
        
        self.startcomponents = self.calendar.components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: self.startdate!)
        
        self.endcomponents = self.calendar.components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: self.enddate!)
        
        self.diffcomponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: self.startdate!, toDate: self.enddate!, options: NSCalendarOptions.init(rawValue: 0))
    }
    //checks if the session has started
    func hasStarted() ->Bool {
        let currenttime = NSDate()
        let startdifference = self.startdate?.timeIntervalSinceDate(currenttime)
        return startdifference! >= 0 ? true:false
        
    }
    //checks if the session has passed its length of time
    func hasEnded() -> Bool {
        let currenttime = NSDate()
        let enddifference = self.enddate?.timeIntervalSinceDate(currenttime)
        return enddifference! >= 0 ? true:false
    }
    //checks if the session is happening now.
    func isHappening() -> Bool {
        return self.hasStarted() && !(self.hasEnded())
    }
    
    func sessionLengthMinutes() -> Int {
        return self.diffcomponents.minute
    }
    
    func sessionLengthHours() -> Int {
        return self.diffcomponents.hour
    }
}

