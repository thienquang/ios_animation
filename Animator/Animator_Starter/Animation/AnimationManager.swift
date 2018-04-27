//
//  AnimationManager.swift
//  Animator_Starter
//
//  Created by Thien Le quang on 4/27/18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class AnimationManager {
  
  // Calculated screen bounds
  class var screenBounds: CGRect {
    return UIScreen.main.bounds
  }
  
  // Screen positions
  class var screenRight: CGPoint {
    return CGPoint(x: screenBounds.maxX, y: screenBounds.midY)
  }
  
  class var screenTop: CGPoint {
    return CGPoint(x: screenBounds.midX, y: screenBounds.minY)
  }
  
  class var screenLeft: CGPoint {
    return CGPoint(x: screenBounds.minX, y: screenBounds.midY)
  }
  
  class var screenBottom: CGPoint {
    return CGPoint(x: screenBounds.midX, y: screenBounds.maxY)
  }
}
