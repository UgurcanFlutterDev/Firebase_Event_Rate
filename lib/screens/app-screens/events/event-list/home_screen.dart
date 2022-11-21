import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventrate/features/app-features/events/models/events/event-list/event_model.dart';
import 'package:eventrate/features/auth-features/login/controller/login_controller.dart';
import 'package:eventrate/screens/app-screens/events/event-details/event_detailst_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<LoginController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<LoginController>()) {
      Get.put(LoginController());
    }
    return Scaffold(
      appBar: AppBar(title: Text("eventListTitle".tr)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection("events").orderBy('createdDate', descending: false).snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text("Organizasyon Bulunmamaktadır.");
            }
            final List<EventModel> list = snapshot.data!.docs.map((e) => EventModel.fromDocument(e)).toList();
            inspect(list);
            return ListView.separated(
              itemCount: list.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => EventDetailsScreen(
                          event: list[index],
                        ));
                  },
                  child: Ink(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(colors: [
                          Colors.purple.shade300,
                          Colors.blue,
                        ], stops: [
                          0.2,
                          1,
                        ])),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            list[index].imageUrl ?? "",
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].title ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              list[index].subTitle ?? "",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
