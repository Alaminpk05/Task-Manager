import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskmanager/features/task/bloc/task/task_state.dart';
import 'package:taskmanager/features/task/data/model/TaskModel.dart';

part 'task_event.dart';


class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super( const TaskState()) {
    hydrate();
    // on<TabEvent>(_tabEvent);
    on<AddTask>(_onAddTask);
     on<UpdateTask>(_onUpdateTask);
     on<DeleteTask>(_onDeleteTask);
     on<RemoveTask>(_onRemoveTask);
     on<MarkFavoriteOrUnFavoriteTask>(_onMarkFavoriteOrUnFavoriteTask);
     on<EditTask>(_onEditTask);
     on<RestoreTask>(_onRestoreTask);
     on<DeleteAllTasks>(_onDeleteAllTask);
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
      removedTasks: state.removedTasks,
    ));

  }




  // FutureOr<void> _tabEvent(TabEvent event, Emitter<TaskState> emit) {
  //   emit(TaskState(
  //      pendingTasks: state.pendingTasks,
  //     completedTasks: state.completedTasks,
  //     favoriteTasks: state.favoriteTasks,
  //     removedTasks: state.removedTasks,
  //   ));
  // }

  FutureOr<void> _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) {
    emit(TaskState(

      pendingTasks: List.from(state.pendingTasks)..remove(event.task),
      removedTasks: List.from(state.removedTasks)..add(event.task.copywith(isdel: true)),
      completedTasks:List.from( state.completedTasks)..remove(event.task),
      favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),

    ));

  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    emit(TaskState(
      removedTasks: List.from(state.removedTasks)..remove(event.task),
      pendingTasks: (state.pendingTasks),
      completedTasks:( state.completedTasks),
      favoriteTasks: (state.favoriteTasks),



    ));
  }

  FutureOr<void> _onDeleteAllTask(DeleteAllTasks event, Emitter<TaskState> emit) async{
    emit(TaskState(
      removedTasks: List.from(state.removedTasks)..clear(),
      pendingTasks: state.pendingTasks,
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
    ));
  }

  FutureOr<void> _onRestoreTask(RestoreTask event, Emitter<TaskState> emit) {

    emit(TaskState(
      removedTasks: List.from(state.removedTasks)..remove(event.task),
      pendingTasks: List.from(state.pendingTasks)..add(event.task.copywith(isdel: false)),
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
    ));

  }

  FutureOr<void> _onEditTask(EditTask event, Emitter<TaskState> emit) {
    emit(TaskState(
      pendingTasks: List.from(state.pendingTasks)..remove(event.oldTask)
          ..insert(0, event.newTask),
      completedTasks: List.from(state.completedTasks)..remove(event.oldTask),
      favoriteTasks: state.favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    List<TaskModel> compeltedTask=state.completedTasks ;
    List<TaskModel> pendingTask=state.pendingTasks ;
    List<TaskModel> fav=state.favoriteTasks ;
    if(event.task.isdone==false){
      if(event.task.isfav==false){
         pendingTask=state.pendingTasks..remove(event.task);
        compeltedTask=List.from(state.completedTasks)..insert(0,event.task.copywith(isdone: true));
      }
      else{
        var index=state.favoriteTasks.indexOf(event.task);
        pendingTask= state.pendingTasks..remove(event.task);
        compeltedTask=List.from(state.completedTasks)..insert(0,event.task.copywith(isdone: true));
        fav=List.from(fav)..remove(event.task)..insert(index, event.task.copywith(isdone: true));
      }
    }
    else{
      if(event.task.isfav==false){
        pendingTask=List.from(state.pendingTasks)..insert(0,event.task.copywith(isdone: false));
        compeltedTask=List.from(state.completedTasks)..remove(event.task);
      }
      else{
        var index=state.favoriteTasks.indexOf(event.task);
        emit(TaskState(
          pendingTasks: state.pendingTasks..insert(0,event.task.copywith(isdone: false)),
          completedTasks: state.completedTasks..remove(event.task),
          favoriteTasks: state.favoriteTasks..remove(event.task)..insert(index, event.task.copywith(isdone: false)),

        ));
      }
    }
    emit(TaskState(
      pendingTasks: pendingTask,
      completedTasks: compeltedTask,
      favoriteTasks:fav,
      removedTasks: state.removedTasks,
    ));
  }

  FutureOr<void> _onMarkFavoriteOrUnFavoriteTask(MarkFavoriteOrUnFavoriteTask event, Emitter<TaskState> emit) {

    List<TaskModel> compeltedTask=state.completedTasks ;
    List<TaskModel> pendingTask=state.pendingTasks ;
    List<TaskModel> fav=state.favoriteTasks ;
    List<TaskModel> remove=state.removedTasks;

    if(event.task.isdone==false){
      if(event.task.isfav==false){
        var index=pendingTask.indexOf(event.task);
        fav=List.from(state.favoriteTasks)..insert(0, event.task.copywith(isfav: true));
        pendingTask=List.from(pendingTask)..remove(event.task)..insert(index, event.task.copywith(isfav: true));

      }else{
        var index=pendingTask.indexOf(event.task);
        fav=List.from(fav)..remove(event.task);
        pendingTask=List.from(pendingTask)..remove(event.task)..insert(index,
            event.task.copywith(isfav: false));
      }
    }else{
      var comindex=compeltedTask.indexOf(event.task);
      if(event.task.isfav==false){
        compeltedTask=List.from(compeltedTask)..remove(event.task)..insert(comindex,
            event.task.copywith(isfav: true));
        fav=List.from(fav)..insert(0, event.task.copywith(isfav: true));


      }
      else
        {
          emit(TaskState(
            completedTasks: List.from(compeltedTask)..remove(event.task)..insert(comindex,
                event.task.copywith(isfav: false)),
            favoriteTasks: List.from(fav)..remove(event.task),
            pendingTasks: state.pendingTasks,
          ));



        }
    }
    emit(TaskState(
      pendingTasks: pendingTask,
      completedTasks: compeltedTask,favoriteTasks: fav,removedTasks:remove
    ));
    
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return TaskState(

      pendingTasks: List<TaskModel>.from(json['pendingTasks'].map<TaskModel>((x) => TaskModel.fromMap(x as Map<String,dynamic>),),),
      completedTasks: List<TaskModel>.from(json['completedTasks'].map<TaskModel>((x) => TaskModel.fromMap(x as Map<String,dynamic>),),),
      favoriteTasks: List<TaskModel>.from(json['favoriteTasks'].map<TaskModel>((x) => TaskModel.fromMap(x as Map<String,dynamic>),),),
      removedTasks: List<TaskModel>.from(json['removedTasks'].map<TaskModel>((x) => TaskModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return <String, dynamic>{

      'pendingTasks': state.pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': state.completedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': state.favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': state.removedTasks.map((x) => x.toMap()).toList(),
    };
  }
}

