import nextflow.io.ValueObject

@ValueObject
class Dog {
    String name
    Boolean isHungry = true

    // Dog plus(Food food) {
    //     return new Dog(name: name, isHungry: false)
    // }

    // String toString() {
    //     return "Dog(name: ${name}, isHungry: ${this.isHungry})"
    // }
}
