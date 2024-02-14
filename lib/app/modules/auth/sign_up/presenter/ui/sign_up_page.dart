import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' show Modular;

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../shared/utils/mixin/validator_mixin.dart';
import '../../../../../shared/widgets/app_dropdown_button_widget.dart';
import '../../../../../shared/widgets/background_default_widget.dart';
import '../../../../../shared/widgets/widgets.dart';
import '../cubit/sign_up_cubit.dart';
import '../sign_up_strings.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with Validator {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController profileController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    profileController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDefaultWidget(
        child: SafeArea(
          child: BlocSelector<SignUpCubit, SignUpState, AutovalidateMode>(
            selector: (state) {
              if (state.status == SignUpStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state.status == SignUpStatus.success) {
                Modular.to.pushReplacementNamed(AppRoutes.login);
              }

              return state.autovalidateMode;
            },
            builder: (context, state) {
              return Column(
                children: [
                  const Row(children: [BackButton()]),
                  Text(
                    SignUpStrings.signUp,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: AppColors.textPrimary),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        AppTextFormField(
                          controller: nameController,
                          label: SignUpStrings.name,
                          onChanged: (value) => context.read<SignUpCubit>().nameChanged(value),
                          validator: validateName,
                        ),
                        AppTextFormField(
                          controller: lastNameController,
                          label: SignUpStrings.lastName,
                          onChanged: (value) => context.read<SignUpCubit>().lastNameChanged(value),
                          validator: validateName,
                        ),
                        AppTextFormField(
                          controller: emailController,
                          label: SignUpStrings.email,
                          onChanged: (value) => context.read<SignUpCubit>().emailChanged(value),
                          validator: validateEmail,
                        ),
                        AppTextFormField(
                          controller: passwordController,
                          label: SignUpStrings.password,
                          onChanged: (value) => context.read<SignUpCubit>().passwordChanged(value),
                          validator: validatePassword,
                          isPassword: true,
                        ),
                        AppTextFormField(
                          controller: confirmPasswordController,
                          label: SignUpStrings.confirmPassword,
                          onChanged: (value) =>
                              context.read<SignUpCubit>().confirmPasswordChange(value),
                          validator: (value) =>
                              validateConfirmPassword(value, passwordController.text),
                          isPassword: true,
                        ),
                        //Profile dropdown
                        BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) {
                            if (state.profiles.isEmpty) return const CircularProgressIndicator();

                            return AppDrodownButton(
                              hintText: SignUpStrings.profile,
                              value: state.profile,
                              items: state.profiles,
                              onChanged: (value) =>
                                  context.read<SignUpCubit>().profileChanged(value!),
                            );
                          },
                        ),
                        BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) {
                            return AppPrimaryButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignUpCubit>().signUp();
                                } else {
                                  context.read<SignUpCubit>().autoValidate();
                                }
                              },
                              label: SignUpStrings.signUpButton,
                              loading: state.status == SignUpStatus.loading,
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
