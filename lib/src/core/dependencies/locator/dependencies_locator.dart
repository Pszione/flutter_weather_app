import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

import '../../../imports.dart';

GetIt get locator => GetIt.instance;

class DependenciesLocator {
  static GetIt get locator => GetIt.instance;
  static const uidGenerator = Uuid();

  static String get getUid => uidGenerator.v4().replaceAll('-', '');

  static const appName = 'Weather App';

  /// Initializes the Dependencies Locator
  static Future<void> initLocator() async {
    locator.allowReassignment = true;

    await dependencyRegisterServices();
    //
    await dependencyDB();
    await dependencyRegisterDatasources();
    await dependencyRegisterRepositories();
    await dependencyRegisterGlobalProviders();
  }

  ///
  static Future<void> dependencyRegisterServices() async {
    locator.registerLazySingleton<IHttpClient>(
        () => DioHttpClient(DioFactory.getCustomDioInstance()));
    // locator.registerLazySingleton<LocationService>(() => LocationServiceImpl());
    return;
  }

  static Future<void> dependencyDB() async {
    // throw UnimplementedError();
    // TODO: Firebase.initializeApp();
    return;
  }

  static Future<void> dependencyRegisterDatasources() async {
    // locator.registerLazySingleton<IAuthDatasource>(() => AuthDatasourceImpl());
    locator
        .registerLazySingleton<ISignInDatasource>(() => SignInDatasourceStub());
    locator
        .registerLazySingleton<ISignUpDatasource>(() => SignUpDatasourceStub());
  }

  static Future<void> dependencyRegisterRepositories() async {
    // locator.registerLazySingleton<IAuthRepository>(() => AuthRepository());
    locator.registerLazySingleton<ISignInRepository>(
        () => SignInRepository(locator()));
    locator.registerLazySingleton<ISignUpRepository>(
        () => SignUpRepository(locator()));
  }

  static Future<void> dependencyRegisterGlobalProviders() async {
    // throw UnimplementedError();
    // TODO: AuthStore();
    return;
  }
}
