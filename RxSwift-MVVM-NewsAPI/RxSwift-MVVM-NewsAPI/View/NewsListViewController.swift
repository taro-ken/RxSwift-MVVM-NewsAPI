//
//  ViewController.swift
//  RxSwift-MVVM-NewsAPI
//
//  Created by 木元健太郎 on 2022/03/22.
//

import UIKit
import RxSwift

class NewsListViewController: UIViewController, UITableViewDelegate {

    private var viewModel = NewsListViewModel()
    private var disposeBag = DisposeBag()

    
    @IBOutlet weak var newsListTableView: UITableView! {
        didSet {
            newsListTableView.register(NewsCell.nib(), forCellReuseIdentifier: NewsCell.identifier)
            newsListTableView.tableFooterView = UIView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.requestDataSource()
    }

    private func bind() {
        // 以下、UITableViewDelegateの準拠は必須
        // viewModel側で保持しているデータソースとtableViewのDataSourceをbindする（UITableViewDataSource役）
        viewModel.articles
            .bind(to: newsListTableView.rx.items(cellIdentifier: NewsCell.identifier,
                                                 cellType: NewsCell.self)) { (row, element, cell) in
                                                    cell.setInfo(info: element)
        }
        .disposed(by: disposeBag)

        // リスト表示している要素をタップに合わせて購読する（UITableViewDelegateのdidSelect役）
        newsListTableView.rx
            .modelSelected(Article.self)
            .subscribe(onNext:  { article in
                print(article.title)
                print(article.url)
            })
            .disposed(by: disposeBag)
    }
}

