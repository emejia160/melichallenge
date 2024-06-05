//
//  BaseViewControler.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 5/06/24.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    let spinner = SpinnerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showSimpleToast(message: String, duration: Double = 1) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        self.present(alert, animated: false)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
    }
    
    func showLoading() {
        spinner.add(to: self)
    }
    
    func hideLoading() {
        spinner.remove()
    }
}
