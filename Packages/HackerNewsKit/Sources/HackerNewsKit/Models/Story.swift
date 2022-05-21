import Foundation

/// An item that represents a Hacker News story.
public struct Story: Item {
    // MARK: - Item

    /// The unique identifier of the story.
    public let id: Int

    /// Whether the story has been deleted.
    public let isDeleted: Bool

    /// The type of the story.
    public var type: ItemType { .story }

    /// The username of the story's author.
    public let author: String

    /// When this story was created/posted.
    public let createdAt: Date

    /// The content of the story.
    ///
    /// > Note: The `text` property is in the HTML format.
    public let text: String

    /// Whether this story is `dead`.
    ///
    /// Indicates that this post was killed by software, user flags, or moderator action.
    public let isDead: Bool

    /// A list of the story's descendants (comments).
    ///
    /// The descendants are sorted in the ranked display order.
    public let childrenIds: [Int]

    /// The URL location of the story.
    public let url: URL

    /// The number of votes for this story.
    public let score: Int

    /// The title of the story.
    ///
    /// The title is in HTML format.
    public let title: String

    /// The number of comments for this story.
    public let commentCount: Int
}
