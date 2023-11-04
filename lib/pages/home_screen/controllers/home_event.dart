part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetRemoteCategoriesEvent extends HomeEvent {}

class GetLocalCategoriesEvent extends HomeEvent {
  final String failureMessage;

  const GetLocalCategoriesEvent({required this.failureMessage});
}
