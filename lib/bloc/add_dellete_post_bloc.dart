import 'package:bloc/bloc.dart';
import 'package:blocapi/Data/DataProviders.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../Data/model/Posts.dart';

part 'add_dellete_post_event.dart';
part 'add_dellete_post_state.dart';

class AddDelletePostBloc
    extends Bloc<AddDelletePostEvent, AddDelletePostState> {
  final DataProviders _dataProviders;
  AddDelletePostBloc(this._dataProviders) : super(AddDelletePostInitial()) {
    on<AddPostEvent>((event, emit) async {
      emit(AddDelletePostInitial());
      try {
        await _dataProviders.add_post(event.post);
        emit(SuccessfullyState());
      } catch (e) {
        emit(ErrorState(msg: e.toString()));
      }
    });
    on<DeletePost>((event, emit) async {
      emit(AddDelletePostInitial());
      try {
        await _dataProviders.delete(event.id);
        emit(SuccessfullyState());
      } catch (e) {
        emit(ErrorState(msg: e.toString()));
      }
    });
  }
}
