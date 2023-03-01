//
//  ViewController.swift
//  WantedPreOnboarding
//
//  Created by 박의서 on 2023/03/01.
//

import UIKit
import SnapKit
import Then

final class ViewController: UIViewController {
  
  // MARK: - UI Components
  
  private let imageTableView = UITableView()
  
  private let loadImageButton = UIButton().then {
    $0.layer.cornerRadius = 10
    $0.backgroundColor = .systemBlue
    $0.setTitle("Load All Images", for: .normal)
  }
  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setLayout()
  }
}

extension ViewController {
  private func setLayout() {
    view.backgroundColor = .white
    view.addSubviews(loadImageButton)
    loadImageButton.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
      $0.centerX.equalToSuperview()
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalTo(45)
    }
  }
}
