//
//  ViewController.swift
//  35-Seminar
//
//  Created by 한지석 on 8/5/24.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
  
  private let nicknameLabel: UILabel = {
    let label = UILabel()
    label.text = "게스트"
    label.font = .systemFont(ofSize: 14)
    return label
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "게스트"
    label.font = .systemFont(ofSize: 14)
    return label
  }()

  private let titleTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "제목을 입력해주세요."
    textField.clearButtonMode = .whileEditing
    textField.layer.borderColor = UIColor.gray.cgColor
    textField.layer.borderWidth = 1
    return textField
  }()

  private let contentTextView: UITextView = {
    let textView = UITextView()
    textView.font = .systemFont(ofSize: 14)
    textView.layer.borderColor = UIColor.gray.cgColor
    textView.layer.borderWidth = 1
    textView.layer.cornerRadius = 5
    return textView
  }()

  private lazy var nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("다음", for: .normal)
    button.backgroundColor = .tintColor
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    return button
  }()

  private lazy var pushModeToggleButton: UIButton = {
    let button = UIButton()
    button.setTitle("전환 모드 변경", for: .normal)
    button.backgroundColor = .tintColor
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
    return button
  }()

  private lazy var nicknameButton: UIButton = {
    let button = UIButton()
    button.setTitle("닉네임 설정하러 가기", for: .normal)
    button.setTitleColor(.tintColor, for: .normal)
    button.backgroundColor = .systemGray6
    button.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
    return button
  }()

  private var pushMode = true

  override func viewDidLoad() {
    super.viewDidLoad()
    setDelegate()
    setStyle()
    setUI()
    setLayout()
  }

  private func setDelegate() {
    titleTextField.delegate = self
  }

  private func setStyle() {
    self.view.backgroundColor = .white
    updateUI()
  }
  
  private func setUI() {
    [
      nicknameLabel,
      titleLabel,
      titleTextField,
      contentTextView,
      nextButton,
      pushModeToggleButton,
      nicknameButton
    ].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.view.addSubview($0)
    }
  }

  private func setLayout() {
    nicknameLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
      $0.centerX.equalToSuperview()
    }

    titleLabel.snp.makeConstraints {
      $0.top.equalTo(nicknameLabel.snp.bottom).offset(20)
      $0.centerX.equalToSuperview()
    }

    titleTextField.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
      $0.height.equalTo(40)
    }

    NSLayoutConstraint.activate(
      [
        nicknameLabel.topAnchor.constraint(
          equalTo: view.safeAreaLayoutGuide.topAnchor,
          constant: 20
        ),
        nicknameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        titleLabel.topAnchor.constraint(
          equalTo: nicknameLabel.bottomAnchor,
          constant: 20
        ),
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        titleTextField.topAnchor.constraint(
          equalTo: titleLabel.bottomAnchor,
          constant: 20
        ),
        titleTextField.leadingAnchor.constraint(
          equalTo: view.leadingAnchor,
          constant: 20
        ),
        titleTextField.trailingAnchor.constraint(
          equalTo: view.trailingAnchor,
          constant: -20
        ),
        titleTextField.heightAnchor.constraint(equalToConstant: 40),

        contentTextView.topAnchor.constraint(
          equalTo: titleTextField.bottomAnchor,
          constant: 20
        ),
        contentTextView.leadingAnchor.constraint(
          equalTo: view.leadingAnchor,
          constant: 20
        ),
        contentTextView.trailingAnchor.constraint(
          equalTo: view.trailingAnchor,
          constant: -20
        ),
        contentTextView.heightAnchor.constraint(
          equalToConstant: 200
        ),

        nextButton.topAnchor.constraint(
          equalTo: contentTextView.bottomAnchor,
          constant: 20
        ),
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        nextButton.heightAnchor.constraint(equalToConstant: 44),
        nextButton.widthAnchor.constraint(equalToConstant: 300),

        pushModeToggleButton.topAnchor.constraint(
          equalTo: nextButton.bottomAnchor,
          constant: 20
        ),
        pushModeToggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        pushModeToggleButton.heightAnchor.constraint(equalToConstant: 44),
        pushModeToggleButton.widthAnchor.constraint(equalToConstant: 300),
        
        nicknameButton.topAnchor.constraint(
          equalTo: pushModeToggleButton.bottomAnchor,
          constant: 20
        ),
        nicknameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        nicknameButton.heightAnchor.constraint(equalToConstant: 44),
        nicknameButton.widthAnchor.constraint(equalToConstant: 300),
      ]
    )
  }
  
  private func updateUI() {
    self.titleLabel.text = pushMode ? "네비게이션" : "모달"
  }
  
  @objc func nextButtonTapped() {
    transitionToNextViewController()
  }
  
  @objc func nicknameButtonTapped() {
    let nicknameViewController = NicknameViewController_Closure()
    nicknameViewController.completionHandler = { [weak self] nickname in
      guard let self else { return }
      self.nicknameLabel.text = nickname
    }
    self.navigationController?.pushViewController(nicknameViewController, animated: true)
  }

  private func transitionToNextViewController() {
    let nextViewController = DetailViewController()
    if let title = titleTextField.text, let content = contentTextView.text {
      nextViewController.dataBind(
        title: title,
        content: content
      )
    }
    if pushMode {
      self.navigationController?.pushViewController(
        nextViewController,
        animated: true
      )
    } else {
      self.present(
        nextViewController,
        animated: true
      )
    }
  }

  @objc func toggleButtonTapped() {
    self.pushMode.toggle()
    self.updateUI()
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return true
  }
}

extension ViewController: NicknameDelegate {
  func dataBind(nickname: String) {
    guard !nickname.isEmpty else { return }
    self.nicknameLabel.text = nickname
  }
}
