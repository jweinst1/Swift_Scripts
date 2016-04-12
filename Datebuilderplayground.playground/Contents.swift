//: Playground - noun: a place where people can play

import Cocoa


//MM-dd-yyyy HH:mm~MM-dd-yyyy HH:mm
//----> Session Interval in String form

//Class that holds immutable pieces of date strings

class DateStringConstructor {
    static let hours = "00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23".componentsSeparatedByString(" ")
    static let minutes = "00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59".componentsSeparatedByString(" ")
    static let days = "00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 22 23 24 25 26 27 28 29 30 31".componentsSeparatedByString(" ")
    static let months = "00 01 02 03 04 05 06 07 08 09 10 11 12".componentsSeparatedByString(" ")
    static let years = "2016 2017 2018 2019".componentsSeparatedByString(" ")
    
}

//sectioned struct for easier string manipulation of session and date strings
struct SessionIntervalString {

    var startyear:String
    var startmonth:String
    var startday:String
    var starthour:String
    var startminute:String
    
    var endyear:String
    var endmonth:String
    var endday:String
    var endhour:String
    var endminute:String
    
    init(session:String) {
        let startend = session.componentsSeparatedByString("~")
        let startdates = startend[0].componentsSeparatedByString(" ")
        let startmdy = startdates[0].componentsSeparatedByString("-")
        let starthourminute = startdates[1].componentsSeparatedByString(":")
        
        self.startmonth = startmdy[0]
        self.startday = startmdy[1]
        self.startyear = startmdy[2]
        self.starthour = starthourminute[0]
        self.startminute = starthourminute[1]
        
        let enddates = startend[1].componentsSeparatedByString(" ")
        let endmdy = enddates[0].componentsSeparatedByString("-")
        let endhourminute = enddates[1].componentsSeparatedByString(":")
        
        self.endmonth = endmdy[0]
        self.endday = endmdy[1]
        self.endyear = endmdy[2]
        self.endhour = endhourminute[0]
        self.endminute = endhourminute[1]
    }
    //retrieves the session interval string via interpolation
    func getsessionString() -> String {
        return "\(self.startmonth)-\(self.startday)-\(self.startyear) \(self.starthour):\(self.startminute)~\(self.endmonth)-\(self.endday)-\(self.endyear) \(self.endhour):\(self.endminute)"
    }
    
    mutating func IncrementMinutes(amount:Int, mode:String) -> Void {
        if mode == "start" {
            var place = Int(DateStringConstructor.minutes.indexOf(self.startminute)!)
            place += (amount % 60)
            self.startminute = DateStringConstructor.minutes[place]
        }
        else if mode == "end" {
            var place = Int(DateStringConstructor.minutes.indexOf(self.endminute)!)
            place += (amount % 60)
            self.endminute = DateStringConstructor.minutes[place]
        }
    }
    
    mutating func IncrementHours(amount:Int, mode:String) -> Void {
        if mode == "start" {
            var place = Int(DateStringConstructor.hours.indexOf(self.starthour)!)
            place += (amount % 24)
            self.startminute = DateStringConstructor.hours[place]
        }
        else if mode == "end" {
            var place = Int(DateStringConstructor.hours.indexOf(self.endhour)!)
            place += (amount % 24)
            self.endminute = DateStringConstructor.hours[place]
        }
    }
}

//var f = SessionIntervalString(session: "01-07-1994 03:44~02-05-1995 15:44")
//f.IncrementMinutes(10, mode: "start")
//54








