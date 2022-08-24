import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';
import 'package:news/network/cash_helper.dart';

class DarkMode extends Cubit<NewsStates>
{
  DarkMode() : super(NewsInitialStates());

  static DarkMode get(context) => BlocProvider.of(context);

//  DarkMode
 bool Dark = false;
 void ChangeMode({bool? fromShared})
 {
   if(fromShared != null)
   {
     Dark = fromShared;
     emit(NewsAppModeState());
   }
   else
     {
       Dark = !Dark;
       CashHelper.PutData(key: 'Dark', value: Dark).then((value)
       {
         emit(NewsAppModeState());
       });
     }

 }

}