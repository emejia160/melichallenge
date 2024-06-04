//
//  APIManager.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import Alamofire
import SwiftyJSON
import Foundation

let API_BASE_URL = "https://api.mercadolibre.com/sites/MCO/search?q=%@"

class APICallManager {
    static let instance = APICallManager()
    
    enum RequestMethod {
        case get
        case post
    }
    
    func callAPIGetPeople(search: String, onSuccess successCallback: ((_ response: [Product]) -> Void)?,
                          onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        let url = String(format: API_BASE_URL, search)
        
        self.createRequest(
            url, method: .get, headers: nil, parameters: nil,
            onSuccess: {(responseObject: JSON) -> Void in
                if let responseDict = responseObject["results"].arrayObject {
                    let productDict = responseDict as! [[String:AnyObject]]
                    let swiftyJson = JSON(productDict).rawString()
                    let data = Data(swiftyJson!.utf8) 
                    
                    let suggestion = try? JSONDecoder().decode([Product].self, from: data)
                    successCallback?(suggestion!)
                } else {
                    failureCallback?("Ha ocurrido un error consultando")
                }
            },
            onFailure: {(errorMessage: String) -> Void in
                failureCallback?(errorMessage)
            }
        )
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

