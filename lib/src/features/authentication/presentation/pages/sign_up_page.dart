import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/providers/sign_up_provider.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/widgets/auth_text_button.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/widgets/email_text_field.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/widgets/password_text_field.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.spacing;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('登録する'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(spacing.p24),
        child: AppCard(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EmailTextField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'メールアドレスを入力してください';
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing.p16),
                PasswordTextField(
                  hintText: 'パスワード（8文字以上）',
                  controller: passwordController,
                ),
                SizedBox(height: spacing.p24),
                PrimaryButton(
                  label: 'アカウントを作成',
                  onPressed: () {
                    if (formKey.currentState!.validate() != true) return;
                    ref
                        .read(signUpProvider.notifier)
                        .signUp(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  },
                ),
                SizedBox(height: spacing.p24),
                AuthTextButton(
                  label: 'アカウントをお持ちですか？ ログイン',
                  onPressed: () => context.goNamed(AppRoute.signIn.name),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
