//
//  PhotoViewController.swift
//  35-Seminar
//
//  Created by 한지석 on 8/20/24.
//

import UIKit

import SnapKit
import Then

class PhotoViewController: UIViewController {

  private lazy var collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout()
  )
  private var photoList: [Photo] = Photo.mockData

  override func viewDidLoad() {
    super.viewDidLoad()
    setCollectionView()
    setStyle()
    setUI()
    setLayout()
  }

  private func setStyle() {
    
  }

  private func setUI() {
    view.addSubview(collectionView)
  }

  private func setLayout() {
    collectionView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.bottom.horizontalEdges.equalToSuperview()
    }
  }

  private func setCollectionView() {
    let flowLayout = UICollectionViewFlowLayout()
    let itemSize = (UIScreen.main.bounds.width - 6) / 3
    flowLayout.itemSize = .init(width: itemSize, height: itemSize)
    flowLayout.minimumLineSpacing = 3
    flowLayout.minimumInteritemSpacing = 3

    collectionView.do {
      $0.backgroundColor = .gray
      $0.setCollectionViewLayout(flowLayout, animated: false)
      $0.register(
        PhotoCell.self,
        forCellWithReuseIdentifier: PhotoCell.identifier
      )
      $0.delegate = self
      $0.dataSource = self
    }
  }
}

extension PhotoViewController: UICollectionViewDelegate { }
extension PhotoViewController: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return photoList.count
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let item = collectionView.dequeueReusableCell(
      withReuseIdentifier: PhotoCell.identifier,
      for: indexPath
    ) as? PhotoCell else {
      return UICollectionViewCell()
    }
    item.bind(photoList[indexPath.row])
    item.likeButtonAction = { [weak self] in
      guard let self else { return }
      self.photoList[indexPath.row].isLiked.toggle()
      self.updatePhoto(photoList[indexPath.row])
    }
    return item
  }

  private func updatePhoto(_ photo: Photo) {
    if let index = photoList.firstIndex(where: { $0.id == photo.id }) {
      photoList[index] = photo
      photoList.sort { $0.isLiked && !$1.isLiked }
      collectionView.reloadData()
    }
  }
}
