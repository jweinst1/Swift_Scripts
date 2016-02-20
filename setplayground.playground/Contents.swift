//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


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