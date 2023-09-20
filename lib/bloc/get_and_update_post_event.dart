// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_and_update_post_bloc.dart';

@immutable
sealed class GetAndUpdatePostEvent {}

class GetAllPostEvent extends GetAndUpdatePostEvent {}

class UpdatePostEvent extends GetAndUpdatePostEvent {
  final Posts post;
  UpdatePostEvent({
    required this.post,
  });
}
