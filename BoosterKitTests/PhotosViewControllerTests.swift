//
//  PhotosViewControllerTests.swift
//  BoosterKitTests
//
//  Created by Travis Palmer on 10/21/16.
//  Copyright © 2016 Spartan. All rights reserved.
//

import XCTest
@testable import BoosterKit
import Quick
import Nimble
import RealmSwift
import Nocilla

class PhotosViewControllerSpecs: QuickSpec {
    override func spec() {
        LSNocilla.sharedInstance().start()
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        
        describe("initialization") {
            stubRequest("GET", "https://static.realm.io/update/cocoa?2.4.2" as LSMatcheable!)
            stubRequest("GET", "https://api.mixpanel.com/track".regex())
            
            let realm = try! Realm()
            try! realm.write {
                realm.create(Photo.self, value: ["id": 0, "title": "test photo", "thumbnailUrl": "http://test.com"])
                realm.create(Photo.self, value: ["id": 1, "title": "test photo 2", "thumbnailUrl": "http://test.com"])
                realm.create(Photo.self, value: ["id": 2, "title": "test photo 3", "thumbnailUrl": "http://test.com"])
            }
            
            let viewController = PhotosViewController(coder: concreteCoder())
            
            it("initializes photos") {
                expect(viewController!.photos.count).to(equal(3))
            }
        }
        
        LSNocilla.sharedInstance().stop()
    }
    
    fileprivate func concreteCoder() -> NSKeyedUnarchiver {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.finishEncoding()
        
        return NSKeyedUnarchiver(forReadingWith: data as Data)
    }
}