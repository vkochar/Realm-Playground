//: Playground - noun: a place where people can play

import UIKit

import RealmSwift

var str = "Hello, playground"

// Get the default Realm
let realm = try! Realm()

//Testing realm objects with inverse relationships

class Dog: Object {
    
    @objc dynamic var name: String!
    @objc dynamic var age = 0
    @objc dynamic var human: Human?
}

class Human: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let dogs = LinkingObjects(fromType: Dog.self, property: "human")
}


// 1. Uncomment: Create a human and then comment again.
//let person = Human()
//person.name = "Human name"
//
//try! realm.write {
//    realm.add(person)
//}

let humans = realm.objects(Human.self)

// 2. Uncomment: Give that human many dogs, change dog names!
//let myDog = Dog()
//myDog.name = "Rex"
//myDog.age = 4
//myDog.human = humans.first
//
//try! realm.write {
//    realm.add(myDog)
//}

let dogs = realm.objects(Dog.self).filter("age < 2")

dogs.count
dogs.forEach { (dog) in
    print(dog.human)
}

humans.count
humans.first?.dogs.forEach({ (dog) in
    print(dog)
})














