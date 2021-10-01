import 'package:flutter/material.dart';
import 'package:krishworks_assignment/core/resources/resources.dart';
import 'package:krishworks_assignment/features/authentication/controller/auth_controller.dart';
import 'package:krishworks_assignment/features/authentication/view/widgets/input.dart';
import 'package:krishworks_assignment/features/core/utils/input_checker.dart';
import 'package:krishworks_assignment/features/core/widgets/button.dart';
import 'package:krishworks_assignment/features/core/widgets/elevated_card.dart';
import 'package:krishworks_assignment/features/core/widgets/loading_indicator.dart';
import 'package:krishworks_assignment/features/core/widgets/snackbar_message.dart';

class ForgotPasswordCard extends StatelessWidget {
  const ForgotPasswordCard({Key? key}) : super(key: key);

  static final TextEditingController _emailController = TextEditingController();

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
                  hint: AppStrings.email,
                  inputType: TextInputType.emailAddress,
                  readOnly: showProgress,
                  leading: const Icon(Icons.email),
                  controller: _emailController,
                ),
              ),
              showProgress
                  ? const LoadingIndicator()
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppDimensions.d8),
                      child: Button(
                        title: AppStrings.submit,
                        onPressed: () async {
                          if (await InputChecker.isValid(inputs: [_emailController.text])) {
                            AuthController.instance.toggleProgress();

                            String message = await AuthController.instance.resetPassword(
                              email: _emailController.text,
                            );

                            AuthController.instance.toggleProgress();
                            SnackBarMessage.showMessage(context: context, message: message);
                            _emailController.clear();
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
