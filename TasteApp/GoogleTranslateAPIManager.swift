//
//  NetworkManager.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//

import Foundation

struct GoogleTranslateAPIManager {
    
    var constants = Constants()
    
    func translate(text: String, completionHandler: @escaping (TranslationOfLanguage?) -> Void ) {
        
        guard let url = constants.currentURL else { return }
        let postData = constants.postData(text: text)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = constants.headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error)
            } else {
                guard let data = data else { return }
                if let translation = self.parseJSON(with: data) {
                    completionHandler(translation)
                }
            }
        }
        task.resume()
    }
    
    private func parseJSON(with data: Data) -> TranslationOfLanguage? {
        let decoder = JSONDecoder()
        do {
            let translation = try decoder.decode(TranslationOfLanguage.self, from: data)
            return translation
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}


