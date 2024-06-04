//
//  Product.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import Foundation

struct Product: Codable {
    let id, title, condition: String?
    let catalogProductID: String?
    let buyingMode: String?
    let thumbnail: String?
    let currencyID: String?
    let orderBackend, price: Int?
    let originalPrice, salePrice: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case condition
        case catalogProductID
        case buyingMode
        case thumbnail
        case currencyID
        case orderBackend
        case price
        case originalPrice
        case salePrice
    }
    
    
}
