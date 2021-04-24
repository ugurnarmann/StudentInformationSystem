import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/card_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key, LoginData email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage(
                  'assets/images/top_header.png',
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                            'https://i2.cnnturk.com/i/cnnturk/75/650x325/6071939370380e1c146d319c.jpg',
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cengiz ŞEN',
                              style: TextStyle(
                                fontFamily: 'Montserrat Medium',
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Bilgisayar Mühendisliği',
                              style: TextStyle(
                                fontFamily: 'Montserrat Regular',
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      children: [
                        CardWidget(
                          assetImageDirectory: 'assets/images/student.svg',
                          text: 'Bilgilerim',
                        ),
                        CardWidget(
                          assetImageDirectory: 'assets/images/calendar.svg',
                          text: 'Takvim',
                        ),
                        CardWidget(
                          assetImageDirectory: 'assets/images/lesson.svg',
                          text: 'Derslerim',
                        ),
                        CardWidget(
                          assetImageDirectory: 'assets/images/inlesson.svg',
                          text: 'Katıldığım Dersler',
                        ),
                      ],
                      crossAxisCount: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
