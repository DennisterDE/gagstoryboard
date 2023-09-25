//
//  gagstoryboardTests.swift
//  gagstoryboardTests
//
//  Created by Denis Istvan Varga on 2023. 09. 20..
//

import XCTest
@@testable import gagstoryboard

final class gagstoryboardTests: XCTestCase {

    let vc = PostListViewController()
    vc.getPosts(postType: .hot)
}
