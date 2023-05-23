//
//  SubCategoryViewController.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 23.05.2023.
//

import UIKit
import SnapKit

final class CategoryViewController: UIViewController {
    
    let categories = Catalog.allCatalogData()
    var isExpended: Bool = false
    
    private lazy var productSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Искать на Арбузе"
        return searchBar
    }()
    
    private lazy var subCategoriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(SubCategoriesTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.subCategoriesTableViewCell)
        tableView.separatorStyle = .singleLine
        tableView.allowsMultipleSelection = true
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        subCategoriesTableView.dataSource = self
        subCategoriesTableView.delegate = self
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setupViews()
        setupConstraints()
    }
}

//MARK: - subCategories Table View Data Source methods

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.subCategoriesTableViewCell, for: indexPath) as? SubCategoriesTableViewCell
            else { return UITableViewCell() }
        
        cell.category = categories[indexPath.item]
        cell.expandConfigure(isExpended)
        cell.imageConfigure(with: categories[indexPath.item].image)
        cell.labelConfigure(with: categories[indexPath.item].category)
        cell.onTap = { [weak self] subcategory in
            let vc = CatalogViewController(subcategory: subcategory)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
}

//MARK: - subCategories Table View Delegate methods

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isExpended.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
    
//MARK: - Setup Views and Constraints methods

private extension CategoryViewController {
    
    func setupViews() {
        view.addSubview(subCategoriesTableView)
        subCategoriesTableView.tableHeaderView = productSearchBar
    }
    
    func setupConstraints() {
        subCategoriesTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
        
        subCategoriesTableView.tableHeaderView?.frame.size = .init(width: view.frame.width,
                                                                   height: 40)
        
        productSearchBar.searchTextField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
