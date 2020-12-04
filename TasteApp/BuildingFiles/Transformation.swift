//
//  Transformation.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 30.11.2020.
//

import Foundation

class Transformation {
    
    let networkManager = GoogleTranslateAPIManager()

    func transformTranslToLanguage(text: String, completionHandler: @escaping (String) -> Void? )  {
        self.networkManager.translate(text: text) { t in
            var result = String()
            switch t?.first {
            case .unionArrayArray(let array):
                switch array[0][0] {
                case .string(let s):
                    print("\(type(of: s)) type of s")
                    print("s \(s)")
                    result = s
                case .stringArrayArrayArray(let s):
                    print("\(type(of: s)) type of s string array array")
                default:
                    print("Nothing")
                }
                print("desired translation \(array[0][0])")
                print(type(of: array[0][0]))
                break
            default:
                print("can't find a translation")
                break
            }
            
            if let translation = Language(russian: result).russian as? String {
                DispatchQueue.main.async {
                    completionHandler(translation)
                }
            }
        }
    }
}
