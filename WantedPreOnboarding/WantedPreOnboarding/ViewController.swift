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
  private let imageList: [ImageLoadedModel] = [ImageLoadedModel(image: "https://res.cloudinary.com/demo/image/upload/sample.jpg"),ImageLoadedModel(image: "https://res.cloudinary.com/demo/basketball_shot.jpg"),ImageLoadedModel(image: "https://demo-res.cloudinary.com/image/upload/w_300/ltepu4mm0qzw6lkfxt1m.jpg"),ImageLoadedModel(image: "https://picsum.photos/id/119/3264/2176"),ImageLoadedModel(image: "https://picsum.photos/id/12/2500/1667")]
  
  // MARK: - UI Components
  
  private lazy var imageTableView = UITableView().then {
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
    register()
  }
  
  private func register() {
    imageTableView.register(ImageLoadedTableViewCell.self, forCellReuseIdentifier: ImageLoadedTableViewCell.identifier)
  }
}

// MARK: - TableView

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    imageList.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let imageLoadedCell = tableView.dequeueReusableCell(
      withIdentifier: ImageLoadedTableViewCell.identifier, for: indexPath)
            as? ImageLoadedTableViewCell else { return UITableViewCell() }
    imageLoadedCell.imageDataBind(model: imageList[indexPath.row])
    return imageLoadedCell
  }
}

// MARK: - Extension

extension ViewController {
  // MARK: - Layout
  
  private func setLayout() {
    view.backgroundColor = .white
    view.addSubviews(imageTableView, loadImageButton)
    imageTableView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
      $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
      $0.height.equalTo(imageList.count * 70)
    }
    loadImageButton.snp.makeConstraints {
      $0.top.equalTo(imageTableView.snp.bottom).offset(20)
      $0.centerX.equalToSuperview()
      $0.leading.trailing.equalToSuperview().inset(10)
      $0.height.equalTo(45)
    }
  }
  // MARK: - General functions

  @objc
  private func loadImage() {
    print("load image")
  }
}
