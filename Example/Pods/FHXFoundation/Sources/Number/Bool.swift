//
//  BLFoundation
//  Pods
//
//  Created by BigL on 2017/9/15.
//

import UIKit

public extension Bool {
  /// Bool转Int  value: 1: 0
  public var int: Int { return self ? 1: 0 }
  /// Bool转String   value: "1": "0"
  public var string: String { return description }
  /// 取反
  public var toggled: Bool { return !self }
  
  /// 转换: CGFloat.
  public var cgFloat: CGFloat { return CGFloat(self.int) }
  
}

extension Bool{
  /// 取反
  @discardableResult public mutating func toggle() -> Bool {
    self = !self
    return self
  }
}
