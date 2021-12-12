//
//  TransferMoneyButton.swift
//  MMCv2
//
//  Created by Serg Nepomyaschyy on 12.12.2021.
//

import UIKit

class TransferMoneyButton: UIButton {

        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = #colorLiteral(red: 1, green: 0.5917804241, blue: 0.0205632858, alpha: 1)
            setTitle("Transfer Money", for: .normal)
            setTitleColor(.white, for: .normal)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

