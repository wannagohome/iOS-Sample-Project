//
//  SearchViewController.swift
//  UserInterface
//
//  Created by Jinho Jang on 2022/06/18.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import ReactorKit

public protocol SearhViewControllerType: UIViewController {}

final class SearchViewController:
    UIViewController,
    View,
    SearhViewControllerType {
    
    // MARK: - Properties
    public var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Views
    private let searchBar = UISearchBar()
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Initialization
    init(reactor: SearchReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        layout()
    }
    
    func bind(reactor: SearchReactor) {
        searchBar.rx.text.orEmpty
            .distinctUntilChanged()
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .map(SearchReactor.Action.search)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
         
        tableView.rx.itemSelected
            .map { $0.row }
            .map(SearchReactor.Action.selectWord)
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.words }
            .asDriver(onErrorDriveWith: .empty())
            .drive(tableView.rx.items) { tb, row, item in
                let cell = tb.dequeueReusableCell(
                    withIdentifier: WordCell.description(),
                    for: IndexPath(row: row, section: 0)
                ) as! WordCell
                
                cell.configure(with: item.word)
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    
    // MARK: - Private Methods
    private func attribute() {
        view.backgroundColor = .white
        
        tableView.register(WordCell.self, forCellReuseIdentifier: WordCell.description())
    }
    
    private func layout() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
