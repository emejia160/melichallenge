//
//  ProductsService.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import Foundation

class ProductsService {
    
    public func getProducts(search: String, onFinish: @escaping ([Product]) -> Void, onError: @escaping (String) -> Void) {
        
        APICallManager.instance.callAPIGetPeople(search: search) { product in
            onFinish(product)
        } onFailure: { errorMessage in
            onError(errorMessage)
        }

    }
}
