import 'package:equatable/equatable.dart';

class Category extends Equatable{
  late final String title;
  late final List<String>? selections;

  Category({required this.title, this.selections});

  Category.fromJson(Map<String, dynamic> json){
    title = json['title'];
    selections = List.castFrom<dynamic, String>(json['selections']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = {};
    _data['title'] = title;
    _data['selections'] = selections;
    return _data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, selections,];
}