//
//  LiverpoolTests.swift
//  LiverpoolTests
//
//  Created by Abbe on 2022-11-22.
//

import XCTest
@testable import Liverpool

final class LiverpoolTests: XCTestCase {

    func testplayerAPI() async throws{
        let player = PlayerManager()
        player.getPlayers()
        sleep(1)

        let count = try await player.players?.teams.count
        XCTAssertEqual(count, 20)
        
    }
   
    func testStandingsAPI() async throws{
        let standingsManager = StandingsManager.shared
        standingsManager.loadData()
        sleep(1)
        
        let count = try await standingsManager.standings.count
        XCTAssertEqual(count, 20)
    }
    
   func testGetIndex() async throws {
        let player = PlayerManager()
        player.getPlayers()
        sleep(1)

        let something = "Arsenal"
       let index = try await player.getIndex(Something: something)
        XCTAssertEqual(index, 0)
        
    }
    
    func testChangeTeamsShortName() async throws {
        let player = PlayerManager()
        player.getPlayers()
        sleep(1)
        player.getIndex(Something: "")
        
        let shortName = "Manchester City"
        let name = try await player.players?.teams[6].shortName
        XCTAssertEqual(shortName, name)
        
    }

    

}
    

    



