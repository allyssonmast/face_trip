import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GenerateDbFake {
  List<UserEntity> fakeUsers = [
    UserEntity(
        id: FirebaseAuth.instance.currentUser!.uid,
        email: "user1@example.com",
        name: "John Smith",
        description:
            "I love to travel and explore new places. There's nothing quite like experiencing new cultures and seeing the world.",
        isTraveled: "true",
        url:
            "https://randomuser.me/api/portraits/men/${Random().nextInt(100)}.jpg",
        listContact: [
          "contact1@example.com",
          "contact2@example.com",
        ]),
    UserEntity(
        id: "user_2",
        email: "user2@example.com",
        name: "Jane Doe",
        description:
            "I've been fortunate enough to travel to many different countries and see some amazing sights. I can't wait to plan my next adventure!",
        isTraveled: "false",
        url:
            "https://randomuser.me/api/portraits/women/${Random().nextInt(100)}.jpg",
        listContact: [
          "contact3@example.com",
          "contact4@example.com",
          FirebaseAuth.instance.currentUser!.email!
        ]),
    UserEntity(
        id: "user_3",
        email: "user3@example.com",
        name: "Bob Johnson",
        description:
            "Traveling is my passion. I've been to some incredible places and met some amazing people along the way.",
        isTraveled: "true",
        url: "https://randomuser.me/api/portraits/men/${Random().nextInt(100)}.jpg",
        listContact: ["contact5@example.com", "contact6@example.com"]),
    UserEntity(
        id: "user_4",
        email: "user4@example.com",
        name: "Alice Brown",
        description:
            "I believe that traveling is the best way to learn about the world and yourself. I can't wait to see where my next adventure takes me!",
        isTraveled: "false",
        url:
            "https://randomuser.me/api/portraits/women/${Random().nextInt(100)}.jpg",
        listContact: [
          "contact7@example.com",
          "contact8@example.com",
          FirebaseAuth.instance.currentUser!.email!
        ]),
    UserEntity(
        id: "user_5",
        email: "user5@example.com",
        name: "Peter Green",
        description:
            "There's nothing like the thrill of exploring a new place and discovering all that it has to offer. I'm always on the lookout for my next adventure.",
        isTraveled: "true",
        url: "https://randomuser.me/api/portraits/men/${Random().nextInt(100)}.jpg",
        listContact: ["contact9@example.com", "contact10@example.com"]),
    UserEntity(
        id: "user_6",
        email: "user6@example.com",
        name: "Karen White",
        description:
            "Traveling is my way of life. It's where I feel most alive and free. I can't wait to see where my next adventure takes me!",
        isTraveled: "false",
        url:
            "https://randomuser.me/api/portraits/women/${Random().nextInt(100)}.jpg",
        listContact: [
          "contact11@example.com",
          "contact12@example.com",
          FirebaseAuth.instance.currentUser!.email!
        ]),
    UserEntity(
        id: "user_7",
        email: "user7@example.com",
        name: "Michael Lee",
        description:
            "I've traveled to many different countries and experienced some amazing things. There's nothing quite like the feeling of being somewhere new.",
        isTraveled: "true",
        url: "https://randomuser.me/api/portraits/men/${Random().nextInt(100)}.jpg",
        listContact: ["contact13@example.com", "contact14@example.com"]),
    UserEntity(
        id: "user_8",
        email: "user8@example.com",
        name: "Samantha Brown",
        description:
            "Traveling is my passion. I love experiencing new cultures and trying new things. I can't wait to plan my next adventure!",
        isTraveled: "false",
        url:
            "https://randomuser.me/api/portraits/women/${Random().nextInt(100)}.jpg",
        listContact: [
          "contact15@example.com",
          "contact16@example.com",
          FirebaseAuth.instance.currentUser!.email!
        ]),
    UserEntity(
        id: "user_9",
        email: "user9@example.com",
        name: "David Kim",
        description:
            "I've been fortunate enough to travel to some incredible places and meet some amazing people. There's nothing quite like the feeling of being somewhere new.",
        isTraveled: "true",
        url:
            "https://randomuser.me/api/portraits/men/${Random().nextInt(100)}.jpg",
        listContact: [
          "contact17@example.com",
          "contact18@example.com",
          FirebaseAuth.instance.currentUser!.email!
        ]),
    UserEntity(
        id: "user_10",
        email: "user10@example.com",
        name: "Emily Chen",
        description:
            "Traveling is my escape. It's where I feel most alive and free. I can't wait to see where my next adventure takes me!",
        isTraveled: "false",
        url: "https://randomuser.me/api/portraits/women/${Random().nextInt(100)}.jpg",
        listContact: ["contact19@example.com", "contact20@example.com"]),
  ];
  Future<void> addFakeUsersToFirestore() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference usersCollection = firestore.collection('users');

    for (UserEntity user in fakeUsers) {
      Map<String, dynamic> userData = {
        "id": usersCollection.id,
        "email": user.email,
        "name": user.name,
        "description": user.description,
        "isTraveled": user.isTraveled,
        "url": user.url,
        "listContact": user.listContact,
      };
      await usersCollection.add(userData);
    }
  }
}
