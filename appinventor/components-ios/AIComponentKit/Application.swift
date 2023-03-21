//
//  Application.swift
//  AIComponentKit
//
//  Created by Evan Patton on 11/23/16.
//  Copyright © 2016 MIT Center for Mobile Learning. All rights reserved.
//

import Foundation

open class Application {
  fileprivate var assetManager_: AssetManager?
  let name: String

  /**
   * Create an Application using the currently running application bundle.
   */
  public init() {
    name = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String
    assetManager_ = AssetManager()
  }

  /**
   *
   */
  public init(from url: URL) {
    var temp_name = "UnknownApp"
    do {
      let fileregex = try NSRegularExpression(pattern: "/([^./]+).aia$")
      if let result = fileregex.firstMatch(in: url.absoluteString, range: NSMakeRange(0, url.absoluteString.lengthOfBytes(using: .utf8))) {
        let range = result.rangeAt(1)
        temp_name = (url.absoluteString as NSString).substring(with: range)
      }
    } catch {
      // wtf
    }
    name = temp_name
  }

  convenience init(from url: URL, isRepl: Bool) {
    if isRepl {
      self.init()
    } else {
      self.init(from: url)
    }
  }

  open var assetManager: AssetManager {
    get {
      if assetManager_ == nil {
        assetManager_ = AssetManager(for: self)
      }
      return assetManager_!
    }
  }
}
