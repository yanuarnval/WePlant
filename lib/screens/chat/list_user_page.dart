import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_flutter/screens/chat/list_user_component.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/chevron-left.svg'),
                const Text('Chat')
              ],
            ),
            ListView.builder(
                itemCount: 3,
                itemBuilder: (c,i){
              return ListUserComponent();
            }),
          ],
        ),
      ),
    );
  }
}
