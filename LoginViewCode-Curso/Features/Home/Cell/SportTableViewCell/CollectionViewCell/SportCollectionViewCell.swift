//
//  SportCollectioViewCell.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 24/10/23.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = String(describing: SportCollectionViewCell.self)
    
    
    private let screen: SportCollectionViewCellScreen = {
        let screen = SportCollectionViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        screen.layer.borderWidth = 2
        screen.layer.borderColor = UIColor.mediumBlueColor.cgColor
        return screen
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView() {
        contentView.addSubview(screen)
    }
    
    public func setupCell(data: Sport) {
        screen.imageView.image = UIImage(named: data.ImageName)
        screen.sportName.text = data.name
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
