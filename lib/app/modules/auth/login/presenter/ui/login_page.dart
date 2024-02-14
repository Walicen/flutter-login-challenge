import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' show Modular;

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../shared/utils/mixin/validator_mixin.dart';
import '../../../../../shared/widgets/app_text_button_widget.dart';
import '../../../../../shared/widgets/background_default_widget.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../cubit/login_cubit.dart';
import 'login_strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Validator {
  final TextEditingController emailController = TextEditingController(text: 'walicen.r@gmail.com');
  final TextEditingController passwordController = TextEditingController(text: 'Senha@1234');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundDefaultWidget(
      child: SafeArea(
        child: BlocSelector<LoginCubit, LoginState, AutovalidateMode>(
          selector: (state) {
            if (state is LoginSuccess) {
              Modular.to.pushReplacementNamed(AppRoutes.home);
            }
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.error,
                ),
              );
            }
            return state.autovalidateMode;
          },
          builder: (context, autovalidateMode) {
            return Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextFormField(
                          controller: emailController,
                          onChanged: context.read<LoginCubit>().updateEmail,
                          hintText: LoginStrings.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            final emailValidator = validateEmail(value!);
                            if (emailValidator != null) {
                              return emailValidator;
                            }
                            return null;
                          },
                        ),
                        AppTextFormField(
                          controller: passwordController,
                          onChanged: context.read<LoginCubit>().updatePassword,
                          hintText: LoginStrings.password,
                          isPassword: true,
                          validator: (value) {
                            final passValidator = validatePassword(value!);
                            if (passValidator != null) {
                              return passValidator;
                            }
                            return null;
                          },
                        ),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return AppPrimaryButton(
                              loading: state is LoginLoading,
                              label: LoginStrings.login,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().doLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                }
                              },
                            );
                          },
                        ),
                        AppTextButtonWidget(
                          label: LoginStrings.forgotPass,
                          onPressed: () {
                            Modular.to.pushNamed(AppRoutes.forgotPassword);
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Divider(),
                        AppTextButtonWidget(
                          label: LoginStrings.signUp,
                          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.textPrimary,
                              ),
                          onPressed: () {
                            Modular.to.pushNamed(AppRoutes.signUp);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
