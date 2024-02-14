part of 'splash_screen_cubit.dart';

sealed class SplashScreenState extends Equatable {
  final double width;
  final double height;
  const SplashScreenState({this.width = 0.0, this.height = 0.0});

  @override
  List<Object> get props => [width, height];
}

final class SplashScreenInitial extends SplashScreenState {
  const SplashScreenInitial();
}

final class SplashScreenLoading extends SplashScreenState {
  const SplashScreenLoading({super.width, super.height});
}

final class SplashScreenLoaded extends SplashScreenState {
  const SplashScreenLoaded({super.width, super.height});
}
