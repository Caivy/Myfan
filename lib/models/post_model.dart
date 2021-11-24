import 'models.dart';

class Post {
  final UserModel user;
  final String caption;
  final String timeAgo;
  final String imageUrl;
  final int likes;
  final int comments;

  Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
  });
}
