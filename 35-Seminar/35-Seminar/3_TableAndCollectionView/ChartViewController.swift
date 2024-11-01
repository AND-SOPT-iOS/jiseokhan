//
//  ChartsViewController.swift
//  35-Seminar
//
//  Created by 한지석 on 8/19/24.
//

import UIKit

import SnapKit
import Then

class ChartViewController: UIViewController {

  private let tableView = UITableView()
  private let appList = App.mockData

  override func viewDidLoad() {
    super.viewDidLoad()
    print(#function)
    setStyle()
    setUI()
    setLayout()
  }


  private func setStyle() {
    view.backgroundColor = .gray
    tableView.do {
      $0.register(
        ChartCell.self,
        forCellReuseIdentifier: ChartCell.identifier
      )
      $0.rowHeight = 120
      $0.delegate = self
      $0.dataSource = self
    }
  }

  private func setUI() {
    view.addSubview(tableView)
  }

  private func setLayout() {
    tableView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.bottom.horizontalEdges.equalToSuperview()
    }
  }

  private func setTableView() {
    
  }
}
extension ChartViewController: UITableViewDelegate { }
extension ChartViewController: UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return appList.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: ChartCell.identifier,
      for: indexPath
    ) as? ChartCell else { return UITableViewCell() }
    cell.configure(app: appList[indexPath.row])
    return cell
  }
}
