//
//  CabinetCVC.swift
//  CultureCabinet
//
//  Created by jjuyaa on 2021/08/11.
//

import UIKit

class CabinetCVC: UICollectionViewCell {
    static let identifier = "CabinetCVC"

    @IBOutlet var theme_icon: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var commentView: UIView!
    @IBOutlet var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

extension CabinetCVC {
    func setUI() {
        setView()
    }
    
    func setView() {
        commentView.backgroundColor = UIColor(named: "coral1")
    }
    
    func setLabel() {
        commentLabel.font = .systemFont(ofSize: 10)
    }
}
