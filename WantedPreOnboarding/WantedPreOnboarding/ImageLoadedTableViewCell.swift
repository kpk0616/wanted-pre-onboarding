//
//  ImageLoadedTableViewCell.swift
//  WantedPreOnboarding
//
//  Created by 박의서 on 2023/03/01.
//

import UIKit
import Then
import SnapKit

final class ImageLoadedTableViewCell: UITableViewCell {
  // MARK: - Init
  
  static let identifier = "ImageLoadedTableViewCell"
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Variables
  private var imageURL = ""
  
  // MARK: - UI Components
  
  private let imageViewsView = UIView()
  private let progressView = UIView()
  private let buttonView = UIView()
  private let tableCellimageView = UIImageView().then {
    $0.image = UIImage(systemName: "photo")
    $0.image?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
  }
  private let progressBar = UIProgressView().then {
    $0.progress = 0.5
  }
  private lazy var tableCellButton = UIButton().then {
    $0.layer.cornerRadius = 5
    $0.backgroundColor = .systemBlue
    $0.setTitle("Load", for: .normal)
    $0.addTarget(self, action: #selector(touchUpLoadButton), for: .touchUpInside)
  }
  private lazy var tableCellStackView = UIStackView(arrangedSubviews: [imageViewsView, progressView, buttonView]).then {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .horizontal
    $0.alignment = .center
    $0.distribution = .fillProportionally
  }
}

extension ImageLoadedTableViewCell {
  private func setLayout() {
    contentView.addSubviews(tableCellStackView)
    imageViewsView.addSubviews(tableCellimageView)
    progressView.addSubviews(progressBar)
    buttonView.addSubviews(tableCellButton)
    tableCellStackView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
    imageViewsView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalToSuperview()
      $0.width.equalTo(100)
    }
    progressView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalTo(imageViewsView.snp.trailing)
      $0.width.equalTo(200)
    }
    buttonView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalTo(progressView.snp.trailing)
      $0.trailing.equalToSuperview()
    }
    tableCellimageView.snp.makeConstraints {
      $0.width.equalTo(90)
      $0.height.equalTo(70)
      $0.center.equalToSuperview()
    }
    progressBar.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(5)
      $0.centerY.equalToSuperview()
    }
    tableCellButton.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(40)
      $0.centerY.equalToSuperview()
    }
  }
  
  func imageDataBind(model: ImageLoadedModel) {
    imageURL = model.image
  }
  
  @objc
  private func touchUpLoadButton() {
    print("touch up load")
    DispatchQueue.main.async { [weak self] in
      self?.tableCellimageView.image = UIImage(systemName: "photo")
    }
    tableCellimageView.load(url: URL(string: imageURL)!)
  }
}
