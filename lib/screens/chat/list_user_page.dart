import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/chat_users_bloc.dart';
import 'package:mobile_flutter/model/chat_users_event.dart';
import 'package:mobile_flutter/model/chat_users_state.dart';
import 'package:mobile_flutter/screens/chat/list_user_component.dart';
import 'package:mobile_flutter/screens/chat/message_page.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        child: Stack(
          children: [
            BlocProvider<ChatUsersBloc>(
              create: (_) => ChatUsersBloc(),
              child: BlocBuilder<ChatUsersBloc, ChatUsersState>(
                  builder: (context, state) {
                if (state is InitialLoadChatUsersState) {
                  context.read<ChatUsersBloc>().add(GetUsersList());
                }
                if (state is SuccesLoadChatUsersState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.chatrooms.length,
                        itemBuilder: (c, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext c) => MessagePage(
                                            emailMerchant: state.chatrooms[i]
                                                ['email'],
                                          )));
                            },
                            child: ListUserComponent(
                              chatrooms: state.chatrooms[i],
                            ),
                          );
                        }),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorsWeplant.colorPrimary,
                  ),
                );
              }),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/icons/chevron-left.svg',
                          width: 26,
                          height: 26,
                        )),
                    const SizedBox(
                      width: 14,
                    ),
                    Text(
                      'My Chat',
                      style: GoogleFonts.workSans(
                          color: ColorsWeplant.colorblackText,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    const Icon(Icons.search)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}