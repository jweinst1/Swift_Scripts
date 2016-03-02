//: Playground - noun: a place where people can play

import Cocoa

var teststring = "[1 2 3]"

let commands = teststring.componentsSeparatedByString(" ")

func islistend(input:String) ->Bool {
    return input.characters.last == "]"
}

islistend(commands.last!)


