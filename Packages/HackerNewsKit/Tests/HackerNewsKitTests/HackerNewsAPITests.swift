import Mocker
import XCTest
@testable import HackerNewsKit

final class HackerNewsAPITests: XCTestCase {
    func testDefaultConfiguration() {
        let configuration = HackerNewsAPI.Configuration(host: URL(string: "https://example.com")!)
        XCTAssertEqual(configuration.host, URL(string: "https://example.com")!)
        XCTAssertEqual(configuration.sessionConfiguration, .default)
    }

    func testCustomConfiguration() {
        let configuration = HackerNewsAPI.Configuration(
            host: URL(string: "https://example.com")!, sessionConfiguration: .ephemeral
        )
        XCTAssertEqual(configuration.host, URL(string: "https://example.com")!)
        XCTAssertEqual(configuration.sessionConfiguration, .ephemeral)
    }

    func testItem() async {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockingURLProtocol.self]

        let api = HackerNewsAPI(
            configuration: .init(host: URL(string: "https://example.com")!, sessionConfiguration: configuration)
        )

        do {
            let story: Story = try await api.item(id: 1)
            XCTAssertEqual(story.id, 1)
            XCTAssertEqual(story.type, .story)
            XCTAssertEqual(story.score, 1)
            XCTAssertEqual(story.commentCount, 1)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
