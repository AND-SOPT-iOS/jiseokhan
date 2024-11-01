import UIKit

protocol Translater {
  func hello()
}

class Korean: Translater {
  func hello() {
    print("안녕하세요!")
  }
}

class Japanese: Translater {
  func hello() {
    print("やあ!")
  }
}

class English: Translater {
  func hello() {
    print("hello!")
  }
}

let korean = Korean()
let japanese = Japanese()
let english = English()

class Person {
  var delegate: Translater?
  func greeting() {
    delegate?.hello()
  }
}

let jiseok = Person()
jiseok.delegate = korean
jiseok.greeting()

