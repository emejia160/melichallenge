//
//  ProductsAdapter.swift
//  MeliChallenge
//
//  Created by Edison Mejia Estrada on 4/06/24.
//

import Foundation
import UIKit

protocol ProductsAdapterDelegate: AnyObject {
    func didTap(_ item: Product)
}

class ProductsAdapter:  NSObject, UITableViewDelegate, UITableViewDataSource {
    let identifier = "ProductCell"
    
    var list: [Product]?
    
    weak var delegate: ProductsAdapterDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ProductCell
        cell.item = list?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = list?[indexPath.row] else { return }
        delegate?.didTap(item)
    }

}
