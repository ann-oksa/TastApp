//
//  History.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 07.12.2020.
//

import Foundation



class Record {
    var word1: TranslationOfWord
    var word2: TranslationOfWord
   // var partOfSpeech: String
  //  var pronounsing: String
    
    
    init(word1: TranslationOfWord, word2: TranslationOfWord) {
        self.word1 = word1
        self.word2 = word2
      //  self.partOfSpeech = partOfSpeech
       // self.pronounsing = pronounsing
    }
    func checkingDuplicatInHistory() {}
    
    
}

class History {
   
    var journal: [String] = []
    
    func addRecordInHistory() {
        
    }
    
}
