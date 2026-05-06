import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    final authenticationRepository = ref.watch(
      authenticationRepositoryProvider,
    );
    final user = authenticationRepository.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFFCF6FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('アカウント'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('本当にログアウトしますか？'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.read(authenticationRepositoryProvider).signOut();
                        Navigator.of(context).pop();
                      },
                      child: const Text('ログアウト'),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              'ログアウト',
              style: textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing.p16),
        child: Center(
          child: _AccountTable(
            rows: [
              _AccountRow(label: 'ID', value: user?.uid ?? '-'),
              _AccountRow(label: 'メールアドレス', value: user?.email ?? '-'),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccountTable extends StatelessWidget {
  const _AccountTable({required this.rows});

  final List<_AccountRow> rows;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;
    final borderColor = Colors.grey.shade300;

    return Table(
      columnWidths: const {0: FlexColumnWidth(), 1: FlexColumnWidth()},
      border: TableBorder(
        horizontalInside: BorderSide(color: borderColor),
        bottom: BorderSide(color: borderColor),
      ),
      children: [
        for (final row in rows)
          TableRow(
            children: [
              _TableCell(
                padding: EdgeInsets.symmetric(vertical: spacing.p16),
                child: Text(row.label, style: textTheme.titleMedium),
              ),
              _TableCell(
                padding: EdgeInsets.symmetric(vertical: spacing.p16),
                child: Text(row.value, style: textTheme.titleMedium),
              ),
            ],
          ),
      ],
    );
  }
}

class _TableCell extends StatelessWidget {
  const _TableCell({required this.padding, required this.child});

  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}

class _AccountRow {
  const _AccountRow({required this.label, required this.value});

  final String label;
  final String value;
}
