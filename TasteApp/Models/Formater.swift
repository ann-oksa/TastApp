//
//  Formater.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 16.12.2020.
//

import Foundation

class Formater {
    
    let dateFormater = DateFormatter()
    var currentDate = History().date
    
    func convertCurrentDateToString() {
        dateFormater.dateStyle = .short
        print(dateFormater.string(from: currentDate))
    }
    
}
