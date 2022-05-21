import XCTest
@testable import HackerNewsKit

struct TestItem: Item {
    var id: Int
    var type: ItemType
    var score: Int
    var commentCount: Int
}

final class ItemTests: XCTestCase {
    func testItemTypeCodable() {
        struct SimpleCodableItem: Codable {
            var type: ItemType
        }

        func confirmCodable(_ type: ItemType) {
            do {
                let data = try JSONEncoder().encode(SimpleCodableItem(type: type))
                let decoded = try JSONDecoder().decode(SimpleCodableItem.self, from: data)
                XCTAssertEqual(decoded.type, type)
            } catch {
                XCTFail("Failed to encode/decode ItemType: \(error)")
            }
        }

        confirmCodable(.job)
        confirmCodable(.story)
        confirmCodable(.comment)
        confirmCodable(.poll)
        confirmCodable(.pollopt)
    }

    func testItemDefaultValues() {
        let item = TestItem(id: 1, type: .story, score: 1, commentCount: 1)
        XCTAssertFalse(item.isDeleted)
        XCTAssertNil(item.author)
        XCTAssertNil(item.createdAt)
        XCTAssertNil(item.text)
        XCTAssertFalse(item.isDead)
        XCTAssertNil(item.parentID)
        XCTAssertNil(item.pollID)
        XCTAssertNil(item.childrenIDs)
        XCTAssertNil(item.url)
        XCTAssertNil(item.title)
        XCTAssertNil(item.pollOptionIDs)
    }

    func testItemEquatable() {
        let item1 = TestItem(id: 1, type: .story, score: 1, commentCount: 1)
        let item2 = TestItem(id: 1, type: .story, score: 1, commentCount: 1)
        XCTAssertEqual(item1, item2)
    }

    func testItemNotEquatable() {
        let item1 = TestItem(id: 1, type: .story, score: 1, commentCount: 1)
        let item2 = TestItem(id: 2, type: .story, score: 1, commentCount: 1)
        XCTAssertNotEqual(item1, item2)
    }

    func testItemHashable() {
        let item1 = TestItem(id: 1, type: .story, score: 1, commentCount: 1)
        let item2 = TestItem(id: 1, type: .story, score: 1, commentCount: 1)
        XCTAssertEqual(item1.hashValue, item2.hashValue)
    }

    func testItemNotHashable() {
        let item1 = TestItem(id: 1, type: .story, score: 1, commentCount: 1)
        let item2 = TestItem(id: 2, type: .story, score: 1, commentCount: 1)
        XCTAssertNotEqual(item1.hashValue, item2.hashValue)
    }
}
