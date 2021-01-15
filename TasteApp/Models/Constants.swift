//
//  Constants.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 15.01.2021.
//

import Foundation

//protocol ReusableConstants {
//    static var MyidentifierToHistory: String { get }
//   // static var identifierToGame: String { get }
//
//}
//
//extension ReusableConstants {
//
//    static var MyidentifierToHistory: String {
//        return String(describing: self)
//    }
//}
//extension ViewController: ReusableConstants {}

class Constants {
    let identifierToHistory = "toHistoryVC"
    let identifierToGame = "toGameVC"
    let cellInHistory = "cellInHistoryWithWordAndTranslation"
    let identifierToDetails = "toDetailsVC"
    let identifierForPopover = "PopoverViewController"
    
    let unwindSegueFromGameToTranslation = "backToTranslationVC"
    let unwindSegueFromDetailsToHistory = "backToHistoryVC"
    
}
