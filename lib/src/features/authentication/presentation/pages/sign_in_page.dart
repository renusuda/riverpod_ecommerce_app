import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/widgets/auth_text_button.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/widgets/email_text_field.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/widgets/password_text_field.dart';
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

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'メールアドレスを入力してください';
                    }
                    if (!RegExp(
                      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                    ).hasMatch(value)) {
                      return '正しいメールアドレスを入力してください';
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing.p16),
                PasswordTextField(
                  hintText: 'パスワード',
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'パスワードを入力してください';
                    }
                    return null;
                  },
                ),
                SizedBox(height: spacing.p24),
                PrimaryButton(
                  label: 'ログイン',
                  onPressed: () {
                    if (formKey.currentState!.validate() != true) return;
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
