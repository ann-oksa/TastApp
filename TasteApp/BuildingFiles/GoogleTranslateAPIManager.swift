//
//  NetworkManager.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//

import Foundation

struct GoogleTranslateAPIManager {
    
    var createdUrl = CreatingURLManager()
    
    func translate(text: String, targetLang: TargetLanguages, sourceLang: TargetLanguages, completionHandler: @escaping (Translation?) -> Void ) {
        
        guard let url = createdUrl.createURLComponents(text: text, targetLang: targetLang, sourseLang: sourceLang) else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completionHandler(nil)
                return
            }
            
            do {
                let responseModel = try JSONDecoder().decode(Translation.self, from: data)
                completionHandler(responseModel)
                
            } catch {
                print("can't find a translation, error: \(error)")
            }
        }
        task.resume()
    }
}
