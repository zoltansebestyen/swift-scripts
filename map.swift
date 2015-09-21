var moneyArray = [10,20,45,32]

// with closure
print(moneyArray.map({money in "\(money)€"}))

// same with shorthands
print(moneyArray.map({"\($0)€"}))


// Filter

var filteredArray : [Int] = [] 

for money in moneyArray {
    if (money > 30) {
      filteredArray += [money]
    }
}

print(filteredArray)

// shorthands closures
print(moneyArray.filter({$0 > 30}))


// Reduce
