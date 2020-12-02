//
//  NetworkManager.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//

import Foundation

struct GoogleTranslateAPIManager {
    
    
    var createdUrl = CreatingURLManager()
    
    func translate(text: String, completionHandler: @escaping (Translation?) -> Void ) {
        
        guard let url = createdUrl.createURLComponents(text: text, targetLang: .english, sourseLang: .russian) else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completionHandler(nil)
                return
            }
            do {
                let responseModel = try JSONDecoder().decode(Translation.self, from: data)
                switch responseModel.first {
                case .unionArrayArray(let array):
                    print("desired translation \(array[0][0])")
                    break
                default:
                    print("can't find a translation")
                    break
                }
            } catch {
                print("can't find a translation, error: \(error)")
            }
            
        }
        task.resume()
    }
}
//    func parse(data: Data) {
//
//    }
//
//    private func parseJSON(with data: Data) -> TranslationOfLanguage? {
//        let decoder = JSONDecoder()
//        do {
//            let translation = try decoder.decode(TranslationOfLanguage.self, from: data)
//            return translation
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//        return nil
//    }
//}


//    let task = session.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    print(error)
//                } else {
//                    guard let data = data else { return }
//                    if let translation = self.parseJSON(with: data) {
//                        completionHandler(translation)
//                    }
//                }
//            }
//            task.resume()
//        }
//
