//: Playground - noun: a place where people can play

import Cocoa

let swiftTeam = 13
let iOSTeam = 54
let otherTeams = 48
let totalTeam = swiftTeam + iOSTeam + otherTeams

// Explicit vs. Inferred Typing

let priceInferred = 19.99
let priceExplicit: Double = 19.99

//Bools
let onSaleInferred = true
let onSaleExplicit: Bool = false

//Strings
let nameInferred = "Whoopie Cushion"
let nameExplicit: String = "Whoopie Cushion"

if onSaleInferred {
    print("\(nameInferred) on sale for \(priceInferred)!")
} else {
    print("\(nameInferred) at regular price: \(priceInferred)!")
}

// 1
class TipCalculator {
    let total: Double
    let taxPct: Double
    let subtotal: Double
    // 3
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    // 4
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }

    // 5
    func printPossibleTips() {
//        print("15%: \(calcTipWithTipPct(0.15))")
//        print("18%: \(calcTipWithTipPct(0.18))")
//        print("20%: \(calcTipWithTipPct(0.20))")
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
//        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]

//        for possibleTip in possibleTipsInferred {
//            print("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
//        }
        
        // The ..< operator is a non-inclusive range operator, while ... operator is inclusive.
        for i in 0..<possibleTipsInferred.count {
            let possibleTip = possibleTipsInferred[i]
            print("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
        }
    }

    // printPossibleTips eq.
    // 1
    func returnPossibleTips() -> [Int: Double] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        // 2
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            // 3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
}

// 6
let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
//tipCalc.printPossibleTips()
tipCalc.returnPossibleTips()

//Arrays and For Loops


