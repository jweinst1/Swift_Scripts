//: Playground - noun: a place where people can play

import Cocoa
/*
  Playground that simulates the argument trie
*/

let GeeniTrie:NSObject = [
    "i":[
        "need":[
            "a":[
                "**ARG**":"[request]"]]]]



func ParseSentence(statement:String) -> [String: String] {
    var datadict = [String:String]()
    var arguments = [String]()
    let words = statement.componentsSeparatedByString(" ")
    var current = GeeniTrie
    for word in words {
        if let template = current.valueForKey(word) {
            current = template as! NSObject
        }
        else if let template = current.valueForKey("**ARG**") {
            arguments.append(word)
            current = template as! NSObject
        }
        else {
            datadict["Error"] = "Statement Not Recognized"
        }
    }
    datadict[current as! String] = arguments[0]
    return datadict
}
let start = NSDate()
ParseSentence("i need a tutor")
//["[request]": "tutor"]
NSDate().timeIntervalSinceDate(start)
//0.01180499792098999

let start2 = NSDate()
let question = "Get me a tutoring session for cs61a"
let options: NSLinguisticTaggerOptions = [.OmitWhitespace, .OmitPunctuation, .JoinNames]
let schemes = NSLinguisticTagger.availableTagSchemesForLanguage("en")
let tagger = NSLinguisticTagger(tagSchemes: schemes, options: Int(options.rawValue))
tagger.string = question
tagger.enumerateTagsInRange(NSMakeRange(0, (question as NSString).length), scheme: NSLinguisticTagSchemeNameTypeOrLexicalClass, options: options) { (tag, tokenRange, _, _) in
    let token = (question as NSString).substringWithRange(tokenRange)
    print("\(token): \(tag)")
}
NSDate().timeIntervalSinceDate(start2)
//0.02545298099517822



