//
//  Environment.swift
//  35-Seminar
//
//  Created by 한지석 on 10/29/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
