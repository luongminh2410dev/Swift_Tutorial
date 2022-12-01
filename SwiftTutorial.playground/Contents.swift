import UIKit
import Foundation

let number:Int = 10
var a = 1, b = 2 , c = 3

let cardNumber:Int = 1234_1231_5645

// ham if else
let hasCar = true
if hasCar == false {
    print("I have not any  car")
} else {
    print("Yes I have car")
}

let (x, y) = (2, 4)
print("x = \(x), y = \(y)")

// 1 doan van
let comment = """
    Good, I like it \u{2665},
    Ok, let me check
    Please do it yourself
"""


// ARRAY
// khai bao mang
// NOTE: ham khai bao bang "var" moi co the thay doi gia tri
var names:[String] = ["John", "Jack", "Cris Tensen"]
// khai bao mang unique
var fruits:Set<String> = ["Orange", "Lemon", "Apple"]

// duyet mang
for i in 0..<names.count {
    print("\(i) = \(names[i])")
}

for (index, item) in names.enumerated(){
    print(index, item)
}

for fruit in fruits {
    print(fruit)
}

let mapFruits = fruits.map { fruit in
    return "\(fruit)2"
}

let reversedNames = names.sorted{ s1, s2 in
    return s2.count < s1.count;
}

// noi 2 mang, insert phan tu vao mang
let otherNames = ["David", "Varane"]
names += otherNames
names.insert("Luis", at: names.count)

// tuong tac giua 2 mang
let setA:Set<Int> = [1,2,3,4,5,6]
let setB:Set<Int> = [5,6,7,8,9]
print(setA.intersection(setB))
print(setA.symmetricDifference(setB))
print(setA.union(setB))

// tim kiem trong mang
let filterName1 = names.filter{name in
    return name.lowercased() == "luis".lowercased()
}
let filterName2 = names.filter{name in
    return name.count > 5
}

// OBJECT
var user:[String: Any] = [
    "name": "Hoang",
    "age": 18,
    "email": "hoangnn@gmail.com",
    "address": "3 Cau Giay, Ha Noi"
]

if !user.isEmpty {
    print("User is not empty")
}

user["email"] = nil // remove a key
// update key value
if let oldAge = user.updateValue(20, forKey: "age"){
    print("The old value of age is: \(oldAge)")
}
// duyet object
for (key, value) in user {
    print(key, value)
}

// SWITCH CASE
let marks:Float = 6.5
switch marks {
    case 0:
        print("Very bad, you do nothing")
    case 0..<4:
        print("Quite bad")
    case 4..<7:
        print("Not bad")
    case 7..<10:
        print("Very good")
    default:
        print("Invalid mark")
}

let point = (-1, -2)
switch point {
    case let (x, y) where x < 0 && y < 0:
        print("x < 0 and y < 0")
    default:
        print("UNKNOW")
}

// FUNCTION
func printSomthing (content: String){
    print("print: \(content)")
}
//printSomthing(content: "Swift tutorial")

func getFullName (firstName: String, lastName: String) -> String{
    return "\(firstName) \(lastName)"
}
//print(getFullName(firstName: "Luong", lastName: "Minh"))

// function return an enumeration
enum MarkLevel {
    case unknow, bad, normal, good, veryGood
}
func getMarkLevel(mark: Float) -> MarkLevel{
    switch mark {
        case 0..<5:
            return MarkLevel.bad
        case 5..<7:
            return MarkLevel.normal
        case 7..<9:
            return MarkLevel.good
        case 9...10:
            return MarkLevel.veryGood
        default:
            return MarkLevel.unknow
    }
}
//print(getMarkLevel(mark: 6.3))
//print(getMarkLevel(6.3)) // no label parameter

// function return a tuple
func startEnd(numbers: [Int]) -> (start:Int, end:Int){
    var start:Int = 0
    var end:Int = 0
    if numbers.count == 1 {
        start = numbers[0]
        end = numbers[0]
    } else {
        start = numbers[0]
        end = numbers[numbers.count - 1]
    }
    return (start, end)
}

// closure as a parameter
func doSomeBigTasks(input x:Int, completion: (String) -> Void, onFailure: (String) -> Void){
    print("Do some tasks")
    if(x == 10){
        completion("This is result")
    } else {
        onFailure("Input invalid")
    }
}
//doSomeBigTasks(input: 12) {stringResult in
//    print("Task finished, result =",stringResult)
//} onFailure: { stringResult in
//    print("Have a trouble: ",stringResult)
//}

//  STRUCTURE
// structure are value type
struct Rectangle:Equatable {
    var width: Double
    var height: Double
    var _color: String = ""
    // caculated property
    var area: Double {
        get {
            return width * height
        }
    }
    static func == (rectA: Rectangle, rectB: Rectangle) -> Bool {
        return rectA.width == rectB.width && rectA.height == rectB.height
    }
    // setter
    var color: String {
        get{
            return _color
        }
        set(value){
            _color = value
        }
    }
}

