//
//  Photo.swift
//  35-Seminar
//
//  Created by 한지석 on 8/20/24.
//

import UIKit

struct Photo: Hashable {
  let id = UUID()
  let image: UIImage
  var isLiked: Bool
}

extension Photo {
  static let mockData: [Photo] = [
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
  ]
  static let mockDataSectionDetail: [Photo] = [
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
    Photo(image: UIImage(resource: .image1), isLiked: false),
    Photo(image: UIImage(resource: .image2), isLiked: false),
    Photo(image: UIImage(resource: .image3), isLiked: false),
    Photo(image: UIImage(resource: .image4), isLiked: false),
  ]
}
