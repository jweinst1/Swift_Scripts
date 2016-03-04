//: Playground - noun: a place where people can play

import Cocoa

//playground to implement custom operators

func + (c1:Character, c2:Character) -> String {
    return String(c1) + String(c2)
}

"3" + "4"

infix operator <+> {}

func <+> (m:Int, n:Int) -> Int {
    return Int(String(m) + String(n))!
}

5 <+> 6
//56

66 <+> 88
//6688
