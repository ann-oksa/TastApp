//
//  Singletone.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 09.12.2020.
//

import Foundation

class Information {
  
   static let shared = Information()
    var word = ""
    var translation = ""
    private init() {}
}
