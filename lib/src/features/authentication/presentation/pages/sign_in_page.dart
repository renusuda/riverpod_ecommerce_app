import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/extensions/async_value_ui.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/providers/sign_in_provider.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/widgets/auth_text_button.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/widgets/email_text_field.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/widgets/password_text_field.dart';
import 'package:ecommerce_app/src/features/authentication/utils/validators.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.spacing;

    final signInState = ref.watch(signInProvider);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    ref.listen(
      signInProvider,
      (previous, next) => next.showAlertDialogOnError(context),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('ログインする'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(spacing.p24),
        child: AppCard(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EmailTextField(
                  controller: emailController,
                  validator: validateEmail,
                ),
                SizedBox(height: spacing.p16),
                PasswordTextField(
                  hintText: 'パスワード',
                  controller: passwordController,
                  validator: validatePasswordNotEmpty,
                ),
                SizedBox(height: spacing.p24),
                PrimaryButton(
                  label: 'ログイン',
                  isLoading: signInState.isLoading,
                  onPressed: signInState.isLoading
                      ? null
                      : () {
                          if (formKey.currentState!.validate() != true) return;
                          ref
                              .read(signInProvider.notifier)
                              .signIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        },
                ),
                SizedBox(height: spacing.p24),
                AuthTextButton(
                  label: 'アカウントをお持ちでないですか？ 登録',
                  onPressed: () => context.goNamed(AppRoute.signUp.name),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
