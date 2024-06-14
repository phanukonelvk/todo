import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_example/auth/presentation/provider/auth_provider.dart';
import 'package:todo_example/auth/presentation/provider/state/auth_notifier.dart';
import 'package:todo_example/auth/presentation/provider/state/auth_state.dart';

import 'package:todo_example/widgets/app_constant.dart';
import 'package:todo_example/widgets/app_size_config.dart';
import 'package:todo_example/widgets/app_textstyles.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final StorageService storageService = SharedPrefsService();
    AuthNotifier? authNotifier = ref.read(authStateNotifier.notifier);
    AuthState? authState = ref.watch(authStateNotifier);
    final TextEditingController emailController =
        TextEditingController(text: 'emilys');
    final TextEditingController passwordController =
        TextEditingController(text: 'emilyspass');
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateUpDirection],
      child: Scaffold(
        appBar: null,
        body: authState!.isLoading!
            ? const Center(
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.square(
                      dimension: 15, child: CircularProgressIndicator()),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Loading.... '),
                ],
              ))
            : SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppConstant.kPadding16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: AppSizeConfig.blockSizeVertical! * 3,
                        ),
                        
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              AppConstant.kBorderRadius12),
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
                              .copyWith(fontWeight: FontWeight.w800),
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
                          controller: emailController,
                          decoration: InputDecoration(
                            hintStyle: AppTextStyles.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppConstant.kBorderRadius16,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                  AppConstant.kBorderRadius12),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppSizeConfig.blockSizeVertical! * 2,
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintStyle: AppTextStyles.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: AppConstant.kBorderRadius16,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                  AppConstant.kBorderRadius12),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        authState.error == null
                            ? Container()
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppConstant.kBorderRadius8),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  authState.error!.isNotEmpty
                                      ? "email or password incorrect."
                                      : "",
                                  // textAlign: TextAlign.start,
                                  style: AppTextStyles.bodySmall!
                                      .copyWith(color: Colors.red),
                                ),
                              ),
                        // SizedBox(
                        //   height: AppSizeConfig.blockSizeVertical! * 4,
                        // ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            side: const BorderSide(color: Colors.black45),
                            minimumSize: const Size(
                              double.infinity,
                              45,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppConstant.kBorderRadius12),
                            ),
                          ),
                          onPressed: () async {
                            // await authNotifier!.sigIn(
                            //     username: emailController.text,
                            //     password: passwordController.text);
                            await authNotifier!.logIn(
                                context: context,
                                username: emailController.text,
                                password: passwordController.text);
                            // context.goNamed(AppRoute.home.name);
                          },
                          child: Text(
                            'Log in',
                            style: AppTextStyles.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ),
                        SizedBox(
                          height: AppSizeConfig.blockSizeVertical! * 4,
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppConstant.kPadding16),
                              child: Text('OR'),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        SizedBox(
                          height: AppSizeConfig.blockSizeVertical! * 2,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: social
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: AppConstant.kPadding6),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppConstant.kPadding24,
                                      vertical: AppConstant.kPadding12),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(
                                          AppConstant.kBorderRadius16)),
                                  child: Image.network(
                                    e['image'].toString(),
                                    width:
                                        AppSizeConfig.blockSizeHorizontal! * 12,
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
