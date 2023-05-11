//
//  LaureateCell.swift
//  NobelLaureatesApp
//
//  Created by Alikhan Gubayev on 11.05.2023.
//

import UIKit

class LaureateCell: UITableViewCell {
    
    private var laureateLink: String?
    
    private let laureateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureView(laureate: String) {
        self.laureateLabel.text = laureate
    }
    
    private func setUI() {
        self.backgroundColor = .white
        [laureateLabel].forEach { self.addSubview($0) }
        setConstraints()
    }
    
    private func setConstraints() {
        laureateLabel.anchor(top: self.topAnchor, left: self.leftAnchor, paddingTop: 12, paddingLeft: 16)
    }
}
