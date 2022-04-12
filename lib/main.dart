import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/colors/app_colors.dart';
import 'core/constants/app_consts.dart';
import 'injectable.dart';
import 'news/presentation/bloc/news_bloc.dart';
import 'news/presentation/pages/news_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const ForestVPNTestApp());
}

class ForestVPNTestApp extends StatelessWidget {
  const ForestVPNTestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => getIt.get<NewsBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ForestVPN test',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              color: AppColors.basicHeaderColor,
              fontSize: 28,
              fontFamily: AppConsts.fontFamily,
            ),
            headline2: TextStyle(
              color: AppColors.basicTextColor,
              fontSize: 20,
              fontFamily: AppConsts.fontFamily,
            ),
            headline3: TextStyle(
              color: AppColors.basicTextColor,
              fontSize: 18,
              fontFamily: AppConsts.fontFamily,
            ),
            headline4: TextStyle(
              color: AppColors.basicTextColor,
              fontSize: 16,
              fontFamily: AppConsts.fontFamily,
            ),
            subtitle1: TextStyle(
              color: AppColors.secondaryColor,
              fontSize: 12,
              fontFamily: AppConsts.fontFamily,
            ),
          ),
        ),
        home: const NewsPage(),
      ),
    );
  }
}
