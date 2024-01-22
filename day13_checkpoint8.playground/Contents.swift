
protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var sellerName: String { get set }
    
    func summary()
}

extension Building {
    func summary() {
        print("This building has \(rooms) rooms, costs $\(cost) and seller's name is \(sellerName)")
    }
}

struct House: Building {
    let rooms: Int
    let cost: Int
    var sellerName: String
}

struct Office: Building {
    let rooms: Int
    let cost: Int
    var sellerName: String
}


let house = House(rooms: 5, cost: 30000, sellerName: "Roman")
house.summary()

let office = Office(rooms: 10, cost: 100000, sellerName: "John")
office.summary()


/*
 output
 This building has 5 rooms, costs $30000 and seller's name is Roman
 This building has 10 rooms, costs $100000 and seller's name is John
 */
