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

final class DetailViewController:
    UIViewController,
    View {
    
    var disposeBag: DisposeBag = DisposeBag()
    private let wordLabel = UILabel()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    init() {
        super.init(nibName: nil, bundle: nil)
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
            
            
    }
    
    private func attribute() {
        view.backgroundColor = .white
    }
    
    private func layout() {
        view.addSubview(wordLabel)
        view.addSubview(tableView)
        
        wordLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
