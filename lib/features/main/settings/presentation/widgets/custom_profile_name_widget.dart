import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/manager/cubit/signup_bloc_cubit.dart';
import 'package:courseapp/features/auth/prestation/manager/cubit/signup_bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProfileNameWidget extends StatefulWidget {
  const CustomProfileNameWidget({super.key});

  @override
  State<CustomProfileNameWidget> createState() => _CustomProfileNameWidgetState();
}

class _CustomProfileNameWidgetState extends State<CustomProfileNameWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().fetchUsername();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<AuthCubit, AppAuthState>(
          builder: (context, state) {
            if (state is AuthUserNameLoaded) {
              return Text(
                state.username,
                style: getBoldStyle(
                  color: ColorManager.black500,
                ),
              );
            }

            return Text(
              "محمد اشرف",
              style: getRegularStyle(
                color: ColorManager.black500,
              ),
            );
          },
        ),
        const SizedBox(width: 8),
        Icon(Icons.edit, color: ColorManager.primary700),
      ],
    );
  }
}