// TODO
// http://goshdarnclosuresyntax.com

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// reverse without closures
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
print(names.sort(backwards))

// same with closures
print(names.sort({ ( s1: String, s2: String ) -> Bool in return s1 > s2 }))

// infer from context
print(names.sort({ s1, s2 in return s1 > s2 }))

// implicit return
print(names.sort({ s1, s2 in s1 > s2 }))

// shorthand argument names
print(names.sort({ $0 > $1 }))

// operator functions
print(names.sort(>))

// trailing closures
print(names.sort(){ $0 > $1 })
