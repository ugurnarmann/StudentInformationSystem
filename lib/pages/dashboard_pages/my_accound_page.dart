import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoklama_sistemi/pages/base_widgets/header.dart';
import 'package:yoklama_sistemi/pages/base_widgets/text_styles.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/avatar_and_name.dart';
import 'package:yoklama_sistemi/pages/dashboard_wigets/go_back_button.dart';
import '../dashboard.dart';

TextStyles _textStyles = TextStyles();

class MyAccountScreen extends StatelessWidget {
  final dynamic data;
  const MyAccountScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Header(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  AvatarAndName(
                    networkImageUrl: data['photo'],
                    name: data['name'],
                    title: data['deph'],
                    headerRightButton: GoBackButton(
                      goBackPage: DashboardScreen(),
                    ),
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bilgilerim',
                      style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        color: Colors.black38,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 24,),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(
                              data['name'],
                            ),
                            subtitle: Text('Ad Soyad'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              data['mail'],
                            ),
                            subtitle: Text('Mail Adresi'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              data['faculty'],
                            ),
                            subtitle: Text('Fakülte'),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              data['deph'],
                            ),
                            subtitle: Text('Bölüm'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bilgi Güncellemek İçin Öğrenci İşlerine Başvurunuz.',
                      style: TextStyle(
                        fontFamily: 'Montserrat Medium',
                        color: Colors.black38,
                        fontSize: 12,
                      ),
                    ),
                  ],
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

