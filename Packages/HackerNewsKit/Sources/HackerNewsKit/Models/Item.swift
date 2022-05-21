import Foundation

/// An item that represents a Hacker News content unit.
///
/// Items are the core unit that represents content within the Hacker News platform.
/// They share a common set of properties that describe their type and their content.
///
/// *Stories, comments, jobs, Ask HNs and even polls are just items.* - [Hacker News API](https://github.com/HackerNews/API)
public protocol Item: Identifiable, Hashable, Codable {
    /// The unique identifier of the item.
    var id: ID { get }

    /// Whether the item has been deleted.
    var isDeleted: Bool { get }

    /// The type of the item.
    var type: ItemType { get }

    /// The username of the item's author.
    var author: String? { get }

    /// When this item was created/posted.
    var createdAt: Date? { get }

    /// The content of the item.
    ///
    /// Depending on the type of the item, this may be a comment, a story, or a poll text.
    ///
    /// > Note: The `text` property is in the HTML format.
    var text: String? { get }

    /// Whether this item is `dead`.
    ///
    /// Indicates that this post was killed by software, user flags, or moderator action.
    var isDead: Bool { get }

    /// The identifier of the item's parent.
    ///
    /// If the item is a top-level item, its parent identifier is `nil`.
    var parentID: ID? { get }

    /// The identifier of the poll associated with this item.
    ///
    /// If the item is not a `ItemType.poll`, its poll identifier is `nil`.
    var pollID: ID? { get }

    /// A list of the item's descendants (comments).
    ///
    /// The descendants are sorted in the ranked display order.
    var childrenIDs: [ID]? { get }

    /// The URL location of the item.
    ///
    /// If the item is a not a `ItemType.story`, its URL is `nil`.
    var url: URL? { get }

    /// The item's score, or the number of votes for this item.
    var score: Int { get }

    /// The title of the item.
    ///
    /// Represents the title of the `ItemType.story`, `ItemType.poll`, or `ItemType.pollopt`.
    ///
    /// The title is in HTML format.
    var title: String? { get }

    /// A list of related `ItemType.pollopt` item identifiers.
    ///
    /// The poll options are sorted in ranked display order.
    var pollOptionIDs: [ID]? { get }

    /// The number of comments for this item.
    var commentCount: Int { get }
}

extension Item {
    /// The username of the item's author.
    public var author: String? { nil }

    /// Whether the item has been deleted.
    public var isDeleted: Bool { false }

    /// When this item was created/posted.
    public var createdAt: Date? { nil }

    /// The content of the item.
    ///
    /// Depending on the type of the item, this may be a comment, a story, or a poll text.
    ///
    /// > Note: The `text` property is in the HTML format.
    public var text: String? { nil }

    /// Whether this item is `dead`.
    ///
    /// Indicates that this post was killed by software, user flags, or moderator action.
    public var isDead: Bool { false }

    /// The identifier of the item's parent.
    ///
    /// If the item is a top-level item, its parent identifier is `nil`.
    public var parentID: ID? { nil }

    /// The identifier of the poll associated with this item.
    ///
    /// If the item is not a `ItemType.poll`, its poll identifier is `nil`.
    public var pollID: ID? { nil }

    /// A list of the item's descendants (comments).
    ///
    /// The descendants are sorted in the ranked display order.
    public var childrenIDs: [ID]? { nil }

    /// The URL location of the item.
    ///
    /// If the item is a not a `ItemType.story`, its URL is `nil`.
    public var url: URL? { nil }

    /// The title of the item.
    ///
    /// Represents the title of the `ItemType.story`, `ItemType.poll`, or `ItemType.pollopt`.
    ///
    /// The title is in HTML format.
    public var title: String? { nil }

    /// A list of related `ItemType.pollopt` item identifiers.
    ///
    /// The poll options are sorted in ranked display order.
    public var pollOptionIDs: [ID]? { nil }
}

// MARK: - ItemType

/// A type of an ``Item``.
public enum ItemType: String, Codable, CaseIterable {
    case job
    case story
    case comment
    case poll
    case pollopt
}
