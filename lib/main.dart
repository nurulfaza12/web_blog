import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_blog/utils/constants.dart';
import 'package:web_blog/screens/detail/detail_argument.dart';
import 'package:web_blog/screens/detail/detail_view.dart';
import 'package:web_blog/screens/home/bloc/home_bloc.dart';
import 'package:web_blog/screens/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.montserratTextTheme()),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            if (settings.name == Constant.detailPath) {
              final args = settings.arguments as DetailArgument;

              return DetailView(argument: args);
            }
            return BlocProvider<HomeBloc>(
              create: (_) => HomeBloc()..add(const LoadBlogs()),
              child: const HomeView(),
            );
          },
        );
      },
      home: BlocProvider<HomeBloc>(
        create: (_) => HomeBloc()..add(const LoadBlogs()),
        child: const HomeView(),
      ),
    );
  }
}
