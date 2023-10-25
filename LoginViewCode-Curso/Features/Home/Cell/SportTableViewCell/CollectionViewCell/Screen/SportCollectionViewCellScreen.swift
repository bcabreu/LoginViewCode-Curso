//
//  CollectionViewCellScreen.swift
//  LoginViewCode-Curso
//
//  Created by Bruno Abreu on 24/10/23.
//

import UIKit

class SportCollectionViewCellScreen: UIView {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var sportName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = UIColor.darkBlueColor
        label.textAlignment = .center
        return label
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
        addSubview(imageView)
        addSubview(sportName)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: sportName.topAnchor, constant: -10),
         
            sportName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            sportName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            sportName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            sportName.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
}
