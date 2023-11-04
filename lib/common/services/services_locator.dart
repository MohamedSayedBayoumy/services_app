import 'package:get_it/get_it.dart';
import 'package:services_app/pages/home_screen/controllers/home_bloc.dart';

import '../../model/repositroy_paterrn/local_data_home.dart';
import '../../model/repositroy_paterrn/remote_data_home.dart';

final sl = GetIt.asNewInstance();

class ServicesLocator {
  ServicesLocator();

  static void service() {
    sl.registerFactory<HomeBloc>(() => HomeBloc(sl(), sl()));

    sl.registerFactory<GetRemoteHomeData>(
      () => FetchRemoteHomeData(),
    );

    sl.registerFactory<GetLocalHomeData>(
      () => FetchLocalHomeData(),
    );
  }
}
