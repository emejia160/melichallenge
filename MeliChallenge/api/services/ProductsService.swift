//
//  ProductsService.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import Foundation
import SwiftyJSON

let API_BASE_URL = "https://api.mercadolibre.com/sites/MCO/search?q=%@"

class ProductsService {
    
    public func getProducts(search: String, onFinish: @escaping ([Product]) -> Void, onError: @escaping (String) -> Void) {
        
        let url = String(format: API_BASE_URL, search)
                
        APICallManager.instance.createRequest(
            url, method: .get, headers: nil, parameters: nil,
            onSuccess: {(responseObject: JSON) -> Void in
                if let responseDict = responseObject["results"].arrayObject {
                    let productDict = responseDict as! [[String:AnyObject]]
                    let swiftyJson = JSON(productDict).rawString()
                    let data = Data(swiftyJson!.utf8)
                    
                    let product = try? JSONDecoder().decode([Product].self, from: data)
                    onFinish(product!)
                } else {
                    onError("Ha ocurrido un error consultando el contenido")
                }
            },
            onFailure: {(errorMessage: String) -> Void in
                onError(errorMessage)
            }
        )
    }
}
