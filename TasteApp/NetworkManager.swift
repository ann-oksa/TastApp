//
//  NetworkManager.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//

import Foundation

struct NetworkManager {
    func fetchData() {
        let urlString = "https://google-translate1.p.rapidapi.com/language/translate/v2/languages"
        guard let url = URL(string: urlString)  else { return }
        
        let headers = ["accept-encoding": "application/gzip",
                       "x-rapidapi-key": "80c6a3649fmsh42f78d3c4f87910p180259jsn2bf5b117d8a6",
                       "x-rapidapi-host": "google-translate1.p.rapidapi.com"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error)
            }
            guard let data = data else { return }
            let dataString = String(data: data, encoding: .utf8)
           let currentLanguages = self.parseJSON(with: data)
            print(currentLanguages)
        }
        task.resume()

    }
    
    func parseJSON(with data: Data) -> ModelForData? {
        let decoder = JSONDecoder()
        do {
          let currentData = try decoder.decode(LanguagesData.self, from: data)
            guard let currentLanguages = ModelForData(languagesData: currentData) else { return nil }

            return currentLanguages
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
