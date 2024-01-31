enum SquareError: Error {
    case outOfBounds, noRoot
}


func squareRoot(of number: Int) throws -> Int {
    if number < 1 || number > 10_000{
        throw SquareError.outOfBounds
    }
    
    for i in 1...100{
        if i * i == number {
            return i
        }
    }
    throw SquareError.noRoot
}

let number = 121

do {
    let result = try squareRoot(of: number)
    print("The square root of \(number) is \(number)")
} catch SquareError.outOfBounds {
    print("Out of bounds")
} catch SquareError.noRoot {
    print("No square root found")
}
