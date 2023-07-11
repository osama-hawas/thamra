part of 'bloc.dart';

class FAQsModel {

  late final List<FAQsData> data;
  late final String status;
  late final String message;

  FAQsModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>FAQsData.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }


}

class FAQsData {

  late final int id;
  late final String question;
  late final String answer;

  FAQsData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }


}