var rect1 = Rectangle(width: 100, height: 100)
var rect2 = Rectangle(width: 150, height: 200)
var rect3 = rect1
var rect4 = Rectangle(width: 123, height: 100)

rect3.width = 300
// so sanh 2 object
if rect4 == rect1 {
    print("rect1 and rect4 has same content")
}
//print(rect4.area)
rect4.color = "red"
//print(rect4)

struct Direction {
    static let north = "north"
    static let east = "east"
    static let west = "west"
    static let south = "south"
}

struct Point {
    var x = 0.0, y = 0.0
    func toString () -> String {
        return "x = \(x), y = \(y)"
    }
    func distanceTo(point: Point) -> Double {
        return sqrt(pow(x - point.x, 2) + pow(y - point.y, 2));
    }
    // matating method -> phuong thuc thay doi chinh no
    mutating func moveTo(x: Double, y: Double){
        self.x = x
        self.y = y
    }
}

var point1 = Point(x: 10, y: 20)
var point2 = Point(x: 5, y: 5)
//print(point1.distanceTo(point: point2))
point2.moveTo(x: 100, y: 200)
//print(point2.toString())

//  CLASS
class Vehicle {
    var speed: Double?
    var color: String?
    // default contructor
    init() {
        speed = 0.0
        color = "white"
    }
    // calculated property
    var description: String {
        "Speed = \(speed ?? 0.0), color = \(color ?? "white")"
    }
    init(speed: Double, color: String){
        self.speed = speed
        self.color = color
    }
}

//let vehicle1 = Vehicle(speed: 120, color: "red")
//print(vehicle1.description)

class Bicycle : Vehicle {
    var hasBaskit: Bool = true
    // _ cho phep cac tham so truyen vao truc tiep nhu dong 281
    convenience init(_ speed: Double,_ color: String,_ hasBaskit: Bool) {
        self.init(speed: speed, color: color)
        self.hasBaskit = hasBaskit
    }
}

//let bicyle1 = Bicycle(speed: 12, color: "red", hasBaskit: false)
let bicyle2 = Bicycle(12, "bedd", true)
//dump(bicyle2)

// optional chaining
class Department {
    var id: Int
    var name: String
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

class Employee {
    var id: Int
    var name: String
    var department: Department? // Nhan vien co the thuoc phong ban hoac khong
    
    init(id: Int, name: String, department: Department?) {
        self.id = id
        self.name = name
        self.department = department
    }
}

let saleDepartment: Department = Department(id: 1, name: "Sales and Marketing")
let mrJohn: Employee = Employee(id: 30, name: "John Thunderstone", department: saleDepartment)
//print("\(mrJohn.department?.name ?? "No department")")

// Add more methods to an existing class
import SwiftUI
let color1 = Color(red: 1, green: 0, blue: 0)
//print(color1)
extension Color {
    init(_ red: Double, _ green: Double, _ blue: Double) {
        self.init(red: red, green: green, blue: blue)
    }
}
let color2 = Color(1, 0, 2.2)
//print(color2)

// error handling
enum CalculatorError: Error {
    case divideByZero(message: String)
    case valueTooBig(message: String)
    // ...other case
}

func devide2Number (number1: Double, number2: Double) throws -> Double {
    if number2 == 0 {
        throw CalculatorError.divideByZero(message: "Cant divide by zero")
    }
        
    if number1 > 100 || number2 > 100 {
        throw CalculatorError.valueTooBig(message: "Result too big")
    }
        
    return number1 / number2
}
do {
    try print(devide2Number(number1: 90, number2: 12))
} catch {
    print("Error: ", error)
}

// ASYNCHRONOUS FUNCTIONS
// request API
// https://randomuser.me/api/
// https://api.zippopotam.us/us/33162

let urlGetRandomUser = URL(string: "https://randomuser.me/api/")
let urlGetDetailCountry = URL(string: "https://api.zippopotam.us/us/33162")

// call api binh thuong
//URLSession.shared.dataTask(with: urlGetRandomUser!) {(data, response, error) in
//    print("finish call api1")
//}.resume()
//
//URLSession.shared.dataTask(with: urlGetDetailCountry!) {(data, response, error) in
//    print("finish call api2")
//}.resume()

// async
func do2Task() async throws {
    do {
        print("begin task 1")
        let (data1, response1) = try await URLSession.shared.data(from: urlGetRandomUser!)
        print("task 1 finished and begin task 2")
        let (data2, response2) = try await URLSession.shared.data(from: urlGetDetailCountry!)
        print("task 2 finished")
    } catch  {
        
    }
}

Task.init{
    do {
       //try await do2Task()
    } catch {
        
    }
}

