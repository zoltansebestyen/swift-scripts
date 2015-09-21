// TODO how to run it?

enum NumberError:ErrorType {
    case ExceededInt32Max
}

func functionWithCallback(callback:(Int) throws -> Int) rethrows {
    try callback(Int(Int32.max)+1)
}

do {
    try functionWithCallback({v in if v <= Int(Int32.max) { return v }; throw NumberError.ExceededInt32Max})
} catch NumberError.ExceededInt32Max {
    "Error: exceeds Int32 maximum"
} catch {
    //
}
