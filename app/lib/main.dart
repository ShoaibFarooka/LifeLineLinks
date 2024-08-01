import 'package:flutter/material.dart';
import 'package:funeral_app/views/requests/requests_screen.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'services/login_provider.dart';
import 'services/requests_provider.dart';
import 'services/send_invites_provider.dart';
import 'services/signup_provider.dart';
import 'services/user_links_provider.dart';
import 'views/login/login_screen.dart';
import 'views/notifications/notifications_screen.dart';
import 'views/pin_code/pin_code_screen.dart';
import 'views/user_links/user_links_screen.dart';
import 'views/Invites/invites_screen.dart';
import 'views/sync_auth/sync_auth_screen.dart';
import 'views/sign_up/sign_up_screen.dart';
import 'views/sync_contacts/sync_contacts_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/signUp',
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: '/syncContacts',
        builder: (context, state) => const SyncContactsScreen(),
      ),
      GoRoute(
        path: '/syncAuth',
        builder: (context, state) => const SyncAuthScreen(),
      ),
      GoRoute(
        path: '/invitesPage',
        builder: (context, state) => const InvitesPage(),
      ),
      GoRoute(
        path: '/pendingInvites',
        builder: (context, state) => const RequestsPage(),
      ),
      GoRoute(
        path: '/userLinksPage',
        builder: (context, state) => const UserLinksScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/pinCodePage',
        builder: (context, state) => const PinCodeScreen(),
      ),
    ],
  );

  // @override
  // void initState() {
  //   super.initState();
  //   _handleIncomingLinks();
  // }

  // void _handleIncomingLinks() async {
  //   // Handle the app launch with a deep link
  //   final initialLink = await getInitialLink();
  //   if (initialLink != null) {
  //     _router.push(Uri.parse(initialLink).path);
  //   }

  //   // Handle incoming links when the app is already started/open
  //   linkStream.listen((String? link) {
  //     if (link != null) {
  //       _router.push(Uri.parse(link).path);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider(context)),
        ChangeNotifierProvider(create: (context) => SignupProvider(context)),
        ChangeNotifierProvider(create: (context) => SendInvitesProvider(context)),
        ChangeNotifierProvider(create: (context) => InvitesProvider()),
        ChangeNotifierProvider(create: (context) => UserLinksProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Funeral App',
        theme: ThemeData(
          primaryColor: const Color(0xFF171212),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF171212),
            secondary: const Color(0xFFF04A24),
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}
















