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
  
  // MARK: - Variables
  private let imageList = []
  
  // MARK: - UI Components
  
  private let imageTableView = UITableView().then {
    $0.backgroundColor = .clear
    $0.separatorStyle = .none
    $0.delegate = self
    $0.dataSource = self
  }
  
  private lazy var loadImageButton = UIButton().then {
    $0.layer.cornerRadius = 10
    $0.backgroundColor = .systemBlue
    $0.setTitle("Load All Images", for: .normal)
    $0.addTarget(self, action: #selector(loadImage), for: .touchUpInside)
  }
  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setLayout()
  }
}

// MARK: - TableView

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    imageList.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let restStopCell = tableView.dequeueReusableCell(
      withIdentifier: RestStopLocationTableViewCell.identifier, for: indexPath)
            as? RestStopLocationTableViewCell else { return UITableViewCell() }
    
    restStopCell.restStopDataBind(model: imageList[indexPath.row])
    return restStopCell
  }
}

// MARK: - Extension

extension ViewController {
  // MARK: - Layout
  
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
  // MARK: - Extra functions
  
  @objc
  private func loadImage() {
    print("load image")
  }
}
