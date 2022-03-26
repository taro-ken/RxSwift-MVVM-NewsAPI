//
//  ViewController.swift
//  RxSwift-MVVM-NewsAPI
//
//  Created by 木元健太郎 on 2022/03/22.
//

import UIKit
import RxSwift

final class NewsListViewController: UIViewController, UITableViewDelegate {
    
    private var viewModel = NewsListViewModel()
    private var disposeBag = DisposeBag()
    
    
    @IBOutlet private weak var newsListTableView: UITableView! {
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
        viewModel.articles
            .bind(to: newsListTableView.rx.items(cellIdentifier: NewsCell.identifier,
                                                 cellType: NewsCell.self)) { (row, element, cell) in
                cell.setInfo(info: element)
            }.disposed(by: disposeBag)
        
        newsListTableView.rx
            .modelSelected(Article.self)
            .subscribe(onNext:  { article in
                guard let url = article._url else {
                    return
                }
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            })
            .disposed(by: disposeBag)
    }
}

