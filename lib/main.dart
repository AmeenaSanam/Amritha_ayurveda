import 'package:amritha_ayurveda/features/presentation/view/splash_screen.dart';
import 'package:amritha_ayurveda/features/presentation/view_model/login_viewmodel.dart';
import 'package:amritha_ayurveda/features/presentation/view_model/patient_viewmodel.dart';
import 'package:amritha_ayurveda/injector/injector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  configurDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<LoginViewmodel>()),
        ChangeNotifierProvider(create: (_) => getIt<PatientViewmodel>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amritha Ayurveda',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
