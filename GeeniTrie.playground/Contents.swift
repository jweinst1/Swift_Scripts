//: Playground - noun: a place where people can play

import Cocoa

//Sets must be used to check for inclusion

/*
Statement List

How do you become a tutor? -> Question
How does one become a tutor? -> Question
I need a tutoring session in **ARG** -> request
Do you tutor in **ARG** -> request
Tutoring for **ARG** -> request
Find tutors -> command


*/

let url = NSURL(string: "http://jweinst1.github.io/Rooster/geeni.json")!
let jsonData = NSData(contentsOfURL: url)!
let GEENITREE = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: [])




func ParseSentence(statement:String) -> [String] {
    var datadict = [String]()
    var arguments = [String]()
    let words = statement.componentsSeparatedByString(" ")
    var current = GEENITREE
    for word in words {
        if let template = current.valueForKey(word) {
            current = template as! NSObject
        }
        else if let template = current.valueForKey("**ARG**") {
            arguments.append(word)
            current = template as! NSObject
        }
        else {
            datadict.append("Statement Not Recognized")
            return datadict
        }
    }
    datadict.append(current as! String)
    for elem in arguments {
        datadict.append(elem)
    }
    return datadict
}




