//
//  Sets.swift
//  Swift_Scripts
//
//  Created by Joshua Weinstein on 2/20/16.
//
//

import Foundation

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
        var strset:Set = [d]
        return strset
    }
}

print("Say a number", terminator:" ")
var given = readstring()
var newproduct = setmaker.makeset(given)
print(newproduct)




