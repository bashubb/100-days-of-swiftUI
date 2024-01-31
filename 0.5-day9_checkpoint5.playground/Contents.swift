
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let result = luckyNumbers.filter { $0.isMultiple(of: 2) == false}.sorted().map { "\($0) is the lucky number" }

print (result)

