//
//  ViewController.swift
//  FHXCarSliderView
//
//  Created by fenghanxu on 08/09/2018.
//  Copyright (c) 2018 fenghanxu. All rights reserved.
//

import UIKit
import FHXCarSliderView

class ViewController: UIViewController {
  
  let tableview = UITableView()
  
  let arr = ["https://t-source.3pzs.com/banner/800.0x347.8x1/1514259127.jpg",
             "https://t-source.3pzs.com/banner/800.0x347.8x1/1514259127.jpg",
             "https://t-source.3pzs.com/banner/800.0x347.8x1/1514259127.jpg",
             "https://t-source.3pzs.com/banner/800.0x347.8x1/1514259127.jpg",
             "https://t-source.3pzs.com/banner/800.0x347.8x1/1514259127.jpg"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    buildUI()
  }
  
  func buildUI(){
    view.backgroundColor = UIColor.white
    view.addSubview(tableview)
    buildSubview()
    buildLayout()
  }
  
  func buildSubview(){
    tableview.backgroundColor = UIColor.white
    tableview.tableFooterView = UIView()
    tableview.delegate = self
    tableview.dataSource = self
    tableview.separatorStyle = .none
    tableview.register(HomeBannerCell.self, forCellReuseIdentifier: "kHomeBannerCell")
    tableview.rowHeight = 200
  }
  
  func buildLayout(){
    tableview.snp.makeConstraints { (make) in
      make.left.right.bottom.equalToSuperview()
      make.top.equalToSuperview().offset(100)
    }
  }
  
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableview.dequeueReusableCell(withIdentifier: "kHomeBannerCell", for: indexPath) as! HomeBannerCell
    cell.model = arr
    return cell
  }
  
  
  
  
}


