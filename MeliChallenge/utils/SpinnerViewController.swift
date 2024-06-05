//
//  SpinnerViewController.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 5/06/24.
//

import UIKit

class SpinnerViewController: UIViewController {

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)

        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .white
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    public func add(to parent: UIViewController) {        
        parent.addChild(self)
        self.view.frame = parent.view.frame
        parent.view.addSubview(self.view)
        self.didMove(toParent: parent)
    }

    public func remove()
    {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
