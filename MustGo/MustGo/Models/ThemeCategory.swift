//
//  ThemeCategory.swift
//  MustGo
//
//  Created by Raphael Shim on 2023/05/02.
//

import Foundation

struct ThemeCategory {
    let themeLabel: String
}

extension ThemeCategory {
    static let list: [ThemeCategory] = [
        ThemeCategory(themeLabel: "같이 먹어요"),
        ThemeCategory(themeLabel: "혼밥"),
        ThemeCategory(themeLabel: "둘이서"),
        ThemeCategory(themeLabel: "세명 이상"),
        ThemeCategory(themeLabel: "간단하게"),
        ThemeCategory(themeLabel: "가성비 甲"),
        ThemeCategory(themeLabel: "분위기 甲"),
        ThemeCategory(themeLabel: "시끌벅적"),
        ThemeCategory(themeLabel: "뉴페이스"),
        ThemeCategory(themeLabel: "결정장애")
    ]
}
