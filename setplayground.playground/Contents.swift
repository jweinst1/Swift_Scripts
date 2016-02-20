//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func readstring() ->String {
    let input = readLine()
    var newstr = ""
    for elem in (input?.characters)! {
        newstr += String(elem)
    }
    return newstr
}

struct setmaker {
    static func makeset(d:String) -> Set<String> {
        let strset:Set = [d]
        return strset
    }
}

print("Say a number", terminator:" ")
var given = "foo"
var newproduct = setmaker.makeset(given)
print(newproduct)