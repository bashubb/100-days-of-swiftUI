
struct Car {
    let model: String
    let numberOfSeats: Int
    
    private(set) var currentGear = 1 {
        didSet {
            print("You've changed gear from \(oldValue) to \(currentGear)")
        }
    }
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
    
    mutating func changeGear(_ command: String) {
        if command.lowercased() == "up" && currentGear < 10 {
            currentGear += 1
        } else if command.lowercased() == "down" && currentGear > 1 {
            currentGear -= 1
        } else {
            print("You're bad driver")
        }
    }
}

var newCar = Car(model: "Honda", numberOfSeats: 5)
newCar.changeGear("up")         // prints  You've changed gear from 1 to 2
newCar.changeGear("down")       // prints  You've changed gear from 2 to 1
newCar.changeGear("down")       // prints  You're bad driver
newCar
