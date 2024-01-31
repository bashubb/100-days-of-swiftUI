
func randomInt(in exampleArray: [Int]?) -> Int {
    exampleArray?.randomElement() ?? Int.random(in: 1...100)
}
