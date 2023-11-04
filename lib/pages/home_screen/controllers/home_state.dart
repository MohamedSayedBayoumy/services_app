part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String errorMeassge;
  final Status requestSatuts;
  final List<dynamic> listOfCachedData;
  final List<CategoryModel> listOfCategories;

  const HomeState({
    this.errorMeassge = "",
    this.listOfCategories = const [],
    this.listOfCachedData = const [],
    this.requestSatuts = Status.loading,
  });

  HomeState copyWith({
    String? errorMeassge,
    Status? requestSatuts,
    List<dynamic>? listOfCachedData,
    List<CategoryModel>? listOfCategories,
  }) =>
      HomeState(
        errorMeassge: errorMeassge ?? this.errorMeassge,
        requestSatuts: requestSatuts ?? this.requestSatuts,
        listOfCachedData: listOfCachedData ?? this.listOfCachedData,
        listOfCategories: listOfCategories ?? this.listOfCategories,
      );

  @override
  List<Object> get props => [
        errorMeassge,
        requestSatuts,
        listOfCachedData,
        listOfCategories,
      ];
}
