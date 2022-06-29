//
//  DayListViewController.swift
//  UserInterface
//
//  Created by Jinho Jang on 2022/06/27.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class DayListViewController: UIViewController {
    
    // MARK: - Properties
    private var dayList: [String] = []
    private let disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Views
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1 ... 30 {
            dayList.append("Day \(i)")
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.register(
            DayListCell.self,
            forCellWithReuseIdentifier: DayListCell.description()
        )
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: view.bounds.width / 5, height: view.bounds.width / 5)
            layout.minimumInteritemSpacing = 0
        }
        
        Driver.just(dayList)
            .drive(collectionView.rx.items) { cv, row, item in
                let cell = cv.dequeueReusableCell(
                    withReuseIdentifier: DayListCell.description(),
                    for: IndexPath(row: row, section: 0)
                ) as! DayListCell
                cell.configure(item)
                return cell
            }
            .disposed(by: disposeBag)
        
        collectionView.rx.itemSelected
            .asDriver()
            .drive(onNext: { [weak self] _ in
                self?.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
}


final class DayListCell: UICollectionViewCell {
    
    // MARK: - Views
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ string: String) {
        label.text = string
    }
}
