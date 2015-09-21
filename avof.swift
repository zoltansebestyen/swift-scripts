#!/usr/bin/env swift
func square(a:Float) -> Float {
    return a * a

}

func cube(a:Float) -> Float {
    return a * a * a

}

func averageSumOfSquares(a:Float,b:Float) -> Float {
    return (square(a) + square(b)) / 2.0

}

func averageSumOfCubes(a:Float,b:Float) -> Float {
    return (cube(a) + cube(b)) / 2.0

}

func averageOfFunction(a:Float,b:Float,f:(Float -> Float)) -> Float {
    return (f(a) + f(b)) / 2

}

// naiv impl.
print (averageOfFunction(3, b:4, f:square))

// with closure
print(averageOfFunction(3, b:4, f:{(x: Float) -> Float in return x * x}))

// compact closure
print(averageOfFunction(3, b:4, f:{$0 * $0}))
/* print averageOfFunction(3, 4, cube); */



