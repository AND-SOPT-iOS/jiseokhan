//
//  PhotoViewControllerWithDiffableDataSource.swift
//  35-Seminar
//
//  Created by 한지석 on 10/18/24.
//

import UIKit

enum PhotoSection: CaseIterable {
  case main
}

class PhotoViewControllerWithDiffableDataSource: UIViewController {
  
  private lazy var collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout()
  )
  private var photoList: [Photo] = Photo.mockData
  private var dataSource: UICollectionViewDiffableDataSource<Section, Photo>!
  
  enum Section {
    case main
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setCollectionView()
    setStyle()
    setUI()
    setLayout()
    configureDataSource()
    applySnapshot()
  }
  
  private func setStyle() {
    // Style 설정
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
      $0.backgroundColor = .black
      $0.setCollectionViewLayout(flowLayout, animated: false)
      $0.register(
        PhotoCell.self,
        forCellWithReuseIdentifier: PhotoCell.identifier
      )
    }
  }
  
  //public typealias CellProvider = (
  //  _ collectionView: UICollectionView,
  //  _ indexPath: IndexPath,
  //  _ itemIdentifier: ItemIdentifierType
  //) -> UICollectionViewCell?
  
  private func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Photo>(collectionView: collectionView) { collectionView, indexPath, photo in
      guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: PhotoCell.identifier,
        for: indexPath
      ) as? PhotoCell else {
        return UICollectionViewCell()
      }
      cell.bind(photo)
      cell.likeButtonAction = { [weak self] in
        guard let self = self else { return }
        self.photoList[indexPath.item].isLiked.toggle()
        applySnapshot()
      }
      return cell
    }
  }
  
  private func applySnapshot() {
    let filtered = self.photoList.sorted { $0.isLiked && !$1.isLiked }
    var snapshot = NSDiffableDataSourceSnapshot<Section, Photo>()
    snapshot.appendSections([.main])
    snapshot.appendItems(filtered, toSection: .main)
    self.dataSource.apply(snapshot, animatingDifferences: true)
  }
}
