let animals = ["fish", "cat", "chicken", "dog"]
let sortedAnimals = animals.sort { (one: String, two: String) -> Bool in
  return one < two
}

dump(sortedAnimals)
