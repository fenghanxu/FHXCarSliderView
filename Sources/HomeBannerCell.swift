//
//  CardPictureCell.swift
//  TestRolling
//
//  Created by iOS003 on 2018/4/2.
//  Copyright © 2018年 iOS003. All rights reserved.
//

import UIKit
import FHXKit
import FHXColorAndFont

public class HomeBannerCell: UITableViewCell,SPCellProtocol  {
  /// 扩大cell的倍数
  fileprivate var mult: CGFloat = 100
  /// item的间距
  fileprivate let itemMargin:  CGFloat = 10
  /// 留白的距离
  fileprivate let itemSpace:  CGFloat = 5
  
  fileprivate var itemHeight: CGFloat{
    get{ return (itemWidth * 150 / 345)}
  }
  fileprivate var itemWidth:  CGFloat{
    get{ return UIScreen.main.bounds.width - (2*(itemMargin + itemSpace)) }
  }
  fileprivate var itemCount:  CGFloat{
    /// item的总数量
    get{ return mult * CGFloat(model.count)}
  }
  fileprivate var scollWidth: CGFloat{
    get{ return itemWidth + itemMargin }
  }

  
  public var model = [String](){
    didSet{
      if model == oldValue {
        beginTimer()
        return
      }
      if model.count * Int(mult) <= 500 {
        mult = CGFloat(500 / model.count)
      }
      // 设置collectionView的滑动的contentSize
      collectionView.contentSize = CGSize(width: scollWidth * itemCount,
                                          height: 0)
      collectionView.reloadData()
      beginTimer()
    }
  }
  
  fileprivate var timer: Timer?

  fileprivate let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
  fileprivate let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
  fileprivate let scrolleView = UIScrollView()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    buildUI()
  }
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func layoutSubviews() {
    super.layoutSubviews()
    // 设置起始偏移值
    if collectionView.contentOffset.x != 0 { return }
    scrolleView.contentOffset = CGPoint(x: scollWidth * (itemCount/2), y: 0)
  }
}

// MARK: - UI
extension HomeBannerCell{
  func buildUI(){
    contentView.addSubview(collectionView)    
    buildSubUI()
    buildLayout()
  }
  
  func buildSubUI() {
    layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = itemMargin
    layout.sectionInset = UIEdgeInsets(top:    0,
                                       left:   itemSpace + itemMargin,
                                       bottom: 0,
                                       right:  itemSpace + itemMargin)
    
    collectionView.backgroundColor = Color.white
    collectionView.collectionViewLayout = layout
    collectionView.clipsToBounds = false
    collectionView.alwaysBounceHorizontal = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.sp.register(HomePictureSliderCell.self)

    // 用scrollView接收滑动手势
    addSubview(scrolleView)
    scrolleView.isHidden = true
    scrolleView.isPagingEnabled = true
    scrolleView.alwaysBounceHorizontal = true
    scrolleView.showsHorizontalScrollIndicator = false
    scrolleView.delegate = self
    
    collectionView.addGestureRecognizer(scrolleView.panGestureRecognizer)
    collectionView.panGestureRecognizer.isEnabled = false
  }
  
  func buildLayout() {
    collectionView.snp.makeConstraints { (make) in
      make.top.bottom.left.right.equalToSuperview()
    }
    let left = itemSpace + itemMargin / 2
    scrolleView.snp.makeConstraints { (make) in
      make.top.bottom.equalToSuperview()
      make.left.equalToSuperview().offset(left)
      make.right.equalToSuperview().offset(-left)
    }
  }
}

// MARK: - 自定义方法
extension HomeBannerCell {
  /// 开启定时器
  func beginTimer() {
    if timer != nil {
      timer?.invalidate()
      timer = nil
    }
    timer = Timer.scheduledTimer(timeInterval: 6.18,
                                 target: self,
                                 selector: #selector(pictureSlide),
                                 userInfo: nil,
                                 repeats: true)
    
    RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
  }
  
  /// 移除定时器
  func removeTimer() {
    if timer == nil { return }
    timer?.invalidate()
    timer = nil
  }
  
  // 滑动
  @objc func pictureSlide() {
    if model.isEmpty { return }
    // 不是当前页面 停止定时器
    if !(sp.viewController?.sp.isVisible ?? true) {
      removeTimer()
      return
    }
    
    var offset: CGPoint
    // 最后一个回到中间
    if scrolleView.contentOffset.x >= scollWidth * (itemCount - 1) {
      offset = CGPoint(x: scollWidth * (itemCount/2), y: 0)
    }else {
      offset = CGPoint(x: scrolleView.contentOffset.x + scrolleView.width, y: 0)
    }
    scrolleView.setContentOffset(offset, animated: true)
  }
}

// MARK: - 代理: UICollectionViewDelegate UICollectionViewDataSource
extension HomeBannerCell: UICollectionViewDelegate, UICollectionViewDataSource {
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    scrolleView.contentSize = CGSize(width: (scollWidth * itemCount),
                                     height: 0)
    return Int(itemCount)
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.sp.dequeueCell(indexPath) as HomePictureSliderCell
    let item = indexPath.item % model.count
    if item >= model.count { return cell }
    cell.model = model[item]
    return cell
  }
  
  public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    let item = indexPath.item % model.count
//    guard let url = model.value(at: item) else{ return }
//    let vc = Routable.viewController(url: url)
//    sp.viewController.sp.push(vc: vc, animated: true)
  }
  
  public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if scrollView == self.scrolleView {
      collectionView.contentOffset.x = self.scrolleView.contentOffset.x
    }
  }
  
  public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    removeTimer()
  }
  
  public func scrollViewDidEndDragging(_ scrollView: UIScrollView,
                                willDecelerate decelerate: Bool) {
    beginTimer()
  }
}

