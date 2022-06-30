//
//  DetailViewController.swift
//  Detail
//
//  Created by Jinho Jang on 2022/06/30.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import UIKit
import SnapKit
import ReactorKit
import RxCocoa

public protocol DetailViewControllerType: UIViewController {}

final class DetailViewController:
    UIViewController,
    View,
    DetailViewControllerType {
    
    var disposeBag: DisposeBag = DisposeBag()
    private let wordLabel = UILabel()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    init(_ reactor: DetailReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    func bind(reactor: DetailReactor) {
        reactor.state.map { $0.word.word }
            .asDriver(onErrorDriveWith: .empty())
            .drive(wordLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    private func attribute() {
        view.backgroundColor = .white
        
        wordLabel.font = .boldSystemFont(ofSize: 24)
    }
    
    private func layout() {
        view.addSubview(wordLabel)
        view.addSubview(tableView)
        
        wordLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        tableView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
