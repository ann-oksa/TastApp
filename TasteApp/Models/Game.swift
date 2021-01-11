//
//  Game.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 23.12.2020.
//

import UIKit


class Game {
    
    var records : [Record] = []
    var isOpen : Bool = false
    var someCardTitle: String = ""
    var currentIndex : Int = 0
    
    func setCardTitle(rec: [Record]) -> String {
        someCardTitle = rec[currentIndex].word1
        return someCardTitle
    }
    
    
}
