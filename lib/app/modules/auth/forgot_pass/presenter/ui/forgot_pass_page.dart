import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/widgets/background_default_widget.dart';
import '../cubit/forgot_pass_cubit.dart';
import 'forgot_pass_strings.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ForgotPassStrings.title),
      ),
      body: BackgroundDefaultWidget(
        child: SafeArea(
          child: BlocSelector<ForgotPassCubit, ForgotPassState, AutovalidateMode>(
            selector: (state) {
              return state.autovalidateMode;
            },
            builder: (context, state) {
              return const Center(
                child: Text('ForgotPassPage'),
              );
            },
          ),
        ),
      ),
    );
  }
}
