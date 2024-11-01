//
//  App.swift
//  35-Seminar
//
//  Created by 한지석 on 8/19/24.
//

import UIKit

enum AppCategory {
  case social
  case entertainment
  case travel
  case sports
}

enum DownloadState {
  case installed
  case download
  case reDownload
  case update

  var title: String {
    switch self {
    case .installed:
      "열기"
    case .download:
      "다운로드"
    case .reDownload:
      "다시다운"
    case .update:
      "업데이트"
    }
  }
}

struct App {
  let iconImage: UIImage
  let ranking: Int
  let title: String
  let subTitle: String
  let downloadState: DownloadState
  let category: AppCategory
}

extension App {
  static let mockData: [App] = [
    App(
      iconImage: UIImage(systemName: "person")!,
      ranking: 1,
      title: "당근",
      subTitle: "당신 근처의 지역 생활 커뮤니티",
      downloadState: .update,
      category: .social
    ),
    App(
      iconImage: UIImage(systemName: "person")!,
      ranking: 2,
      title: "라인 LINE",
      subTitle: "소셜 네트워킹",
      downloadState: .download,
      category: .social
    ),
    App(
      iconImage: UIImage(systemName: "person")!,
      ranking: 3,
      title: "네이버 카페 - Naver Cafe",
      subTitle: "소셜 네트워킹",
      downloadState: .download,
      category: .social
    ),
    App(
      iconImage: UIImage(systemName: "person")!,
      ranking: 4,
      title: "카카오톡",
      subTitle: "모든 연결의 시작",
      downloadState: .installed,
      category: .social
    ),
    App(
      iconImage: UIImage(systemName: "person")!,
      ranking: 5,
      title: "Facebook",
      subTitle: "좋아하는 것을 살펴보세요",
      downloadState: .installed,
      category: .social
    ),
    App(
      iconImage: UIImage(systemName: "person")!,
      ranking: 6,
      title: "Discord - 대화, 플레이, 어울리기",
      subTitle: "재미와 게임을 위한 그룹 채팅",
      downloadState: .installed,
      category: .social
    ),
    App(
      iconImage: UIImage(systemName: "person")!,
      ranking: 7,
      title: "에브리타임",
      subTitle: "함께하는 대학생활",
      downloadState: .update,
      category: .social
    ),

    App(
      iconImage: UIImage(systemName: "person")!,
      ranking: 8,
      title: "Google Meet",
      subTitle: "영상 통화 및 회의",
      downloadState: .reDownload,
      category: .social
    )
  ]
}
