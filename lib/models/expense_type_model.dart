import 'package:expenses/models/expense_model.dart';

class ExpenseTypeModel {
  String? displayName;
  int? seqNo;
  List<ExpenseModel>? expenses;
  int? id;
  String? userId;
  String? createdOn;
  String? updatedOn;

  ExpenseTypeModel(
      {this.displayName,
      this.seqNo,
      this.expenses,
      this.id,
      this.userId,
      this.createdOn,
      this.updatedOn});

  ExpenseTypeModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    seqNo = json['seqNo'];
    expenses = json['expenses'];
    id = json['id'];
    userId = json['userId'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['seqNo'] = seqNo;
    data['expenses'] = expenses;
    data['id'] = id;
    data['userId'] = userId;
    data['createdOn'] = createdOn;
    data['updatedOn'] = updatedOn;
    return data;
  }
}
