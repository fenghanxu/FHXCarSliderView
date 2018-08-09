//
//  Font.swift
//  BLConfig
//
//  Created by bigl on 2017/10/17.
//

import UIKit

public struct Font {
  /// 字体设置
  public enum Style {
    case medium
    case heavy
    case regular
  }
  
  static var isSE = min( UIScreen.main.bounds.height,  UIScreen.main.bounds.width) < 350
  
  public static func font(ofSize size: CGFloat,style: Style = .regular) -> UIFont{
    var fontSize = size
    if isSE { fontSize = size - 1 }
    switch style {
    case .medium:
      if #available(iOS 9, *) {
        if let font = UIFont(name: "PingFangSC-Medium", size: fontSize) { return font }
      } else {
        if let font = UIFont(name: ".PingFang-SC-Medium", size: fontSize) { return font }
      }
      return UIFont.systemFont(ofSize: fontSize)
    case .heavy:
      if #available(iOS 9, *) {
        if let font = UIFont(name: "PingFangSC-Semibold", size: fontSize) { return font }
      } else {
        if let font = UIFont(name: ".PingFang-SC-Semibold", size: fontSize) { return font }
      }
      return UIFont.systemFont(ofSize: fontSize)
    case .regular:
      if #available(iOS 9, *) {
        if let font = UIFont(name: "PingFangSC-Regular", size: fontSize) { return font }
      } else {
        if let font = UIFont(name: ".PingFang-SC-Regular", size: fontSize) { return font }
      }
      return UIFont.systemFont(ofSize: fontSize)
    }
  }
}

public extension Font {
  public static var font10: UIFont {  return Font.font(ofSize: 10) }
  public static var font12: UIFont {  return Font.font(ofSize: 12) }
  public static var font13: UIFont {  return Font.font(ofSize: 13) }
  public static var font14: UIFont {  return Font.font(ofSize: 14) }
  public static var font15: UIFont {  return Font.font(ofSize: 15) }
  public static var font16: UIFont {  return Font.font(ofSize: 16) }
  public static var font17: UIFont {  return Font.font(ofSize: 17) }
  public static var font18: UIFont {  return Font.font(ofSize: 18) }
  public static var font20: UIFont {  return Font.font(ofSize: 20) }
}

