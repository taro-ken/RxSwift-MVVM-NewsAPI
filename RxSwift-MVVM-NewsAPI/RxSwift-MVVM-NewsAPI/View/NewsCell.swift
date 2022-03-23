//
//  NewsInfoCell.swift
//  RxSwift-MVVM-NewsAPI
//
//  Created by 木元健太郎 on 2022/03/22.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var subTitleLabel: UILabel!

    static var identifier: String {
        return String(describing: self)
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: .main)
    }

    func setInfo(info: Article) {
        titleLabel.text = info.title
        subTitleLabel.text = info.description
    }
}
