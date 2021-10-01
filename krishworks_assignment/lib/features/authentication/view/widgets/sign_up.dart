import 'package:flutter/material.dart';
import 'package:krishworks_assignment/core/resources/resources.dart';
import 'package:krishworks_assignment/features/authentication/controller/auth_controller.dart';
import 'package:krishworks_assignment/features/authentication/view/widgets/input.dart';
import 'package:krishworks_assignment/features/core/utils/input_checker.dart';
import 'package:krishworks_assignment/features/core/widgets/button.dart';
import 'package:krishworks_assignment/features/core/widgets/elevated_card.dart';
import 'package:krishworks_assignment/features/core/widgets/loading_indicator.dart';
import 'package:krishworks_assignment/features/core/widgets/snackbar_message.dart';

class SignUpCard extends StatelessWidget {
  const SignUpCard({Key? key}) : super(key: key);

  static final TextEditingController _nameController = TextEditingController();
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      margin: const EdgeInsets.all(AppDimensions.d32),
      padding: const EdgeInsets.all(AppDimensions.d16),
      child: ValueListenableBuilder<bool>(
        valueListenable: AuthController.instance.showProgress,
        builder: (context, showProgress, widget) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppDimensions.d8),
                child: Input(
                  hint: AppStrings.name,
                  inputType: TextInputType.name,
                  maxLength: 20,
                  readOnly: showProgress,
                  leading: const Icon(Icons.person),
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppDimensions.d8),
                child: Input(
                  hint: AppStrings.email,
                  inputType: TextInputType.emailAddress,
                  readOnly: showProgress,
                  leading: const Icon(Icons.email),
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppDimensions.d8),
                child: ValueListenableBuilder<bool>(
                  valueListenable: AuthController.instance.isPasswordHidden,
                  builder: (context, isPasswordHidden, widget) {
                    return Input(
                      hint: AppStrings.password,
                      inputType: TextInputType.visiblePassword,
                      maxLength: 16,
                      readOnly: showProgress,
                      obscure: isPasswordHidden,
                      leading: const Icon(Icons.password),
                      trailing: IconButton(
                        icon: Icon(isPasswordHidden ? Icons.visibility_off : Icons.visibility),
                        onPressed: () => AuthController.instance.togglePasswordVisibility(),
                      ),
                      controller: _passwordController,
                    );
                  },
                ),
              ),
              showProgress
                  ? const LoadingIndicator()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppDimensions.d8),
                      child: Button(
                        title: AppStrings.signUp,
                        onPressed: () async {
                          if (await InputChecker.isValid(
                            inputs: [
                              _nameController.text,
                              _emailController.text,
                              _passwordController.text,
                            ],
                          )) {
                            AuthController.instance.toggleProgress();

                            String message = await AuthController.instance.signUp(
                              displayName: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );

                            AuthController.instance.toggleProgress();
                            SnackBarMessage.showMessage(context: context, message: message);
                            _passwordController.clear();
                          } else {
                            SnackBarMessage.showMessage(context: context, message: AppStrings.allFieldsRequired);
                          }
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
