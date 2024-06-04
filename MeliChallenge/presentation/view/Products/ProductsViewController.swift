//
//  ProductsViewControllere.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import UIKit

class ProductsViewController: UIViewController {
    let adapter = ProductsAdapter()
    var safeArea: UILayoutGuide!
    var textToSearch: String = ""
    
    let presenter = ProductsPresenter(productService: ProductsService())
    
    lazy var productsListView: UITableView = {
        let view = UITableView()
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = adapter.self
        view.dataSource = adapter
        view.separatorStyle = .singleLine
        view.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        view.rowHeight = UITableView.automaticDimension
        view.estimatedRowHeight = 100
        view.backgroundColor = .white
        view.register(ProductCell.self, forCellReuseIdentifier: adapter.identifier)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(view: self)
        adapter.delegate = self
        
        view.backgroundColor = .clear
        safeArea = view.layoutMarginsGuide
        
        view.addSubview(productsListView)
        
        NSLayoutConstraint.activate([
            productsListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productsListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productsListView.leftAnchor.constraint(equalTo: view.leftAnchor),
            productsListView.rightAnchor.constraint(equalTo: view.rightAnchor),
            productsListView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            productsListView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
        // load data
        presenter.getProducts(textToSearch: self.textToSearch)
    }
}

extension ProductsViewController: ProductsAdapterDelegate {
    func didTap(_ item: Product) {
        guard let name = item.title else { return }
        let vc = ProductDetailViewController()
        vc.product = item
        self.present(vc, animated: true, completion: nil)
    }
}

extension ProductsViewController: ProductView {
    func setProducts(products: [Product]) {
        adapter.list = products
        productsListView.isHidden = false
        productsListView.reloadData()
    }
    
    func setEmptyProducts() {
        productsListView.isHidden = true
    }
    
    func startLoading() {
        productsListView.isHidden = true
    }
    
    func finishLoading() {
        productsListView.isHidden = false
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: nil, message: error, preferredStyle: .alert)
        alert.view.backgroundColor = .black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        self.present(alert, animated: false)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            alert.dismiss(animated: true)
        }
    }
    
    
}
