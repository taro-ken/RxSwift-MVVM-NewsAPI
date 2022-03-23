//
//  Article.swift
//  RxSwift-MVVM-NewsAPI
//
//  Created by 木元健太郎 on 2022/03/22.
//

import Foundation

struct APIResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
    let url:String
}
