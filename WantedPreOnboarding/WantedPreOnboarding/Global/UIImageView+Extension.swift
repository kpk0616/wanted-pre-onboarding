//
//  UIImageView+Extension.swift
//  WantedPreOnboarding
//
//  Created by 박의서 on 2023/03/02.
//

import UIKit

extension UIImageView {
  func load(url: URL) {
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
    }
  }
}
