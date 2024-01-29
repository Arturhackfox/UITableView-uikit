//
//  RootViewController.swift
//  UITableView
//
//  Created by Arthur Sh on 28.01.2024.
//

import UIKit

class RootViewController: UIViewController {
    
    private var persons: [[Person]]?
    
    // MARK: - Ui
    
    private lazy var uiTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
//        table.rowHeight = 80
        
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        persons = Person.persons
        view.backgroundColor = .systemBackground
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(uiTable)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            uiTable.topAnchor.constraint(equalTo: view.topAnchor),
            uiTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            uiTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension RootViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Setting custom section count
    
    func numberOfSections(in tableView: UITableView) -> Int {
        persons?.count ?? 0
    }
    
    // MARK: - Setting custom row count in each section
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons?[section].count ?? 0
    }
    
    // MARK: - Setting custom cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        cell?.person = persons?[indexPath.section][indexPath.row]
        cell?.accessoryType = .detailDisclosureButton
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Height of each row
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    // MARK: - Navigation to detail view
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        tableView.deselectRow(at: indexPath, animated: true)   // deselects row we tapped
        vc.person = persons?[indexPath.section][indexPath.row] // pushing model data we tapped to.
        navigationController?.pushViewController(vc, animated: true)
    }
}
