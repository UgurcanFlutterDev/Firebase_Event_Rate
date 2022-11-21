class AddEventRequestModel {
  String? title;
  String? subTitle;
  String? creator;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String? createdDate;
  String? description;

  AddEventRequestModel({
    this.title,
    this.subTitle,
    this.creator,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.createdDate,
    this.description,
  });

  AddEventRequestModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    creator = json['creator'];
    startDate = json['startDate'];
    startTime = json['startTime'];
    endDate = json['endDate'];
    endTime = json['endTime'];
    createdDate = json['createdDate'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['creator'] = creator;
    data['startDate'] = startDate;
    data['startTime'] = startTime;
    data['endDate'] = endDate;
    data['endTime'] = endTime;
    data['createdDate'] = createdDate;
    data['description'] = description;
    return data;
  }
}
