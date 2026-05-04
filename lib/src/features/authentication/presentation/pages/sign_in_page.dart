import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'メールアドレス',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              SizedBox(height: spacing.p16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'パスワード',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
              ),
              SizedBox(height: spacing.p24),
              PrimaryButton(label: 'ログイン', onPressed: () {}),
              SizedBox(height: spacing.p24),
              TextButton(
                onPressed: () {
                  context.goNamed(AppRoute.signUp.name);
                },
                child: const Text(
                  'アカウントをお持ちでないですか？ 登録',
                  style: TextStyle(color: Color(0xFF5C4DB1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
