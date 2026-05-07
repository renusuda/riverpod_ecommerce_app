import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/pages/account_page.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/pages/sign_in_page.dart';
import 'package:ecommerce_app/src/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:ecommerce_app/src/features/cart/presentation/pages/cart_page.dart';
import 'package:ecommerce_app/src/features/orders/presentation/pages/orders_page.dart';
import 'package:ecommerce_app/src/features/payment/presentation/pages/payment_page.dart';
import 'package:ecommerce_app/src/features/products/presentation/pages/product_detail_page.dart';
import 'package:ecommerce_app/src/features/products/presentation/pages/product_list_page.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/pages/leave_review_page.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:ecommerce_app/src/routing/go_router_refresh_stream.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  final authenticationRepository = ref.watch(authenticationRepositoryProvider);
  return GoRouter(
    redirect: (context, state) {
      final isLoggedIn = authenticationRepository.currentUser != null;
      final path = state.uri.path;
      if (isLoggedIn) {
        if (path == '/sign-up' || path == '/sign-in') {
          return '/';
        }
      } else {
        if (path == '/account' ||
            path == '/orders' ||
            path == '/payment' ||
            path.endsWith('/review')) {
          return '/sign-in';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      authenticationRepository.authenticationStateChanges(),
    ),
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => ProductListPage(),
        routes: [
          GoRoute(
            path: 'products/:id',
            name: AppRoute.product.name,
            builder: (context, state) {
              final productId = state.pathParameters['id']!;
              return ProductDetailPage(productId: productId);
            },
            routes: [
              GoRoute(
                path: 'review',
                name: AppRoute.leaveReview.name,
                pageBuilder: (context, state) {
                  final productId = state.pathParameters['id']!;
                  return MaterialPage(
                    fullscreenDialog: true,
                    child: LeaveReviewPage(productId: productId),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: 'cart',
            name: AppRoute.cart.name,
            pageBuilder: (context, state) =>
                MaterialPage(fullscreenDialog: true, child: CartPage()),
          ),
          GoRoute(
            path: 'payment',
            name: AppRoute.payment.name,
            pageBuilder: (context, state) =>
                MaterialPage(fullscreenDialog: true, child: PaymentPage()),
          ),
          GoRoute(
            path: 'sign-up',
            name: AppRoute.signUp.name,
            pageBuilder: (context, state) =>
                MaterialPage(fullscreenDialog: true, child: SignUpPage()),
          ),
          GoRoute(
            path: 'sign-in',
            name: AppRoute.signIn.name,
            pageBuilder: (context, state) =>
                MaterialPage(fullscreenDialog: true, child: SignInPage()),
          ),
          GoRoute(
            path: 'account',
            name: AppRoute.account.name,
            pageBuilder: (context, state) =>
                MaterialPage(fullscreenDialog: true, child: AccountPage()),
          ),
          GoRoute(
            path: 'orders',
            name: AppRoute.orders.name,
            pageBuilder: (context, state) =>
                MaterialPage(fullscreenDialog: true, child: OrdersPage()),
          ),
        ],
      ),
    ],
  );
}
