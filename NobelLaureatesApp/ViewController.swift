//
//  ViewController.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 11.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var laureatesData: [String] = []
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        return tableView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        [tableView].forEach { self.view.addSubview($0) }
        
        setConstraints()
        initalizeTableView()
        
        APIManager.shared.getLaureates { [weak self] data in
            DispatchQueue.main.async {
                guard let self else { return }
                self.laureatesData = data
                self.tableView.reloadData()
            }
        }
    }
    
    private func setConstraints() {
        tableView.anchor(top: view.topAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 16, paddingBottom: 50, paddingLeft: 16)
    }
    
    private func initalizeTableView() {
        tableView.dataSource = self
        tableView.register(LaureateCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laureatesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as? LaureateCell else { return UITableViewCell() }
        let textValue = laureatesData[indexPath.row]
        cell.configureView(laureate: textValue)
        return cell
    }
}
