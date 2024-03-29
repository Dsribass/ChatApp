//
//  SceneViewController.swift
//  Main
//
//  Created by Daniel de Souza Ribas on 08/12/22.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  let bag = DisposeBag()

  let onTryAgainSubject = PublishSubject<Void>()
  var onTryAgain: Observable<Void> { onTryAgainSubject }
}

class SceneViewController<View: UIView>: ViewController, ViewCodable {
  var contentView: View { view as! View }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  override func loadView() {
    self.view = View()
  }

  func setupLayout() {}

  func setupSubviews() {}

  func setupConstraints() {}

  func additionalConfigurations() {}
}
