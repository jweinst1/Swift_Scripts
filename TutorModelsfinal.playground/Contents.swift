//: Playground - noun: a place where people can play

import Cocoa
//basic tutor class models for max.

class Tutor {
    
    let fullname:String?
    let username:String?
    var classes:[String]?
    var sessions:[String]?
    var sessionset:Set<String>
    var price:Double?
    
    init(fullname:String, username:String, classes:[String], sessions:[String], price:Double) {
        self.fullname = fullname;
        self.username = username;
        self.classes = classes;
        self.sessions = sessions;
        self.price = price;
        self.sessionset = Set<String>()
        //loads the session times from the array into the set for O(1) checking
        for elem in self.sessions! {
            self.sessionset.insert(elem)
        }
    }
    //returns array of session strings
    func getSessionArray() ->[String] {
        return self.sessionset.sort()
    }
}

class Student {
    
    let fullname:String?
    let username:String?
    var sessions:[String]?
    var sessionset:Set<String>
    
    init(fullname:String, username:String, classes:[String], sessions:[String]) {
        self.fullname = fullname;
        self.username = username;
        self.sessions = sessions;
        self.sessionset = Set<String>()
        for elem in self.sessions! {
            self.sessionset.insert(elem)
        }
    }
    //returns array of session strings
    func getSessionArray() ->[String] {
        return self.sessionset.sort()
    }
}

class TutoringSession {
    
    let starttime:String?
    let totaldate:String?
    let endtime:String?
    let tutorusername:String?
    let studentusername:String?
    
    init(totaldate:String, tutorusername:String, studentusername:String) {
        self.totaldate = totaldate
        self.tutorusername = tutorusername
        self.studentusername = studentusername;
        
    }
}

class Subject {
    
    let name:String?
    var TutorsTeachingThis:[String]?
    var tutorsessions:[String]?
    
    init(name:String, TutorsTeachingThis:[String], tutorsessions:[String]) {
        self.name = name
        self.TutorsTeachingThis = TutorsTeachingThis
        self.tutorsessions = tutorsessions
    }
}
