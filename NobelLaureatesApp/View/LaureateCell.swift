//
//  LaureateCell.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 11.05.2023.
//

import UIKit

class LaureateCell: UITableViewCell {
    
    var laureate: LaureateElement? {
        didSet {
            laureateLabel.text = laureate?.fullName.en
            categoryOfLaureateLabel.text = laureate?.nobelPrizes[0].category.en
        }
    }
    
    // MARK: - Properties
    private let separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return separatorView
    } ()
    
    private let laureateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    } ()
    
    private let categoryOfLaureateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods    
    private func setUI() {
        self.backgroundColor = .white
        [separatorView, laureateLabel, categoryOfLaureateLabel].forEach { self.addSubview($0) }
        setConstraints()
    }
    
    private func setConstraints() {
        laureateLabel.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 12, paddingLeft: 16)
        
        categoryOfLaureateLabel.anchor(top: laureateLabel.bottomAnchor, left: self.leftAnchor, paddingTop: 4, paddingLeft: 16)
        
        separatorView.anchor(right: self.rightAnchor, bottom: self.bottomAnchor, left: self.leftAnchor, paddingRight: 16, paddingLeft: 16, height: 1)
    }
}
