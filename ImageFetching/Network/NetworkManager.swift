//
//  NetworkManager.swift
//  ImageFetching
//
//  Created by Apple on 3/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class NetworkManager {
    
    func getRequest(from urlString: String, success: @escaping (_ response: [MarvelModel]) -> Void, failure: @escaping (_ error: String) -> Void) {
        
        let config = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: config)
        
        guard let url = URL(string: urlString) else {return}
        let urlRequest = URLRequest(url: url)
        
        let task = urlSession.dataTask(with: urlRequest) { (data, response, error ) in
            
            if let error = error {
                failure(error.localizedDescription)
                return
            }
            
            guard let jsonData = data else {
                failure(NSLocalizedString("No Response From Webservice", comment: "No Response From Webservice"))
                return
            }
            
            let jsonDecoder = JSONDecoder()
            if let jsonResponse = try? jsonDecoder.decode([MarvelModel].self, from: jsonData) {
                print(jsonResponse)
                success(jsonResponse)
            } else {
                failure("Some Parsing error")
            }
        }
        task.resume()
    }
}
