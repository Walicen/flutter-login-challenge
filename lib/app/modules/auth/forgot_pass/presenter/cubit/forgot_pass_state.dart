part of 'forgot_pass_cubit.dart';

sealed class ForgotPassState extends Equatable {
  final AutovalidateMode autovalidateMode;
  const ForgotPassState({this.autovalidateMode = AutovalidateMode.disabled});

  @override
  List<Object> get props => [];
}

final class ForgotPassInitial extends ForgotPassState {}
