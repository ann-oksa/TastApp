//
//  History.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 07.12.2020.
//

import Foundation



class Record: Codable {
    var word1: String
    var word2: String
   
    let date = Date()
    
    init(word1: String, word2: String) {
        self.word1 = word1
        self.word2 = word2
    }
    
    
    
}

class Formater: Codable {

    let form: DateFormatter

    init(form: DateFormatter) {
        self.form = form
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
       
        form = DateFormatter()
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Formater.self, forKey: .name) // Might want to make sure that the name is not nil here
    }

    enum CodingKeys: String, CodingKey {
        case name
       
    }

}

// EXAMPLE:


do {
    let data = try JSONEncoder().encode(AnchorContainer(anchor: anchor))
    let anchorDecode = try JSONDecoder().decode(AnchorContainer.self, from: data)
    print(anchorDecode.anchor) // Print the value after decoding to make sure that the result is the same
} catch {
    print(error.localizedDescription)
}


class History : Codable {
   
    
    var journal: [Record] = []
    
   // let formatter1 = Formater()
    
    init() {
      self.readRecordsFromDisk()
    }
    
    func createRecordInHistory(w1: String, w2: String) {
        var r = Record(word1: w1, word2: w2)
        addRecordToHistory(rec: r)
        saveRecordsToDisk()
        print(r.date)
        
        
    }
   
    func addRecordToHistory(rec: Record) {
        journal.append(rec)

    }
    
    func saveRecordsToDisk() {
        let encoder = JSONEncoder()
        do {
        let data = try encoder.encode(journal)
            UserDefaults.standard.setValue(data, forKey: "journal")
            print("save record data \(data)")
        }
        catch {
            print("some error \(error)")
        }
    }
   
   private func readRecordsFromDisk() {
        if let data = UserDefaults.standard.data(forKey: "journal") {
            let decoder = JSONDecoder()
            do {
                let records = try decoder.decode([Record].self, from: data)
                print("read record r \(records.count)")
                journal = records
            }
            catch {
                print("error \(error.localizedDescription)")
            }
        }
       
    }
    
}


