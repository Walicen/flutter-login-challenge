import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import '../../core/routes/routes.dart';
import 'forgot_pass/presenter/cubit/forgot_pass_cubit.dart';
import 'forgot_pass/presenter/ui/forgot_pass_page.dart';
import 'login/data/datasources/login_datasource.dart';
import 'login/data/repositories/login_repository_impl.dart';
import 'login/domain/repositories/login_repository.dart';
import 'login/domain/usecases/login_usecase.dart';
import 'login/external/login_datasource_impl.dart';
import 'login/presenter/cubit/login_cubit.dart';
import 'login/presenter/ui/login_page.dart';
import 'sign_up/data/datasources/sign_up_datasource.dart';
import 'sign_up/data/repository/sign_up_repository_impl.dart';
import 'sign_up/domain/repositories/sign_up_repository.dart';
import 'sign_up/domain/usecases/sign_up.dart';
import 'sign_up/external/datasource/sign_up_datasource_impl.dart';
import 'sign_up/presenter/cubit/sign_up_cubit.dart';
import 'sign_up/presenter/ui/sign_up_page.dart';
import 'splash/presenter/cubit/splash_screen_cubit.dart';
import 'splash/presenter/ui/splash_screen_page.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton(SplashScreenCubit.new);

    i.add<LoginDatasource>(LoginDatasourceImpl.new);
    i.add<LoginRepository>(LoginRepositoryImpl.new);
    i.add<LoginUseCase>(LoginUseCaseImpl.new);
    i.addSingleton(LoginCubit.new);

    i.add<SignUpDatasource>(SignUpDatasourceImpl.new);
    i.add<SignUpRepository>(SignUpRepositoryImpl.new);
    i.add<SignUpUseCase>(SignUpUseCaseImpl.new);
    i.addSingleton(SignUpCubit.new);

    i.addSingleton(ForgotPassCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => BlocProvider.value(
        value: Modular.get<SplashScreenCubit>(),
        child: const SplashScreenPage(),
      ),
    );
    r.child(
      AppRoutes.login,
      child: (_) => BlocProvider.value(
        value: Modular.get<LoginCubit>(),
        child: const LoginPage(),
      ),
    );
    r.child(
      AppRoutes.signUp,
      child: (_) => BlocProvider.value(
        value: Modular.get<SignUpCubit>(),
        child: const SignUpPage(),
      ),
    );
    r.child(
      AppRoutes.forgotPassword,
      child: (_) => BlocProvider.value(
        value: Modular.get<ForgotPassCubit>(),
        child: const ForgotPassPage(),
      ),
    );
  }
}
