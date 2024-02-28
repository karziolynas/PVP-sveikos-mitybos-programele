import 'package:go_router/go_router.dart';
import 'package:projecthealthapp/presentation/screens/login_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    name: 'intro',
    path: "/intro",
    builder: (context, state) => const LoginScreen(),
  )
], initialLocation: '/intro');
