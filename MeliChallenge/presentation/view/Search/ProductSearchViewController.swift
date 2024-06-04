//
//  ProductSearchViewController.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import Foundation
import UIKit


class ProductSearchViewController: UIViewController {
    
    @IBOutlet weak var searchText: UITextField!
    @IBAction func searchTapped(_ sender: Any) {
        
        let vc = ProductsViewController()
        vc.textToSearch = searchText.text ?? ""
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
