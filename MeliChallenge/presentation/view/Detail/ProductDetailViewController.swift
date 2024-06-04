//
//  ProductDetailViewController.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    // MARK: - Properties
    var product: Product?
    
    // MARK: - UI Elements
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        updateUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.addSubview(nameLabel)
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        
        // Set up constraints (you can adjust these as needed)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    // MARK: - Update UI
    private func updateUI() {
        if let imageUrl = URL(string: (product?.thumbnail)!) {
            APICallManager.instance.downloadImage(from: imageUrl) { image in
                DispatchQueue.main.async { [self] in
                    imageView.image = image
                }
            }
        }
        
        nameLabel.text = product?.title
        descriptionLabel.text = product?.title
    }
}
