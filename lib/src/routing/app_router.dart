import 'package:ecommerce_app/src/features/products/presentation/pages/product_list_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => ProductListPage())],
);
