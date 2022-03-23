//
//  NewsListViewModel.swift
//  RxSwift-MVVM-NewsAPI
//
//  Created by 木元健太郎 on 2022/03/22.
//

import Foundation
import RxSwift
import RxCocoa

class NewsListViewModel {
    private let requestApiUrlString = "https://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=37d02653ae7e474481427d8ce9c13de2"
    private var disposeBag = DisposeBag()
    // 記事情報保持用
    var articles = BehaviorRelay<[Article]>(value: [])

    func requestDataSource() {
        // ViewModelが保持した状態をもとにModelクラス(今回はURLRequestのExtension)にデータ取得を求めるかを判断する
        guard let url = URL(string: requestApiUrlString) else { return }
        URLRequest.load(resource: Resource<APIResponse>(url: url))
            .subscribe(onNext: { [weak self] response in
                print(response)
                self?.articles.accept(response.articles)
            })
            .disposed(by: disposeBag)
    }
}
