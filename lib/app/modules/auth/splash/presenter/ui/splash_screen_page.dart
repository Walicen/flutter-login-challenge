import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../shared/widgets/form_shape_widget.dart';
import '../cubit/splash_screen_cubit.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashScreenCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) {
          if (state is SplashScreenLoaded) {
            Navigator.of(context).pushReplacementNamed('/login');
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                AnimatedContainer(
                  width: state.width,
                  height: state.height,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOutCubic,
                  child: FormShapeWidget(
                    colors: const [
                      AppColors.primary,
                      Colors.white,
                    ],
                    width: state.width,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
