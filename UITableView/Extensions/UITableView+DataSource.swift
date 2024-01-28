//
//  UITableView+DataSource.swift
//  UITableView
//
//  Created by Arthur Sh on 28.01.2024.
//

import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listNames[indexPath.row]
        cell.imageView?.image = UIImage(systemName: listImages[indexPath.row])
        
        return cell
    }
}
