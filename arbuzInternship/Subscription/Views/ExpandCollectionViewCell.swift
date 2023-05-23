//
//  ExpandCollectionViewCell.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 23.05.2023.
//

import UIKit
import SnapKit

final class ExpandCollectionViewCell: UICollectionViewCell {
    
    private lazy var expandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    func configureImage(with image: String) {
        expandImageView.image = UIImage(named: image)
    }
    
    func configureHeader(with header: String) {
        headerLabel.text = header
    }
    
    var onLearnMoreButtonTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        contentView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTap() {
        onLearnMoreButtonTap?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Setup Views and Constraints methods

private extension ExpandCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(expandImageView)
        contentView.addSubview(headerLabel)
    }
    
    func setupConstraints() {
        expandImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 80))
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(expandImageView.snp.bottom).offset(3)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
