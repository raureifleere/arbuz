//
//  CatalogCollectionViewCell.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 23.05.2023.
//

import UIKit
import SnapKit

class CatalogCollectionViewCell: UICollectionViewCell {
    
    var link: CatalogViewController?
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "кг/шт"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var namedProductLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "gray_heart"), for: .normal)
        return button
    }()
    
    @objc func handleMarksAsFavorite() {
        favoriteButton.tintColor = .red
        //link?.tapFavorite(cell: self)
    }
    
    //MARK: Counter
    lazy var counterView = UIView()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .systemGreen
        return button
    }()
    
    lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = .systemGreen
        return button
    }()
    
    //Buttons
    @objc func 
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup Views and Constraints methods

private extension CatalogCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(namedProductLabel)
        contentView.addSubview(weightLabel)
        contentView.addSubview(favoriteButton)
        contentView.addSubview(counterView)
        
        counterView.addSubview(plusButton)
        counterView.addSubview(counterLabel)
        counterView.addSubview(minusButton)
    }
    
    func setupConstraints() {
        productImageView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.size.equalTo(CGSize(width: 10, height: 10))
        }
        
        namedProductLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom)
            make.trailing.leading.equalToSuperview()
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(namedProductLabel.snp.bottom)
            make.trailing.leading.equalToSuperview()
        }
        
        counterView.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            make.height.equalTo(20)
        }
        
        plusButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        counterLabel.snp.makeConstraints { make in
            make.leading.equalTo(plusButton.snp.trailing)
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        minusButton.snp.makeConstraints { make in
            make.leading.equalTo(counterLabel.snp.trailing)
            make.top.bottom.trailing.equalToSuperview()
        }
        
        favoriteButton.addTarget(self, action: #selector(handleMarksAsFavorite), for: .touchUpInside)
    }
}
