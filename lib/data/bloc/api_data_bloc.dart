import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'api_data_event.dart';
part 'api_data_state.dart';

class ApiDataBloc extends Bloc<ApiDataEvent, ApiDataState> {
  ApiDataBloc() : super(ApiDataInitial()) {
    on<ApiDataEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
