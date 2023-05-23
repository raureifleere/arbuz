//
//  CatalogViewController.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 23.05.2023.
//

import UIKit
import SnapKit

final class CatalogViewController: UIViewController {
    
    var category = Catalog.allCatalogData()
    
    func tapFavorite(cell: UICollectionViewCell) {
        print("Tapped")
        //collectionView.indexPath(for: cell)
    }

    private lazy var catalogCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.catalogCollectionViewCell)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private let subcategory: Catalog.Category.SubCategory
    
    init(subcategory: Catalog.Category.SubCategory) {
        self.subcategory = subcategory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        catalogCollectionView.dataSource = self
        catalogCollectionView.delegate = self
        
        setupViews()
        setupConstraints()
    }
}

//MARK: - Collection View Data Source

extension CatalogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subcategory.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.catalogCollectionViewCell, for: indexPath) as? CatalogCollectionViewCell
        else { return UICollectionViewCell() }
        cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        cell.layer.borderWidth = 1
        cell.productImageView.image = UIImage(named: subcategory.products[indexPath.item].image)
        cell.namedProductLabel.text = subcategory.products[indexPath.item].name
        return cell
        }
}

//MARK: - Collection View Delegate

extension CatalogViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}

//MARK: - Setup Views and Constraints methods

private extension CatalogViewController {
    
    func setupViews() {
        view.addSubview(catalogCollectionView)
    }
    
    func setupConstraints() {
        catalogCollectionView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
    }
}
