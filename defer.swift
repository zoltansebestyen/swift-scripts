// Register ABC,
// Trigger backwards

func DeferAllTheThings()
{
    defer
    {
        print("Defer A")
    }

    defer
    {
        print("Defer B")
    }
    defer
    {
        print("Defer C")
    }
}
//C, B, A
DeferAllTheThings()
