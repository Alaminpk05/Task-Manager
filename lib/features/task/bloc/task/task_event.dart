part of 'task_bloc.dart';

@immutable
abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class TabEvent extends TaskEvent{
   final index;
  TabEvent( {required this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
class AddTask extends TaskEvent {
  final TaskModel task;

  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final TaskModel task;

  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class RemoveTask extends TaskEvent {
  final TaskModel task;

  const RemoveTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final TaskModel task;

  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class MarkFavoriteOrUnFavoriteTask extends TaskEvent {
  final TaskModel task;

  const MarkFavoriteOrUnFavoriteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class EditTask extends TaskEvent {
  final TaskModel oldTask;
  final TaskModel newTask;

  const EditTask({
    required this.oldTask,
    required this.newTask,
  });

  @override
  List<Object> get props => [
    oldTask,
    newTask,
  ];
}

class RestoreTask extends TaskEvent {
  final TaskModel task;
  const RestoreTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteAllTasks extends TaskEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}


