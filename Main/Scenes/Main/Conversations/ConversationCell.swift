//
//  ConversationCell.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 05/07/23.
//

import UIKit
import SnapKit
import SDWebImage

class ConversationCell: UITableViewCell {

  fileprivate let photoSize = 50.0
  fileprivate let notificationSize = 16.0

  lazy var stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.distribution = .fill
    stack.alignment = .center
    stack.spacing = 12.0
    return stack
  }()

  lazy var photo: UIImageView = {
    let imgView = UIImageView()
    imgView.contentMode = .scaleAspectFill
    imgView.layer.masksToBounds = true
    imgView.layer.cornerRadius = photoSize / 2

    return imgView
  }()

  lazy var nameAndMessage: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 8.0
    return stack
  }()

  lazy var name: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    return label
  }()

  lazy var lastMessage: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .caption1)
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 1
    return label
  }()

  lazy var notificationBadge: UILabel = {
    let counter = UILabel()
    counter.textColor = UIColor.white
    counter.textAlignment = .center

    counter.font = UIFont.preferredFont(forTextStyle: .caption1)
    counter.layer.cornerRadius = notificationSize / 2
    counter.layer.borderWidth = 3.0
    counter.layer.masksToBounds = true
    counter.layer.backgroundColor = UIColor.tintColor.cgColor
    counter.layer.borderColor = UIColor.tintColor.cgColor

    return counter
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(imageURL: URL?, name: String, lastMessage: String, numberOfUnreadMessages: Int) {
    photo.sd_setImage(
      with: imageURL,
      placeholderImage: UIImage(systemName: "person.crop.circle.fill"))

    self.name.text = name
    self.lastMessage.text = lastMessage

    if numberOfUnreadMessages <= 0 {
      notificationBadge.isHidden = true
    } else {
      notificationBadge.text = "\(numberOfUnreadMessages)"
    }
  }
}

extension ConversationCell: ViewCodable {
  func setupLayout() {
    backgroundColor = .secondarySystemBackground
  }

  func setupSubviews() {
    addSubview(stackView)

    nameAndMessage.addArrangedSubview(name)
    nameAndMessage.addArrangedSubview(lastMessage)

    stackView.addArrangedSubview(photo)
    stackView.addArrangedSubview(nameAndMessage)
    stackView.addArrangedSubview(notificationBadge)
  }

  func setupConstraints() {
    stackView.snp.makeConstraints { make in
      make.edges.equalTo(self).inset(24)
    }

    photo.snp.makeConstraints { make in
      make.size.equalTo(CGSize(width: photoSize, height: photoSize))
    }

    notificationBadge.snp.makeConstraints { make in
      make.size.equalTo(CGSize(width: notificationSize, height: notificationSize))
    }
  }

  func additionalConfigurations() {}
}
