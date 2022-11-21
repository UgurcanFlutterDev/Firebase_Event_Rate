import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventrate/features/auth-features/login/model/user_model.dart';

class EventModel {
  String? createdDate;
  String? creator;
  String? endDate;
  String? endTime;
  String? imageUrl;
  String? startDate;
  String? startTime;
  String? subTitle;
  String? title;
  String? description;
  User? user;

  EventModel(
      {this.createdDate,
      this.creator,
      this.endDate,
      this.endTime,
      this.imageUrl,
      this.startDate,
      this.startTime,
      this.subTitle,
      this.title,
      this.description,
      this.user});

  EventModel.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    creator = json['creator'];
    endDate = json['endDate'];
    endTime = json['endTime'];
    imageUrl = json['imageUrl'];
    startDate = json['startDate'];
    startTime = json['startTime'];
    subTitle = json['subTitle'];
    title = json['title'];
    description = json['description'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdDate'] = createdDate;
    data['creator'] = creator;
    data['endDate'] = endDate;
    data['endTime'] = endTime;
    data['imageUrl'] = imageUrl;
    data['startDate'] = startDate;
    data['startTime'] = startTime;
    data['subTitle'] = subTitle;
    data['title'] = title;
    data['description'] = description;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  factory EventModel.fromDocument(DocumentSnapshot doc) {
    return EventModel(
      createdDate: doc['createdDate'] ?? '',
      title: doc['title'] ?? '',
      description: doc['description'] ?? "",
      creator: doc['creator'] ?? "",
      endDate: doc['endDate'] ?? "",
      endTime: doc['endTime'] ?? "",
      imageUrl: doc['imageUrl'] ?? "",
      startDate: doc['startDate'] ?? "",
      startTime: doc['startTime'] ?? "",
      subTitle: doc['subTitle'] ?? "",
      user: User.fromJson(doc['user'] ?? ""),
    );
  }
}
