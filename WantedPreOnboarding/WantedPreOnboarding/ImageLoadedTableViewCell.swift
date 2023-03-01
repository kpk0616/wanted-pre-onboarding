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
  // MARK: - UI Components
  
  private let tableCellimageView = UIImageView()
  private let progressBar = UIProgressView().then {
    $0.progress = 0.5
  }
  private let tableCellButton = UIButton().then {
    $0.layer.cornerRadius = 10
    $0.backgroundColor = .systemBlue
    $0.setTitle("Load", for: .normal)
  }
  private let progressView = UIView()
  private let buttonView = UIView()
  private lazy var tableCellStackView = UIStackView(arrangedSubviews: [tableCellimageView, progressBar, tableCellButton]).then {
    $0.axis = .horizontal
//    $0.spacing = 0
  }
}

extension ImageLoadedTableViewCell {
  private func setLayout() {
    contentView.backgroundColor = .clear
    contentView.addSubviews(tableCellStackView)
    tableCellStackView.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  func imageDataBind(model: ImageLoadedModel) {
    tableCellimageView.image = UIImage(named: model.image)
  }
}
