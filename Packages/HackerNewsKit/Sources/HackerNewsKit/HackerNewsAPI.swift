import Foundation

/// A client for the Hacker News API.
///
/// This client is an interface that provides methods for fetching data from the Hacker News API.
///
/// The official Hacker News API is limited in functionality, therefore for more ways of interacting
/// with the Hacker News platform, _consider using a different approach_.
public actor HackerNewsAPI {
    /// The configuration details that describe the API behaves.
    public let configuration: Configuration

    /// The underlying `URLSession` that coordinates the network requests.
    private let session: URLSession

    /// Creates a new instance of `HackerNewsAPI`.
    ///
    /// - Parameter configuration:
    public init(configuration: Configuration = .default) {
        self.configuration = configuration
        self.session = URLSession(configuration: configuration.sessionConfiguration)
    }
}

// MARK: - Endpoints

extension HackerNewsAPI {
    /// Fetches an item identified by the given `id` from the Hacker News API.
    ///
    /// - Parameter id: The identifier of the item to fetch.
    /// - Returns: The item identified by the given `id`.
    /// - Throws: An error if the item could not be fetched, or if the received data is invalid.
    public func item<T: Item>(id: Int) async throws -> T {
        let request = URLRequest(url: configuration.host.appendingPathComponent("item/\(id).json"))

        let (data, response) = try await session.data(for: request)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let item = try JSONDecoder().decode(T.self, from: data)

        return item
    }
}

// MARK: - Configuration

extension HackerNewsAPI {
    /// A configuration object that contains the information about how to configure the API.
    public struct Configuration {
        /// The base URL of the Hacker News API.
        let host: URL

        /// The session configuration to use when creating the underlying `URLSession`.
        let sessionConfiguration: URLSessionConfiguration

        /// Creates a new configuration instance.
        ///
        /// - Parameters:
        ///   - host: The base URL of the Hacker News API.
        ///   - sessionConfiguration: The configuration to use when creating the underlying session.
        public init(host: URL, sessionConfiguration: URLSessionConfiguration = .default) {
            self.host = host
            self.sessionConfiguration = sessionConfiguration
        }
    }
}

// MARK: Default Configuration

extension HackerNewsAPI.Configuration {
    /// A default configuration object.
    public static let `default` = HackerNewsAPI.Configuration(
        host: URL(string: "https://hacker-news.firebaseio.com/v0/")!
    )
}
