import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/appointments/presentation/appointments_page.dart';
// import 'package:pipa_dart/src/features/treatment/presentation/treatment_description_page.dart';
// import 'package:pipa_dart/src/features/students/domain/students_model.dart';
// import 'package:pipa_dart/src/features/students/presentation/students_page.dart';
// import 'package:pipa_dart/src/features/login/presentation/login_page.dart';
// import 'package:pipa_dart/src/services/api_service.dart';
// import 'features/clinicalcare/presentation/clinical_care_page.dart';
import 'features/home/presentation/home_page.dart';
import 'features/patients/presentation/patients_page.dart';
import 'features/settings/presentation/settings_page.dart';
import 'features/treatment/presentation/service_detail_page.dart';
import 'features/treatment/presentation/treatment_description_page.dart';
// import 'features/treatment/presentation/service_detail_page.dart';
import 'shared/utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  Future<bool> _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  @override
  Widget build(final BuildContext context) => AnimatedBuilder(
    animation: ThemeChange.instance,
    builder: (final context, final child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pipa App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: ThemeChange.instance.isDartTheme
            ? Brightness.dark
            : Brightness.light,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      // home: FutureBuilder<bool>(
      //   future: _checkLogin(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else {
      //       if (snapshot.data ?? false) {
      //         return const HomePage();
      //       } else {
      //         return const LoginPage();
      //       }
      //     }
      //   },
      // ),
      routes: {
        // '/': (_) => const ProfilePage(),
        '/': (final context) => const ServiceDetailPage(
          title: 'Título',
          description:
              'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. ',
        ),
        '/home': (final context) => const HomePage(),
        '/treatment_description_page': (final context) => const AddService(),
        '/patients': (final context) => const Patients(),
        '/appointments': (final context) => const Appointments(),
        '/settings_page': (final context) => const SettingsPage(),
      },
    ),
  );
}
