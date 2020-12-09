//
//  History.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 07.12.2020.
//

import Foundation



class Record {
    var word1: String = ""
    var word2: String = ""
    static let shared = Record()
   // var partOfSpeech: String
  //  var pronounsing: String
    
    
//    init(word1: String, word2: String) {
//        self.word1 = word1
//        self.word2 = word2
//      //  self.partOfSpeech = partOfSpeech
//       // self.pronounsing = pronounsing
//    }
  
   
    func checkingDuplicatInHistory() {}
    
    func sendDataToRecord(word: String, translation: String){
        word1 = word
        word2 = translation
    }
    
}

class History {
   
    var journal: [String] = []
    
    func addRecordInHistory() {
        
    }
    
}
