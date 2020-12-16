//
//  Filters.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 16.12.2020.
//

import Foundation

public enum KindOfSorting: String, CaseIterable {
    case AZ = "A - Z"
    case ZA = "Z - A"
    case latest = "Latest"
    case earliest = "Earliest"
}

class Sorting {
  
   
    var arrayOfSorting : [KindOfSorting] = KindOfSorting.allCases

    
}
