class ExpenseModel {
  String? displayName;
  int? seqNo;
  int? id;
  String? userId;
  String? createdOn;
  String? updatedOn;

  ExpenseModel(
      {this.displayName,
      this.seqNo,
      this.id,
      this.userId,
      this.createdOn,
      this.updatedOn});

  ExpenseModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    seqNo = json['seqNo'];
    id = json['id'];
    userId = json['userId'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['seqNo'] = seqNo;
    data['id'] = id;
    data['userId'] = userId;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}
