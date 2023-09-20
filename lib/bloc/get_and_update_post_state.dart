// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_and_update_post_bloc.dart';

@immutable
sealed class GetAndUpdatePostState {}

final class GetAndUpdatePostInitial extends GetAndUpdatePostState {}

class LoadingState extends GetAndUpdatePostState {}

class LoadedgState extends GetAndUpdatePostState {
  final List<Posts> posts;
  LoadedgState({
    required this.posts,
  });
}

class ErrorGetState extends GetAndUpdatePostState {
  final String msg;
  ErrorGetState({
    required this.msg,
  });
}

class UpdatedState extends GetAndUpdatePostState {
  final int id;
  UpdatedState({
    required this.id,
  });
}
