// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_dellete_post_bloc.dart';

@immutable
sealed class AddDelletePostEvent extends Equatable {}

class AddPostEvent extends AddDelletePostEvent {
  final Posts post;
  AddPostEvent({
    required this.post,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DeletePost extends AddDelletePostEvent {
  final int id;
  DeletePost({
    required this.id,
  });
  @override
  List<Object?> get props => [id];
}
