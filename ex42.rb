## Animal is-a object look at the extra credit
class Animal
end

## Dog is-a object
class Dog < Animal

  def initialize(name)
    ## Dog has-a name of some kind
    @name = name
  end

end

## Cat is-a object
class Cat < Animal

  def initialize(name)
    ## Cat has-a name of some kind
    @name = name
  end

end

## Person is-a object
class Person

  def initialize(name)
    ##  Person has-a name of some kind
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet

end

## Employee is-a object
class Employee < Person

  def initialize(name, salary)
    ## ?? hmm what is this strange magic?
    # Use the name property from class Person
    super(name)

    ## Employee has-a salary property
    @salary = salary
  end

end

## Fish is-a object
class Fish
end

## Salmon is-a Fish
class Salmon < Fish
end

## Halibut is-a Fish
class Halibut < Fish
end

## rover is-a Dog
rover = Dog.new("Rover")

## satan is-a Cat
satan = Cat.new("Satan")

## Mary is-a Person
mary = Person.new("Mary")

## Mary has-a satan pet
mary.pet = satan

## Frank is-a kind of Employee
frank = Employee.new("Frank", 120000)

## Frank has-a rover pet
frank.pet = rover

## Flipper is-a instance of Fish object
flipper = Fish.new()

## Crouse is-a instance of Salmon object
crouse = Salmon.new()

## Harry is-a instance of Halibut object
harry = Halibut.new()
