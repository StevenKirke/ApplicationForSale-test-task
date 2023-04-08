//
//  RequestData.swift
//  TEST
//
//  Created by Steven Kirke on 20.03.2023.
//

import Foundation


class RequestData {
    
    var responseData: ResponseData = ResponseData()

        
    func getData<T: Decodable>(url: String, model: T, returnData: @escaping (T?, String?) -> Void) {
        guard let url = URL(string: url) else {
            print("Error convert URL")
            return
        }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Error answer request: ", error)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                print("Error answer response")
                return
            }
            if response.statusCode == 200 {
                guard let data = data else {
                    return
                }
                guard let self = self else {
                    return
                }
                self.responseData.convertData(data: data, models: model) {(data, error)  in
                    guard error != nil else {
                        print("Error response DATA - \(String(describing: error))")
                        return
                    }
                    guard let data  = data else {
                        return
                    }
                    return returnData(data, "")
                }
            } else {
                print("Error code \(response.statusCode)")
            }
        }
        dataTask.resume()
    }
}

