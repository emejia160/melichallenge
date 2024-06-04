//
//  ApiResponse.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

struct ProductsApiResponse: Codable {
    let paging: Paging
    let results: [Product]
    
    private enum CodingKeys: String, CodingKey {
        case paging
        case results
    }
}

struct Paging: Codable {
    let total, primaryResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case total
        case primaryResults
    }
}


