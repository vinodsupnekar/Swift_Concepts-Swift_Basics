//
//  Configuration.swift
//  Configurations
//
//  Created by Rjvi on 18/03/23.
//

import Foundation

enum Configuration: String {

    // MARK: - Configurations

    case staging
    case production
    case release

    // MARK: - Current Configuration

    static let current: Configuration = {
        guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("No Configuration Found")
        }
        guard let configuration = Configuration(rawValue: rawValue.lowercased()) else {
                    fatalError("Invalid Configuration")
                }

                return configuration
    }()

    static var baseURL: URL {
            switch current {
            case .staging:
                return URL(string: "https://staging.cocoacasts.com")!
            case .production, .release:
                return URL(string: "https://cocoacasts.com")!
            }
        }
    
    struct SmallRectangle {
        private var _height = TwelveOrLess()
        private var _width = TwelveOrLess()
        var height: Int {
            get { return _height.wrappedValue }
            set { _height.wrappedValue = newValue }
        }
        var width: Int {
            get { return _width.wrappedValue }
            set { _width.wrappedValue = newValue }
        }
    }

}
