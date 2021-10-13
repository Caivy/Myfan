import 'package:myfan/models/models.dart';

final User currentUser = User(
  name: "Caivy",
  imageUrl:
      "https://yt3.ggpht.com/ytc/AKedOLQY07jau1eidwc45lN3hDU-dL7m6nD-U4HdpW-0vg=s88-c-k-c0x00ffffff-no-rj",
);

final List<User> onlineUsers = [
  User(
      name: "David",
      imageUrl:
          "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=386&q=80"),
  User(
      name: "Jane Doe",
      imageUrl:
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"),
  User(
      name: "Blacky",
      imageUrl:
          "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80"),
];

final List<Post> posts = [
  Post(
      user: currentUser,
      caption: "I love food",
      timeAgo: "Oct 1",
      imageUrl:
          "https://images.unsplash.com/photo-1629214831443-8d162235cf57?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80",
      likes: 50,
      comments: 10),
  Post(
      user: onlineUsers[0],
      caption: "What an amazing place right ?",
      timeAgo: "Oct 1",
      imageUrl:
          "https://images.unsplash.com/photo-1633441098723-bfaee25878c0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80",
      likes: 1002,
      comments: 800),
];
