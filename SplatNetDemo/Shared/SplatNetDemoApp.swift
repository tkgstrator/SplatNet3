//
//  SplatNetDemoApp.swift
//  Shared
//
//  Created by devonly on 2022/08/18.
//

import SwiftUI
import RealmSwift

@main
struct SplatNetDemoApp: SwiftUI.App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let configuration: Realm.Configuration = Realm.Configuration(schemaVersion: 1, deleteRealmIfMigrationNeeded: false)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.realmConfiguration, configuration)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print(NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])

        return true
    }
}
