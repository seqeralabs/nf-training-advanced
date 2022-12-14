
class Dog {
    String name
    Integer age

    String sayHi() {
        "Hi there, from $name"
    }

    Dog(String name) {
        this.name = name
    }
}