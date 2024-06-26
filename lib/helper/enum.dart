enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}
enum PostType { Post, Detail, Reply, ParentTweet }

enum SortUser {
  ByVerified,
  ByAlphabetically,
  ByNewest,
  ByOldest,
  ByMaxFollower
}

enum NotificationType {
  NOT_DETERMINED,
  Message,
  Comment,
  Share,
  Follow,
  Mention,
  Like
}
