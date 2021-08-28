//
//  CabinetCVC.swift
//  CultureCabinet
//
//  Created by jjuyaa on 2021/08/11.
//

import UIKit

class CabinetCVC: UICollectionViewCell {
    static let identifier = "CabinetCVC"

    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var starLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
}

extension CabinetCVC {
    func setUI() {
        setLabel()
    }
    
    func setLabel() {
        categoryLabel.font = .systemFont(ofSize: 10, weight: .semibold)
        starLabel.font = .systemFont(ofSize: 10, weight: .bold)
        starLabel.textColor = UIColor(named: "coral2")
        commentLabel.font = .systemFont(ofSize: 10, weight: .regular)
    }
}
