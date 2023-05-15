//
//  ViewController.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 11.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var laureatesData: [LaureateElement] = []
    private var filteredLaureatesData: [LaureateElement] = []
    private var isSearching: Bool = false
    
    private var tableView: UITableView = {
        var tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    } ()
    
    private let searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.placeholder = "Search Laureate by name"
        searchBar.searchBarStyle = .minimal
        return searchBar
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Laureates"
        self.view.backgroundColor = .white
        
        [tableView, searchBar].forEach { self.view.addSubview($0) }
        
        setConstraints()
        initalizeTableView()
        getAllLaureates()
        customBackButton()
        
        searchBar.delegate = self
    }
    
    private func setConstraints() {
        searchBar.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 100, paddingRight: 16, paddingLeft: 16)
        tableView.anchor(top: searchBar.bottomAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 16, paddingBottom: 50, paddingLeft: 16)
    }
    
    private func initalizeTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LaureateCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func getAllLaureates() {
        APIManager.shared.getLaureates { [weak self] data in
            guard let self else { return }
            self.laureatesData = data
            self.tableView.reloadData()
        }
    }
    
    private func customBackButton() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredLaureatesData.count : laureatesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as? LaureateCell else { return UITableViewCell() }
        let laureate: LaureateElement = isSearching
                                            ? filteredLaureatesData[indexPath.row]
                                            : laureatesData[indexPath.row]
        cell.laureate = laureate
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let laureateVC = LaureateViewController()
        if isSearching {
            laureateVC.laureate = filteredLaureatesData[indexPath.row]
        } else {
            laureateVC.laureate = laureatesData[indexPath.row]
        }
        navigationController?.pushViewController(laureateVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterLaureates(by: searchText)
    }
    
    private func filterLaureates(by searchText: String) {
        if searchText.isEmpty {
            filteredLaureatesData = laureatesData
            isSearching = false
        } else {
            filteredLaureatesData = laureatesData.filter({ laureate in
                return laureate.fullName.en.lowercased().contains(searchText.lowercased())
            })
            isSearching = true
        }
        tableView.reloadData()
    }
}
