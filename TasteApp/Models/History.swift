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
    let date: Date
    
    init(word1: String, word2: String) {
        self.word1 = word1
        self.word2 = word2
        self.date = Date()
    }
}


class History : Codable {
    
    var journal: [Record] = []
    var targ : Language = .english
    var sour : Language = .russian
    
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
        }
        catch {
            print("some error \(error.localizedDescription)")
        }
    }

    private func readRecordsFromDisk() {
        if let data = UserDefaults.standard.data(forKey: "journal") {
            let decoder = JSONDecoder()
            do {
                let records = try decoder.decode([Record].self, from: data)
                journal = records
            }
            catch {
                print("error \(error.localizedDescription)")
            }
        }
    }
    
    
    
    //
        
    //    func saveRecordsToDisk() {
    //        let encoder = JSONEncoder()
    //        for record in journal {
    //            do {
    //                let data = try encoder.encode(record)
    //                UserDefaults.standard.setValue(data, forKey: "word1")
    //            }
    //            catch {
    //                print("some error \(error.localizedDescription)")
    //            }
    //        }
    //
    //    }
    //
    //    private func readRecordsFromDisk() {
    //        if let data = UserDefaults.standard.data(forKey: "word1") {
    //            let decoder = JSONDecoder()
    //            for record in journal {
    //                do {
    //                    let records = try decoder.decode(Record.self, from: data)
    //
    //                    journal.append(records)
    //                }
    //                catch {
    //                    print("error \(error.localizedDescription)")
    //                }
    //            }
    //
    //        }
    //    }
    //
        
    
    
}


