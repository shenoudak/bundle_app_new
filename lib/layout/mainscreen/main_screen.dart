import 'package:bundle_app/business_logic/cubit/cubit.dart';
import 'package:bundle_app/business_logic/cubit/states.dart';
import 'package:bundle_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              ' ${AppCubit.get(context).titleScreen[AppCubit.get(context).curIndex]}',
              style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'SegoeUI-Bold',
                fontWeight: FontWeight.bold,
                color: HexColor('#2E3645'),
              ),
            ),
            actions:
            [
              IconButton(
                icon:Icon(Icons.notifications,color: primaryColor,),
                onPressed: (){},
              ),
              IconButton(
                icon:Icon(Icons.search,color: primaryColor,),
                onPressed: (){},
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              AppCubit.get(context).changeNavbarBottomIndex(index);
            },
            elevation: 0.0,
            currentIndex: AppCubit.get(context).curIndex,
            //fixedColor: Colors.orangeAccent,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
          ),
          body:
              AppCubit.get(context).listScreen[AppCubit.get(context).curIndex],
        );
      },
    );
  }
}
