func performComputation(x: Int, y: Int) -> Int {
	let xIsSmaller = x < y

	if xIsSmaller {
		return 2 * x + y
	} else {
		return x * y * 3
	}
}

func printResult(message: String, result: Int) {
	print("\(message): \(result)")
}

let first = performComputation(3, y:5)
let second = performComputation(5, y:3)
printResult("first ", result: first)
printResult("second ", result: second)
