import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_example/widgets/app_constant.dart';
import 'package:todo_example/widgets/app_size_config.dart';
import 'package:todo_example/widgets/app_textstyles.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateUpDirection],
      child: Scaffold(
        appBar: null,
        body: SafeArea(
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: AppConstant.kPadding16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppSizeConfig.blockSizeVertical! * 3,
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppConstant.kBorderRadius12),
                    child: Image.asset(
                      'assets/icons/3d-checklist-clipboard-render-illustration.jpg',
                      width: AppSizeConfig.screenWidht! * 0.5,
                    ),
                  ),
                  SizedBox(
                    height: AppSizeConfig.blockSizeVertical! * 2,
                  ),
                  Text(
                    'Wellcome to Schedo',
                    style: AppTextStyles.titleMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: AppSizeConfig.blockSizeVertical! * 0.8,
                  ),
                  const Text(
                    'create an account to save all schedo and access them form anywhere.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: AppSizeConfig.blockSizeVertical! * 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius:
                            BorderRadius.circular(AppConstant.kBorderRadius12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
