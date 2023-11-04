import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/utils/enum.dart';
import '../../../model/models/category_models.dart';
import '../../../model/repositroy_paterrn/local_data_home.dart';
import '../../../model/repositroy_paterrn/remote_data_home.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.remoteHomeData,
    this.localHomeData,
  ) : super(const HomeState()) {
    on<GetRemoteCategoriesEvent>(_getRemoteCategoriesEvent);
    on<GetLocalCategoriesEvent>(_getLocalCategoriesEvent);
  }

  final GetRemoteHomeData remoteHomeData;
  final GetLocalHomeData localHomeData;

  Future<FutureOr<void>> _getRemoteCategoriesEvent(
      GetRemoteCategoriesEvent event, Emitter<HomeState> emit) async {
    final result = await remoteHomeData.getCategories();

    result.fold((l) async {
      add(GetLocalCategoriesEvent(
        failureMessage: l.errorMessage.toString(),
      ));
    }, (r) {
      emit(
        state.copyWith(
          requestSatuts: Status.loaded,
          listOfCategories: r,
        ),
      );
    });
  }

  Future<FutureOr<void>> _getLocalCategoriesEvent(
      GetLocalCategoriesEvent event, Emitter<HomeState> emit) async {
    final result = await localHomeData.localCategories();

    result.fold(
        (l) => {
              emit(
                state.copyWith(
                  requestSatuts: Status.failure,
                  errorMeassge: event.failureMessage.toString(),
                ),
              )
            },
        (r) => {
              emit(
                state.copyWith(
                  requestSatuts: Status.failureWithcachedData,
                  errorMeassge: event.failureMessage.toString(),
                  listOfCachedData: r,
                ),
              )
            });
  }
}
