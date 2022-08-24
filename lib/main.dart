import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/cubit/DarkMode.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/layout/home.dart';
import 'package:news/layout/splash.dart';
import 'package:news/network/cash_helper.dart';
import 'package:news/network/dio_helper.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  var Dark = CashHelper.GetData(key: 'Dark');
  
  runApp( MyApp(Dark));
}

class MyApp extends StatelessWidget {

  final bool? Dark;
  MyApp(this.Dark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
          ..getBusiness()
          ..getSports()
          ..getSience()
          ..getTechnology()
          ..getHealth(),
        ),
        BlocProvider(
          create: (BuildContext context) => DarkMode()..ChangeMode(
          fromShared: Dark,
        ),),
      ],
      child: BlocConsumer<DarkMode,NewsStates>(
        listener: (BuildContext context, state) {  },
          builder: (BuildContext context, Object? state)
          {
            return MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleTextStyle: GoogleFonts.acme(
                    fontSize: 20,
                    color: Color(0xff000739),
                  ),
                  iconTheme: IconThemeData(
                    color: Color(0xff000739),
                  ),
                  color: Colors.white,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.dark
                  ),
                  elevation: 0,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedLabelStyle: GoogleFonts.acme(),
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Color(0xff000739),
                    unselectedItemColor:Color(0xff000739),
                    backgroundColor: Colors.white38,
                    elevation: 20.0
                ),
                textTheme: TextTheme(
                    bodyText1: GoogleFonts.acme(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000739)
                    )
                ),
              ),
              darkTheme:  ThemeData(
                scaffoldBackgroundColor: Color(0xff333739),
                appBarTheme: AppBarTheme(
                  backgroundColor: Color(0xff333739),
                  titleTextStyle: GoogleFonts.acme(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Color(0xff333739),
                      statusBarIconBrightness: Brightness.light
                  ),
                  elevation: 0,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedLabelStyle: GoogleFonts.acme(),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Color(0xff333739),
                  elevation: 20.0,
                ),
                textTheme: TextTheme(
                    bodyText1: GoogleFonts.acme(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )
                ),
              ),
              themeMode: DarkMode.get(context).Dark?
              ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: Splash(),
            );
          }
      ),
    );
  }
}

