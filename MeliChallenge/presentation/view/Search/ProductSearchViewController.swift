//
//  ProductSearchViewController.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import Foundation
import UIKit


class ProductSearchViewController: BaseViewController {
    
    @IBOutlet weak var searchText: UITextField!
    @IBAction func searchTapped(_ sender: Any) {
        
        if (searchText.text!.isEmpty) {
            showSimpleToast(message: "Ingrese un producto a buscar.")
            return
        } else {
            irABusquedaDeProductos()
        }
        
    }
    
    private func irABusquedaDeProductos() {
        let productsViewController = ProductsViewController()
        
        productsViewController.title = "Resultados de la búsqueda"
        let navController = self.navigationController
        productsViewController.textToSearch = searchText.text ?? ""
        navigationController?.pushViewController(productsViewController, animated: true)
    }
    
}
