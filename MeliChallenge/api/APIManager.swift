//
//  APIManager.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import Alamofire
import SwiftyJSON
import Foundation

class APICallManager {
    static let instance = APICallManager()
    
    enum RequestMethod {
        case get
        case post
    }
    
    func createRequest(
        _ url: String,
        method: HTTPMethod,
        headers: [String: String]?,
        parameters: AnyObject?,
        onSuccess successCallback: ((JSON) -> Void)?,
        onFailure failureCallback: ((String) -> Void)?
    ) {
        
        AF.request(url, method: method).response { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value as Any)
                successCallback?(json)
            case .failure(let error):
                if let callback = failureCallback {
                    callback(error.localizedDescription)
                }
            }
        }
    }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                let image = UIImage(data: data)
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
}

