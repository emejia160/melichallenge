//
//  ProductsPresenter.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import UIKit

protocol ProductView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func showError(error: String)
    func setProducts(products: [Product])
    func setEmptyProducts()
}

class ProductsPresenter {
    
    private let productService:  ProductsService
    weak private var productsView: ProductView?
    
    init(productService: ProductsService) {
        self.productService = productService
    }
    
    func attachView(view: ProductView) {
        productsView = view
    }
    
    func detachView() {
        productsView = nil
    }
    
    func getProducts(textToSearch: String) {
        
    
        productsView?.startLoading()
       
        productService.getProducts(search: textToSearch) { response in
            if (response.count > 0) {
                self.productsView?.setProducts(products: response)
            } else {
                self.productsView?.setEmptyProducts()
            }
           
        } onError: { error in
            self.productsView?.showError(error: error)
        }


    }
}
