//
//  PictureSliderCell.swift
//  B7iOS
//
//  Created by 膳品科技 on 16/8/11.
//  Copyright © 2016年 Buy.Spzjs.iPhone. All rights reserved.
//

import UIKit
import Kingfisher
import FHXKit
import SnapKit

class HomePictureSliderCell: UICollectionViewCell {  
  fileprivate let imageView = UIImageView()
  
  var model = String() {
    didSet{
      if model != oldValue { updateUI() }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    buildUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension HomePictureSliderCell: SPCellProtocol {
  fileprivate func updateUI() {
    imageView.contentMode = .scaleAspectFit
    imageView.sp.setImage(urlStr: model,
                          placeholder: UIImage(named: "default-2"))
  }
  
  fileprivate func buildUI() {
    contentView.addSubview(imageView)
    contentView.layer.shadowColor = UIColor.gray.cgColor
    contentView.layer.shadowOffset = CGSize(width: 0, height: 5)
    contentView.layer.shadowOpacity = 0.3
    
    imageView.cornerRadius = 6

    imageView.snp.makeConstraints { (make) in
      make.top.left.right.bottom.equalToSuperview()
    }
  }
}
