
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
        print("I have \(legs) legs")
    }
}


class Dog: Animal {
    func speak(){
        print("wrrrr I'am dog")
    }
    
    override init(legs: Int) {
        super.init(legs: legs)
        speak()
    }
}


class Corgi: Dog {
    override func speak() {
        print("wrrr I'am Corgi")
    }
    
}


class Poodle: Dog {
    override func speak() {
        print("wrrr I'am Poodle")
    }
    
}




// Cat section
class Cat: Animal {
    var isTame: Bool
    
    init(legs:Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
        print("I'am tame: \(isTame)")
        speak()
    }
    
    func speak(){
        print("miaaaau I'am just a Cat!")
    }
}


class Persian: Cat {
    override func speak() {
        print("miaaau I'am Persian")
    }
}


class Lion: Cat {
    override func speak() {
        print("wraaaaa I'am Lion")
    }
}


let dog = Dog(legs: 4)
let corgi = Corgi(legs: 4)
let poodle = Poodle(legs: 4)

let cat = Cat(legs: 4, isTame: true)
let persian = Persian(legs: 4, isTame: true)
let lion = Lion(legs: 4, isTame: false)

/* output
 I have 4 legs
 wrrrr I'am dog
 
 I have 4 legs
 wrrr I'am Corgi
 
 I have 4 legs
 wrrr I'am Poodle
 
 I have 4 legs
 I'am tame: true
 miaaaau I'am just a Cat!
 
 I have 4 legs
 I'am tame: true
 miaaau I'am Persian
 
 I have 4 legs
 I'am tame: false
 wraaaaa I'am Lion
 
 */
