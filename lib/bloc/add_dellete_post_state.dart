// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_dellete_post_bloc.dart';

@immutable
sealed class AddDelletePostState extends Equatable {}

final class AddDelletePostInitial extends AddDelletePostState {
  @override
  List<Object?> get props => [];
}

class SuccessfullyState extends AddDelletePostState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends AddDelletePostState {
  final String msg;
  ErrorState({
    required this.msg,
  });
  @override
  List<Object?> get props => [msg];
}
