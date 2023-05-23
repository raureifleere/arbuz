//
//  subCategoriesTableViewCell.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 23.05.2023.
//

import UIKit
import SnapKit

final class SubCategoriesTableViewCell: UITableViewCell {
    
    var category: Catalog.Category?
    
    var onTap: ((Catalog.Category.SubCategory) -> Void)?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        stackView.backgroundColor = .systemBackground
        return stackView
    }()
    
    //main part
    private lazy var mainView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
        return imageView
    }()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    private lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //expand part
    private lazy var expendableView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ExpandCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.expandCollectionViewCell)
        return collectionView
    }()
    
    //configure part
    func expandConfigure(_ isExpanded: Bool) {
        expendableView.isHidden = !isExpanded
        chevronImageView.image = (isExpanded ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down"))?.withRenderingMode(.alwaysTemplate)
    }
    
    func imageConfigure(with image: String) {
        categoryImageView.image = UIImage(named: image)
    }
    
    func labelConfigure(with text: String) {
        categoryLabel.text = text
    }
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Collection View Data Source methods

extension SubCategoriesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let category = category else { return 0 }
        return category.subcategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.expandCollectionViewCell, for: indexPath) as? ExpandCollectionViewCell,
            let category = category
        else { return UICollectionViewCell() }
        
        //MARK: - Nado Ispravit'
        cell.layer.borderColor = .init(red: 100, green: 0, blue: 0, alpha: 1)
        cell.layer.borderWidth = 1
        cell.configureImage(with: category.subcategories[indexPath.item].image)
        cell.configureHeader(with: category.subcategories[indexPath.item].name)
        cell.onLearnMoreButtonTap = { [weak self] in
            self?.onTap?(category.subcategories[indexPath.item])
        }
        return cell
    }
    
    
}

//MARK: - Collection View Delegate methods

extension SubCategoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

//MARK: - Setup Views and Constraints methods

private extension SubCategoriesTableViewCell {
    
    func setupViews() {
        contentView.addSubview(stackView)
        [mainView, expendableView].forEach { stackView.addArrangedSubview($0) }
        
        mainView.addSubview(categoryImageView)
        mainView.addSubview(categoryLabel)
        mainView.addSubview(chevronImageView)
        
        expendableView.addSubview(categoryCollectionView)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(5)
        }
        
        //main part constraints
        mainView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(40)
        }
        
        categoryImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryImageView.snp.trailing).offset(10)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().inset(10)
        }
        
        chevronImageView.snp.makeConstraints { make in
            make.leading.equalTo(categoryLabel.snp.trailing)
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        
        //expand part constraints
        expendableView.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
            make.height.equalTo(210)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
