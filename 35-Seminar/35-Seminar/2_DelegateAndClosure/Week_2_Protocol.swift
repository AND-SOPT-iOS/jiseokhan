//
//  Week_2_Protocol.swift
//  35-Seminar
//
//  Created by 한지석 on 8/12/24.
//

import Foundation

protocol 아요술자리컨벤션 {
  func 이름(name: String)
  func MBTI(mbti: String)
  func 주량(bottle: Int)
  func 이상형(describe: String)
}

protocol 솝트컨벤션 {
  func 파트(name: String)
  func 신입여부(isNewbie: Bool)
}

class 한지석: 아요술자리컨벤션, 솝트컨벤션 {
  func 파트(name: String) {
    print("제 파트는 \(name) 입니다.")
  }

  func 신입여부(isNewbie: Bool) {
    let description = isNewbie ? "YB" : "OB"
    print("저는 \(description) 입니다.")
  }

  func 이름(name: String) {
    print("제 이름은 \(name) 입니다.")
  }
  
  func MBTI(mbti: String) {
    print("제 mbti는 \(mbti) 입니다.")
  }
  
  func 주량(bottle: Int) {
    print("제 주량은 \(bottle) 입니다.")
  }

  func 이상형(describe: String) {
    print("제 주량은 \(describe) 입니다.")
  }
}
