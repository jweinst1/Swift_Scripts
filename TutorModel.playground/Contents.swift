//: Playground - noun: a place where people can play

import Cocoa

//Tutor Model for Globears

//This is a cookie cutter template for a Tutor in the app
struct Tutor {
    //var is a variable, a stored value. This is the tutor's name
    var name:String
    //This is a list of strings that represent the subjects they teach
    var subjects:[String]
    
    //true or false indicator of whether a tutor is online now and available.
    var isworking:Bool
    
    //a list of decimal numbers between 0.0 and 5.0 that represent the reviews or rating of the tutor.
    //we need to decide if we want written reviews or just starred reviews
    var reviews:[Double]
    
    //initializes the tutor to be visible in the app
    init(name:String, subjects:[String], isworking:Bool, reviews:[Double]) {
        self.name = name
        self.subjects = subjects
        self.isworking = isworking
        self.reviews = reviews
    }
    
    //allows a tutee to request a session with a tutor, only works if tutor has desired subject in their
    //subjects, and isworking is true
    func RequestSession(subject:String) -> Void {
        
    }
    
    //writes a review for the tutor, given the entire session has been completed, and gives a rating.
    mutating func WriteReview(rating:Double) {
        //coding function that adds a new rating to the current list of ratings.
        self.reviews.append(rating)
    }
}
