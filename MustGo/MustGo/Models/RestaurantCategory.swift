//
//  RestaurantCategory.swift
//  MustGo
//
//  Created by Raphael Shim on 2023/05/02.
//

import Foundation

struct Category {
    let category: String
}

struct CategorySection {
    let lists: [Category]
    
    static func generateData() -> [CategorySection] {
        return [
            CategorySection(lists: [
                Category(category: "한식"),
                Category(category: "양식"),
                Category(category: "중식"),
                Category(category: "일식"),
                Category(category: "분식"),
                Category(category: "기타")
            ]),
            CategorySection(lists: [
                Category(category: "고깃집"),
                Category(category: "횟집"),
                Category(category: "요리주점"),
                Category(category: "족발/보쌈"),
                Category(category: "곱창/막창")
            ]),
            CategorySection(lists: [
                Category(category: "돈가스"),
                Category(category: "치킨/피자"),
                Category(category: "맥주/호프")
            ]),
            CategorySection(lists: [
                Category(category: "다이어트"),
                Category(category: "패스트푸드"),
                Category(category: "카페/디저트")
            ])
        ]
    }
}
