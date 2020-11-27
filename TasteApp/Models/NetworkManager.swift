//
//  NetworkManager.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//

import Foundation



struct NetworkManager {
    
    var headers = Constants().headers
    
    func translate(text: String, completionHandler: @escaping (ModelForData?) -> Void ) {
        guard let url = URL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2") else { return }
        
        var result : String?
        let postData = NSMutableData(data: "q=\(text)".data(using: String.Encoding.utf8)!)
        postData.append("&source=en".data(using: String.Encoding.utf8)!)
        postData.append("&target=ru".data(using: String.Encoding.utf8)!)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                print(error)
            } else {
                guard let data = data else { return }
                
                if let translation = self.parseJSON(with: data) {
                    print("translation!.russian \(translation.russian), \(NSDate.now)")
                    completionHandler(translation)
                }
            }
        }
        
        print("task resume, \(NSDate.now)")
        task.resume()
        
    }
    
    private func parseJSON(with data: Data) -> ModelForData? {
        let decoder = JSONDecoder()
        do {
            let currentData = try decoder.decode(Translation.self, from: data)
            guard let currentLanguages = ModelForData(translation: currentData) else { return nil }
            
            return currentLanguages
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    
}

