part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status requestSatuts;
  final List<CategoryModel> listOfCategories;
  final String errorMeassge;

  const HomeState({
    this.requestSatuts = Status.loading,
    this.listOfCategories = const [],
    this.errorMeassge = "",
  });

  HomeState copyWith({
    Status? requestSatuts,
    List<CategoryModel>? listOfCategories,
    String? errorMeassge,
  }) =>
      HomeState(
        requestSatuts: requestSatuts ?? this.requestSatuts,
        listOfCategories: listOfCategories ?? this.listOfCategories,
        errorMeassge: errorMeassge ?? this.errorMeassge,
      );

  @override
  List<Object> get props => [
        requestSatuts,
        listOfCategories,
        errorMeassge,
      ];
}
