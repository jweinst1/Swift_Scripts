//: Playground - noun: a place where people can play

import Cocoa

//playground for parsing oper tokens
//example: +3 means + 3


struct oper {
    var applicate:Int
    var mode:Character
    
    init(val:Int, mode:Character) {
        self.applicate = val
        self.mode = mode
    }
    
    func process(operand:Int) -> Int {
        switch(self.mode) {
        case "+":
            return operand + self.applicate
        case "-":
            return operand - self.applicate
        case "*":
            return operand * self.applicate
        case "_":
            if operand > self.applicate {
                return self.applicate
            }
            else {
                return operand
            }
        default:
            return 0
        }
    }
}

func parseoper(expr:String) -> Int {
    let tokens = expr.componentsSeparatedByString(" ")
    assert(tokens.count == 3)
    let mach = oper(val:Int(tokens[2])!, mode:Character(tokens[1]))
    return mach.process(Int(tokens[0])!)
}

parseoper("3 + 5")
//8
