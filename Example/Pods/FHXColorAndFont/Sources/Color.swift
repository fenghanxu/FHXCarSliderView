
//
//  CustomColor.swift
//  EnvironmentConfiguration
//
//  Created by BigL055 on 16/7/25.
//  Copyright © 2016年 BigL.EnvironmentConfiguration.com. All rights reserved.
//

import UIKit
import FHXKit

public struct Color { }

// MARK: - AS Swift4.0 Style
public extension Color {
  /// 背景色 0xf5f5f5
  public static let background = UIColor(value: 0xf5f5f5)
  
  /// 主题色,图标/按钮 0xff6619
  public static let theme = UIColor(value: 0xff6619)
  /// 主题深色 0xff6619
  public static let themeDeep = UIColor(value: 0xff6619)
  /// 主题浅色 0xff6619
  public static let themeLight = UIColor(value: 0xff6619)
  /// 主题浅色的深色 0xff6619
  public static let themeLightDeep = UIColor(value: 0xff6619)
  
  /// 辅助颜色 0xffb433
  public static let assist = UIColor(value: 0xffb433)
  /// 辅助深色 0xffb433
  public static let assistDeep = UIColor(value: 0xffb433)
  /// 辅助浅色 0xffb433
  public static let assistLight = UIColor(value: 0xffb433)
  
  /// 主要文字 0x333333
  public static let textBlack = UIColor(value: 0x333333)
  /// 次要文字 0x666666
  public static let textGray = UIColor(value: 0x666666)
  /// 二级次要文字 0xcccccc
  public static let textLightGray = UIColor(value: 0xcccccc)
  /// 三级次要文字 0x999999
  public static let textLLightGray = UIColor(value: 0x999999)
  
  /// 价格 0xff6619
  public static let price = UIColor(value: 0xff6619)
  /// 价格辅色 0xff6619
  public static let priceAssist = UIColor(value: 0xffb433)
  
  /// 米黄色 0xfff3dc
  public static let beige = UIColor(value: 0xfff3dc)
  /// 阴影线 0xf5f5f5
  public static let line = UIColor(value: 0xf5f5f5)
  /// 未激活按钮 0xcccccc
  public static let nonActivated = UIColor(value: 0xcccccc)
  /// 导航条颜色 0xFFFFFF
  public static let navigationBar = UIColor(value: 0xFFFFFF)
  
  public static let textTabbar = UIColor(value: 0x666666)
  
  public static let tableHeader = UIColor(value: 0xc5c5c5)
}

// MARK: - AS UIColor 3.0
public extension Color {
  /// 红
  public static let red = UIColor(value: 0xf23d18)
  /// 黑
  public static let black = UIColor(value: 0x333333)
  /// 白
  public static let white = UIColor.white
  
  public static let blue = UIColor(value: 0x25beff)
  
  public static let green = UIColor(value: 0xadd636)
  /// 透明
  public static let clear = UIColor.clear
  
  public static let yellow = UIColor(value: 0xFFAC03)
}

