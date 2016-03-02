//: Playground - noun: a place where people can play

import Cocoa

//implements token array processing of multiple types

struct IntToken {
    var value:Int
    
    init(val:Int) {
        self.value = val
    }
    
    mutating func add(val:IntToken) {
        self.value += val.value
    }
}

var table = [Any]()
table.append(IntToken(val:3))
table.append(IntToken(val:4))
var it = table[0] as! IntToken // take it out with cast and var ref
it.add(table[1] as! IntToken) // add with cast; `it` is now IntToken(val:7)
table[0] = it // put it back in (if you want to)
print(table)

//performs casting and adding of tokens
func addright(var stack:[Any], first:Int, second:Int) -> [Any] {
    var hold = stack[second] as! IntToken
    hold.add(stack[first] as! IntToken)
    stack[second] = hold
    return stack
}
print(addright(table, first:0, second:1))
//[IntToken(value: 7), IntToken(value: 11)]


