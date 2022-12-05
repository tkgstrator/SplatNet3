//
//  RealmService.swift
//  SplatNetDemo
//
//  Created by devonly on 2022/11/27.
//

import Foundation
import RealmSwift

3
import SwiftUI

public actor RealmService: ObservableObject {
    @Environment(\.realm) var realm

    private init() {}
    public static let shared: RealmService = RealmService()

    public func deleteAll() {
        realm.beginWrite()
        realm.deleteAll()
        try? realm.commitWrite()
    }

    public func imports(contentsOf url: URL) throws {
    }

    public func exports() throws -> URL {
        let encoder: JSONEncoder = {
            let encoder: JSONEncoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            encoder.dateEncodingStrategy = .iso8601
            return encoder
        }()
        let schedules: RealmSwift.Results<RealmCoopSchedule> = realm.objects(RealmCoopSchedule.self)
        let fileName: String = {
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyymmddHHMMss"
            return formatter.string(from: Date())
        }()
        do {
            let data: Data = try encoder.encode(schedules)
            guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                throw fatalError()
            }
            let path: URL = dir.appendingPathComponent(fileName).appendingPathExtension("json")
            // データ書き込み
            try data.write(to: path, options: .atomic)
            return path
        } catch(let error) {
            SwiftyLogger.error(error.localizedDescription)
            throw error
        }
    }

    public func save(_ objects: [Object]) {
        if realm.isInWriteTransaction {
            objects.forEach({ object in
                realm.add(object)
            })
        } else {
            realm.beginWrite()
            objects.forEach({ object in
                if let _ = object.objectSchema.primaryKeyProperty {
                    realm.add(object, update: .error)
                }
                realm.add(object)
            })
            try? realm.commitWrite()
        }
    }

    public func save(_ results: [CoopResult]) {
        let schedules: Set<CoopResult.Schedule> = Set(results.map({ $0.schedule }))

        schedules.forEach({ schedule in
            let results: [RealmCoopResult] = results.filter({ $0.schedule == schedule }).map({ RealmCoopResult(content: $0) })
            let schedule: RealmCoopSchedule = RealmCoopSchedule(content: schedule)
            realm.beginWrite()
            // 存在しなかったら書き込む
            if !realm.objects(RealmCoopSchedule.self).contains(schedule) {
                realm.add(schedule)
                schedule.results.append(objectsIn: results)
            }
            try? realm.commitWrite()
        })
    }
}
