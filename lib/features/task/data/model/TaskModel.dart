
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String id;
  final String title;
  final String des;
  final String date;
  bool? isdone;
  bool? isdel;
  bool? isfav;

  TaskModel(
      {required this.id,
      required this.title,
      required this.des,
      required this.date,
      this.isfav,
      this.isdel,
      this.isdone}) {
    isdone = isdone ?? false;
    isdel = isdel ?? false;
    isfav = isfav ?? false;
  }

  TaskModel copywith({
    String? id,
    String? title,
    String? des,
    String? date,
    bool? isdone,
    bool? isdel,
    bool? isfav,
  }) {
    return TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        des: des ?? this.des,
        date: date ?? this.date,
        isdone: isdone ?? this.isdone,
        isdel:isdel ?? this.isdel,
      isfav: isfav??this.isfav
        );
  }

  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      'id': id,
      'title': title,
      'des': des,
      'date': date,
      'isdone': isdone,
      'isdel': isdel,
      'isfav': isfav,
    };
  }
  factory TaskModel.fromMap(Map<String,dynamic>map){
    return TaskModel(
      id: map['id'] as String,
      title: map['title'] as String,
      des: map['des'] as String,
      date: map['date'] as String,
      isdone: map['isdone'] != null ? map['isdone'] as bool : null,
      isdel: map['isdel'] != null ? map['isdel'] as bool : null,
      isfav: map['isfav'] != null ? map['isfav'] as bool : null,
    );
  }

  @override
  
  List<Object?> get props => [id,
    title,
     des,
     date,
     isdone,
     isdel,
    isfav];

}
