//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// ------------------------------------------------

var meal: Double? = Double(10.25)

var tip: Double? = Double(17)
var tax: Double? = Double(5)

guard let mealUnwrapped = meal, let tipUnwrapped = tip , let taxUnwrapped = tax else { fatalError() }

func calculateValue(paramValue: Double, mealValue: Double) -> Double {
    return mealValue * (paramValue / 100)
}

var calculatedTip = calculateValue(paramValue: tipUnwrapped, mealValue: mealUnwrapped)
var calculatedTax = calculateValue(paramValue: taxUnwrapped, mealValue: mealUnwrapped)
var calculatedMeal = round(mealUnwrapped + calculatedTip + calculatedTax)


// ------------------------------------------------


class Person {
    var age: Int = 0
    init (initialAge: Int) {
        self.age = initialAge
        if age < 0 {
            print("Age is not valid, setting age to 0.")
            self.age = 0
        } else {
            self.age = initialAge
        }
    }
    
    func amIOld () {
        if self.age < 13 {
            print("You are young.")
        } else if (age >=  13) && (age <= 17) {
            print("You are a teenager")
        } else if age > 17 {
            print("You are old.")
        }
    }
    
    func yearPasses() {
        self.age += 1
    }
}



func Time(time: Int, age: Int) {
    let t = Int(time)
    let age = Int(age)
    let p = Person(initialAge: age)
    for _ in 0...t {
        p.amIOld()
        p.yearPasses()
        print(p.age)
    }
}

var time = Time(time: 10, age: 12)

// ------------------------------------------------

func isPrime(number:Int) -> Bool {
    guard number > 2 else { return false }
    
    let max = Int(ceil(sqrt(Double(number))))
    
    for i in 2 ... max {
        if number % i == 0 {
            return false
        }
    }
    return true
}

isPrime(number: 11)


// ------------------------------------------------


func removeDuplicates(string:String) -> String {
    var checked = [Character: Bool]()
    let result = string.characters.filter { checked.updateValue(true, forKey: $0) == nil }
    return String(result)
}

removeDuplicates(string:"NOOOO")


// ------------------------------------------------

func condenseSpace(string:String) -> String {
    return string.replacingOccurrences(of: " ", with: "")
}
condenseSpace(string: "A BC")


// ------------------------------------------------


func test(length: Int, array:[Int]) {
    
    var positives = 0
    var negatives = 0
    var zeroes = 0
    
    for i in 0..<length {
        let num = array[i]
        if num > 0 {
            positives += 1
        } else if num == 0 {
            zeroes += 1
        } else if num < 0 {
            negatives += 1
        }
    }
    let numberOfInstances = [Double(positives), Double(zeroes), Double(negatives)]
    numberOfInstances.map { Double(100 * $0) / Double(100) / Double(length) }.map { print(String(format:"%.6f", $0)) }
}



test(length: 6, array: [1,0,3,-4,-5,6])