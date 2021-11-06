import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          //margin: EdgeInsets.zero,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image(
                width: double.infinity,
                image: NetworkImage(
                    'https://image.freepik.com/free-photo/beauty-smiling-sport-child-boy-showing-his-biceps_155003-1808.jpg'),
                height: 200.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Let\'s Communicate To Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
