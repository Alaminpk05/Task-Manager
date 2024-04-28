
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> with HydratedMixin {
  SwitchBloc() : super(SwitchState()) {
    hydrate();
    on<SwitchonEvent>((event, emit) {
      emit(SwitchState(switchvalue: true));
    });
    on<SwitchoffEvent>((event, emit) {
      emit(SwitchState(switchvalue: false));
    });
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState(switchvalue: json['switchvalue']);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    // TODO: implement toJson
    return {
      'switchvalue': state.switchvalue,
    };
  }
}
