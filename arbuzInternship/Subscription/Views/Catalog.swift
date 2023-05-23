//
//  Catalog.swift
//  arbuzInternship
//
//  Created by Bibisara Kenesova on 23.05.2023.
//

import Foundation

struct Catalog {

    static func allCatalogData() -> [Category] {
        [
            .init(category: "Свежие фрукты и овощи", image: "fruits",
                  subcategories: [
                    .init(name: "Фрукты", image: "fruits",
                          products: [
                            .init(name: "Дыня Хасанка", image: "hasanka", price: 1135, count: 35),
                            .init(name: "Дыня Галия", image: "hasanka", price: 1135, count: 0),
                            .init(name: "Клубника", image: "hasanka", price: 1135, count: 673),
                            .init(name: "Банан", image: "fruits", price: 745, count: 200)
                          ]),
                    
                    .init(name: "Овощи", image: "vegetables",
                            products: [
                                .init(name: "Чеснок молодой", image: "hasanka", price: 220, count: 35),
                                .init(name: "Томаты на ветке", image: "hasanka", price: 695, count: 200),
                                .init(name: "Картофель", image: "hasanka", price: 310, count: 673),
                                .init(name: "Огурцы Рава", image: "fruits", price: 455, count: 200)
                            ]),
                    
                    .init(name: "Зелень", image: "greens",
                            products: [
                                .init(name: "Руккола", image: "hasanka", price: 2600, count: 315),
                                .init(name: "Пак Чой", image: "hasanka", price: 2535, count: 0)
                            ]),
                    
                    .init(name: "Орехи", image: "nuts",
                            products: [
                                .init(name: "Каштаны", image: "hasanka", price: 6890, count: 35),
                                .init(name: "Тыквенные семена", image: "hasanka", price: 720, count: 456)
                            ])
                  ]),
            .init(category: "Молочные продукты", image: "milk",
                  subcategories: [
                    .init(name: "Молоко, сметана, масло", image: "milk",
                          products: [
                            .init(name: "Молоко Lactel 1.5%", image: "hasanka", price: 540, count: 354),
                            .init(name: "Масло Амиран 82.5%", image: "hasanka", price: 1995, count: 100),
                            .init(name: "Крем сливочный молочный мдж", image: "hasanka", price: 995, count: 673),
                            .init(name: "Сметана Простоквашино", image: "fruits", price: 965, count: 200)
                          ]),
                    
                    .init(name: "Йогурты и творожные сырки", image: "yogurt",
                            products: [
                                .init(name: "Активиа", image: "hasanka", price: 450, count: 35),
                                .init(name: "Творог Простоквашино", image: "hasanka", price: 1345, count: 200)
                            ]),
                    
                    .init(name: "Сыры", image: "cheese",
                            products: [
                                .init(name: "Сыр растительно-жировой", image: "hasanka", price: 2600, count: 315),
                                .init(name: "Сыр Ламбер", image: "hasanka", price: 6845, count: 100)
                            ]),
                    
                    .init(name: "Яйца", image: "eggs",
                            products: [
                                .init(name: "Яйца Казгер-Кус", image: "hasanka", price: 710, count: 35)
                            ])
                  ])
        ]
    }
    
    struct Category {
        let category: String
        let image: String
        let subcategories: [SubCategory]
        
        struct SubCategory {
            let name: String
            let image: String
            let products: [Products]
            
            struct Products {
                let name: String
                let image: String
                let price: Int
                let count: Int
                
            }
        }
    }
}
