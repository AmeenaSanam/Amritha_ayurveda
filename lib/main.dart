import 'package:amritha_ayurveda/core/utils/auth_storage.dart';
import 'package:amritha_ayurveda/features/data/data_sources.dart/auth_remote_datasource.dart';
import 'package:amritha_ayurveda/features/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/network/api_client.dart';
import 'features/data/repositories/auth_repository_impl.dart';
import 'features/domain/use_cases/login_usecase.dart';
import 'features/presentation/view_model/login_view_model.dart';
import 'package:http/http.dart' as http;



void main() {
  final apiClient = ApiClient(http.Client());
  final authStorage=AuthStorage();
  final remoteDataSource = AuthRemoteDatasource(apiClient);
  final repository = AuthRepositoryImpl(remoteDataSource,authStorage);
  final loginUseCase = LoginUseCase(repository);
  runApp( MyApp(loginUseCase:loginUseCase));
}

class MyApp extends StatelessWidget {
  final LoginUseCase loginUseCase;

  const MyApp({super.key,required this.loginUseCase});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel(loginUseCase)),
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

