//
//  ConstraintAnimationsViewController.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 18.02.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class ConstraintAnimationsViewController: UIViewController {
  
  // MARK: Storyboard outlets
  @IBOutlet weak var welcomeLabel: UILabel!
  @IBOutlet weak var newsletterView: UIView!
  @IBOutlet weak var welcomeCenterX: NSLayoutConstraint!
  @IBOutlet weak var newsletterCenterX: NSLayoutConstraint!
  
  // MARK: Additional variables
  var newsletterInfoLabel = UILabel()
  var animManager: AnimationManager!
  
  // MARK: Appearance
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // MARK: View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Programmatic views
    newsletterInfoLabel.backgroundColor = .clear
    newsletterInfoLabel.text = "Help us make your animation code that much better by subscribing to our weekly newsletter! \n\n It's free and you can unsubscribe any time without hurting our feelings...much."
    newsletterInfoLabel.font = UIFont(name: "Bodoni 72 Oldstyle", size: 15)
    newsletterInfoLabel.textColor = .darkGray
    newsletterInfoLabel.textAlignment = .left
    newsletterInfoLabel.alpha = 1
    newsletterInfoLabel.backgroundColor = .black
    newsletterInfoLabel.translatesAutoresizingMaskIntoConstraints = false
    newsletterInfoLabel.numberOfLines = 0
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // TODO: Offscreen positioning
    animManager = AnimationManager(activeConstraints: [welcomeCenterX, newsletterCenterX])
//    welcomeCenterX.constant -= AnimationManager.screenBounds.width
//    newsletterCenterX.constant -= AnimationManager.screenBounds.width
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    // TODO: Fire initial animations
    animateViewsOnScreen()
  }
  
  // MARK: Actions
  @IBAction func infoOnButtonPressed(_ sender: Any) {
    animateNewsletterHeight()
  }
  
  // MARK: Animations
  func animateViewsOnScreen() {
    UIView.animate(withDuration: 1.5,
                   delay: 0.25,
                   usingSpringWithDamping: 0.8,
                   initialSpringVelocity: 0,
                   options: [.curveEaseInOut], animations: {
//                    self.welcomeCenterX.constant += AnimationManager.screenBounds.width
//                    self.newsletterCenterX.constant += AnimationManager.screenBounds.width
                    self.welcomeCenterX.constant = self.animManager.constraintOrigins[0]
                    self.newsletterCenterX.constant =  self.animManager.constraintOrigins[1]
                    self.view.layoutIfNeeded()
    }, completion: nil)
  }
  
  func animateNewsletterHeight() {
    if let heightConstraint = newsletterView.returnConstraint(withID: "NewsLetterHeight") {
      print(heightConstraint.description)
      heightConstraint.constant = 350
    } else {
      print("No constraint fonud for ID...")
    }
    
    UIView.animate(withDuration: 1.75,
                   delay: 0,
                   usingSpringWithDamping: 0.7,
                   initialSpringVelocity: 0,
                   options: [], animations: {
                    self.view.layoutIfNeeded()
    }) { completed in
      
    }
  }
}

extension UIView {
  func returnConstraint(withID: String) -> NSLayoutConstraint? {
    var constraintSearch: NSLayoutConstraint!
    
    for constraint in self.constraints {
      if constraint.identifier == withID {
        constraintSearch = constraint
      }
    }
    
    return constraintSearch
  }
}
