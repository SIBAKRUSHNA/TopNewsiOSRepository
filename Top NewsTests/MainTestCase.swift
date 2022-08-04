//
//  MainTestCase.swift
// MainTestCase
//
//  Created by Siba Krushna on 04/08/22.
//

import XCTest
@testable import Top_News
class MainTestCase: XCTestCase {
    var mainViewController: MainViewController?
    override func setUpWithError() throws {
        configureViewController()
    }
    override func tearDownWithError() throws {
        mainViewController = nil
    }
    private func configureViewController() {
        mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        mainViewController?.loadViewIfNeeded()
    }
    func testViewControllerExists() {
        XCTAssertNotNil(mainViewController, "MainViewController does not exist")
    }
    func testNewsTableViewOutletAdded() {
        let notificationTableView: UITableView? = mainViewController?.newsTableView
        XCTAssertNotNil(notificationTableView,"MainViewController does not have newsTableView property")
    }
    func testNewsTableViewHasDelegate() {
        XCTAssertNotNil(mainViewController?.newsTableView.delegate)
    }
    func testNewsTableViewHasDataSource() {
        XCTAssertNotNil(mainViewController?.newsTableView.dataSource)
    }
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(((mainViewController?.conforms(to: UITableViewDataSource.self)) != nil))
        XCTAssertTrue(((mainViewController?.responds(to: #selector(mainViewController?.newsTableView.tableView(_:numberOfRowsInSection:)))) != nil))
        XCTAssertTrue(((mainViewController?.responds(to: #selector(mainViewController?.newsTableView.tableView(_:cellForRowAt:)))) != nil))
    }
    func testTableViewConformsToTableViewDelegateProtocol() {
        XCTAssertTrue(((mainViewController?.conforms(to: UITableViewDelegate.self)) != nil))
        XCTAssertTrue(((mainViewController?.responds(to: #selector(mainViewController?.newsTableView.tableView(_:numberOfRowsInSection:)))) != nil))
    }
}
