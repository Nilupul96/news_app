import 'package:go_router/go_router.dart';
import '../features/home/domain/entities/article.dart';
import '../features/home/presentation/pages/article_details_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: HomeScreen.routeName,
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: ArticleDetailsScreen.routeName,
        path: '/article-details',
        builder: (context, state) => ArticleDetailsScreen(
          article: state.extra as ArticleEntity,
        ),
      ),
    ],
  );
}
