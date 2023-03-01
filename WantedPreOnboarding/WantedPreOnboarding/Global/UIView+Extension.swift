//
//  UIView+Extension.swift
//  WantedPreOnboarding
//
//  Created by 박의서 on 2023/03/01.
//

import UIKit

extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach { self.addSubview($0) }
  }
  
  func addArrangedSubviews (_ views: UIView...) {
    views.forEach { self.addArrangedSubviews($0) }
  }
}
