//
//  WordCell.swift
//  SearchUserInterface
//
//  Created by Jinho Jang on 2022/06/29.
//  Copyright © 2022 org.AriseNShine. All rights reserved.
//

import UIKit

final class WordCell: UITableViewCell {
    
    private let wordLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with word: String) {
        wordLabel.text = word
    }
    
    private func layout() {
        contentView.addSubview(wordLabel)
        
        wordLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(30)
        }
    }
}
