//: Playground - noun: a place where people can play

import UIKit

import RealmSwift
import Realm

var str = "Hello, playground"

// Get the default Realm
let realm = try! Realm()

class Human: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let dogs = LinkingObjects(fromType: Dog.self, property: "human")
}

// Testing realm objects with custom initializers and implicityly unwrapped properties
class Dog: Object {
    
    @objc dynamic var name: String!
    @objc dynamic var age = 0
    @objc dynamic var human: Human?
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    init(name: String) {
        super.init()
        self.name = name
    }
}


let myDog = Dog(name: "Rex")
myDog.age = 1

// Uncomment: Create dog with a name in the realm
//
//try! realm.write {
//    realm.add(myDog)
//}

let dogs = realm.objects(Dog.self).filter("age < 2")

dogs.count
dogs.forEach { (dog) in
    print(dog.name)
}













