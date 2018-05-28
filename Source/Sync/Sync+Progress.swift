//
//  Sync+Progress.swift
//  Sync
//
//  Created by T. van Es on 22/05/2018.
//

import Foundation

enum SyncProgressType: String {
    case update = "update"
    case insert = "insert"
    case delete = "delete"
}

public extension ProgressUserInfoKey {
    static let syncProgressUpdateKey = ProgressUserInfoKey(rawValue: "update")
    static let syncProgressInsertKey = ProgressUserInfoKey(rawValue: "insert")
    static let syncProgressDeleteKey = ProgressUserInfoKey(rawValue: "delete")
}

extension Progress {
    
    func completedUnitCountFor(_ type: SyncProgressType) {
        var count: Int64 = self.userInfo[ProgressUserInfoKey.init(type.rawValue)] as? Int64 ?? 0
        self.setUserInfoObject(count + 1, forKey: ProgressUserInfoKey.init(type.rawValue))
        self.completedUnitCount += 1
    }
}
