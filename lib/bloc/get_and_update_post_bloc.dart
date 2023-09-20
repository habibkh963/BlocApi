import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Data/DataProviders.dart';
import '../Data/model/Posts.dart';

part 'get_and_update_post_event.dart';
part 'get_and_update_post_state.dart';

class GetAndUpdatePostBloc
    extends Bloc<GetAndUpdatePostEvent, GetAndUpdatePostState> {
  final DataProviders dataProviders;
  GetAndUpdatePostBloc(this.dataProviders) : super(GetAndUpdatePostInitial()) {
    on<GetAllPostEvent>((event, emit) async {
      emit(LoadingState());
      try {
        List<Posts> posts = await dataProviders.get_Posts();
        emit(LoadedgState(posts: posts));
      } catch (e) {
        emit(ErrorGetState(msg: e.toString()));
      }
    });
    on<UpdatePostEvent>((event, emit) async {
      emit(GetAndUpdatePostInitial());
      try {
        int res = await dataProviders.update_Post_put(event.post);
        emit(UpdatedState(id: res));
      } catch (e) {
        emit(ErrorGetState(msg: e.toString()));
      }
    });
  }
}
