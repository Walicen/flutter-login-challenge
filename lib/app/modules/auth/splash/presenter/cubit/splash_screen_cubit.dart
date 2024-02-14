import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(const SplashScreenInitial());

  void init() async {
    // Simulate a delay to show the splash screen
    await Future.delayed(const Duration(seconds: 1));
    emit(const SplashScreenLoading(width: 200, height: 300));

    await Future.delayed(const Duration(seconds: 2), () {
      emit(const SplashScreenLoaded(width: 200, height: 300));
    });
  }
}
