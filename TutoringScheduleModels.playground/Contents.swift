//: Playground - noun: a place where people can play

import Cocoa

//file to implement Tutor Scheduling

//MM-dd-yyyy HH:mm~MM-dd-yyyy HH:mm
//----> Session Interval in String form

extension String {
    func matchPattern(patStr:String)->Bool {
        var isMatch:Bool = false
        do {
            let regex = try NSRegularExpression(pattern: patStr, options: [.CaseInsensitive])
            let result = regex.firstMatchInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, characters.count))
            
            if (result != nil)
            {
                isMatch = true
            }
        }
        catch {
            isMatch = false
        }
        return isMatch
    }
}


//extension that allows for matches in a string to be extracted
extension String {
    func matchesForRegexInText(regex: String!) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = self as NSString
            let results = regex.matchesInString(self,
                options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substringWithRange($0.range)}
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

class TutorSchedule {
    var sessions:Set<String>?
    var username:String?
    var fullname:String?
    var sessionlist:[String]?
    
    init(username:String, fullname:String, sessionlist:[String]) {
        self.username = username
        self.fullname = fullname
        self.sessionlist = sessionlist
        self.sessions = Set<String>()
        for time in sessionlist {
            sessions?.insert(time)
        }
    }
    //returns the sessions in a sorted order
    func getsessions() -> [String] {
        return self.sessions!.sort();
    }
    
    func scheduleSession(time:String) -> Void {
        if(time.matchPattern("[0-1][0-9]-[0-3][0-9]-[0-2][0-9][0-9][0-9] [0-2][0-9]:[0-5][0-9]~[0-1][0-9]-[0-3][0-9]-[0-2][0-9][0-9][0-9] [0-2][0-9]:[0-5][0-9]")) {
            self.sessions!.insert(time)
        }
    }
    
    func hasTimeatDate(time:String) ->Bool {
        if(!time.matchPattern("[0-1][0-9]-[0-3][0-9]-[0-2][0-9][0-9][0-9] [0-2][0-9]:[0-5][0-9]~[0-1][0-9]-[0-3][0-9]-[0-2][0-9][0-9][0-9] [0-2][0-9]:[0-5][0-9]")) {
            
        }
        return !self.sessions!.contains(time)
    }
    //cancels a time session
    func removeSession(time:String) ->Bool {
        if(self.sessions!.contains(time)) {
            self.sessions!.remove(time)
            return true
        }
        else {
            return false
        }
    }
    
}

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
        return startdifference! <= 0 ? true:false
        
    }
    //checks if the session has passed its length of time
    func hasEnded() -> Bool {
        let currenttime = NSDate()
        let enddifference = self.enddate?.timeIntervalSinceDate(currenttime)
        return enddifference! <= 0 ? true:false
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

class DateBuilder {
    static func convertToAMPM(datestr:String) ->String {
        let datesplit = datestr.componentsSeparatedByString(" ")
        let hourstr = datesplit[1].componentsSeparatedByString(":")[0]
        var newhour = ""
        var daysegment = "AM"
        switch(hourstr) {
        case "00":
            newhour = "00"
            daysegment = "AM"
        case "01":
            newhour = "01"
            daysegment = "AM"
        case "02":
            newhour = "02"
            daysegment = "AM"
        case "03":
            newhour = "03"
            daysegment = "AM"
        case "04":
            newhour = "04"
            daysegment = "AM"
        case "05":
            newhour = "05"
            daysegment = "AM"
        case "06":
            newhour = "06"
            daysegment = "AM"
        case "07":
            newhour = "07"
            daysegment = "AM"
        case "08":
            newhour = "08"
            daysegment = "AM"
        case "09":
            newhour = "09"
            daysegment = "AM"
        case "10":
            newhour = "10"
            daysegment = "AM"
        case "11":
            newhour = "11"
            daysegment = "AM"
        case "12":
            newhour = "12"
            daysegment = "PM"
        case "13":
            newhour = "01"
            daysegment = "PM"
        case "14":
            newhour = "02"
            daysegment = "PM"
        case "15":
            newhour = "03"
            daysegment = "PM"
        case "16":
            newhour = "04"
            daysegment = "PM"
        case "17":
            newhour = "05"
            daysegment = "PM"
        case "18":
            newhour = "06"
            daysegment = "PM"
        case "19":
            newhour = "07"
            daysegment = "PM"
        case "20":
            newhour = "08"
            daysegment = "PM"
        case "21":
            newhour = "09"
            daysegment = "PM"
        case "22":
            newhour = "10"
            daysegment = "PM"
        case "23":
            newhour = "11"
            daysegment = "PM"
        default:
            return datestr
        }
        return "\(datesplit[0]) \(newhour):\(datesplit[1].componentsSeparatedByString(":")[1]) \(daysegment)"
    }
    //splits dates into start and end dates, to be parsed into the date set
    static func splitdate(date:String) ->[String] {
        return date.componentsSeparatedByString("~")
    }
    
    static func FuseDates(startdate:String, enddate:String) ->String {
        return startdate + "~" + enddate
    }
    
    static func AMPMtoDate(date:String) ->String {
        let datesplit = date.componentsSeparatedByString(" ")
        var hourstr = datesplit[1].componentsSeparatedByString(":")[0]
        let minutestr = datesplit[1].componentsSeparatedByString(":")[1]
        let daysegment = datesplit[2]
        if daysegment == "AM" {
            return "\(datesplit[0]) \(hourstr):\(minutestr)"
        }
        else {
            switch(hourstr) {
            case "12":
                hourstr = "12"
            case "01":
                hourstr = "13"
            case "02":
                hourstr = "14"
            case "03":
                hourstr = "15"
            case "04":
                hourstr = "16"
            case "05":
                hourstr = "17"
            case "06":
                hourstr = "18"
            case "07":
                hourstr = "19"
            case "08":
                hourstr = "20"
            case "09":
                hourstr = "21"
            case "10":
                hourstr = "22"
            case "11":
                hourstr = "23"
            default:
                hourstr += ""
            }
            return "\(datesplit[0]) \(hourstr):\(minutestr)"
        }
    }
}

//var testdate = "02-14-1994 15:44"
//let ampm = DateBuilder.convertToAMPM(testdate)
//let backtodate = DateBuilder.AMPMtoDate(ampm)
//"02-14-1994 15:44"


//var f = TutorSchedule(username: "David Jon Lim", fullname: "DJL", sessionlist: [String]())
//f.scheduleSession("02-14-1994 15:44~02-14-1994 15:54");
//f.hasTimeatDate("02-14-1994 15:44~02-14-1994 15:54")
//false





