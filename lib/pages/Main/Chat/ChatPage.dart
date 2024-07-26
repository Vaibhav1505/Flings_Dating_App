// ignore_for_file: prefer_const_constructors

import 'package:flings_flutter/styles/buttons.dart';
import 'package:flings_flutter/styles/text.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
//Chat Contenet Contianer

        Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 135),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      tileColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          )),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://imgs.search.brave.com/cZOIIGYKdZ_R7_epmNMJdLRz2z_7NWzYOPNPAtWwjas/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9oaXBz/LmhlYXJzdGFwcHMu/Y29tL2htZy1wcm9k/L2ltYWdlcy9yb2Jl/cnQtcGF0dGluc29u/LWFzLWJydWNlLXdh/eW5lLWJhdG1hbi1p/bi10aGUtYmF0bWFu/LTE2NDUxODcxMTQu/anBnP2Nyb3A9MC40/NzB4dzoxLjAweGg7/MC41MTB4dywwJnJl/c2l6ZT0zNjA6Kg'),
                      ),
                      title: Text("Bruce Bhaiya", style: whiteBoldText),
                      subtitle: Text(
                        "This is Gotham",
                        style: greyNormalText.copyWith(fontSize: 12),
                      ),
                      trailing: Badge(
                        label: Text("1"),
                      ),
                    ),
                  );
                }),
          ),
        ),

//Chat Header Container

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 125,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Chats",
                        style: whiteBoldText.copyWith(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: InkWell(
                          child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      )),
                    ),
                  ],
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    Chip(
                      label: Text(
                        "All Messages",
                        style: whiteBoldText,
                      ),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                        50,
                      ))),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          "50",
                          style: blackNormalText.copyWith(fontSize: 10),
                        ),
                      ),
                    ),
                    TextButton(
                        style: whiteTextButton,
                        onPressed: () {},
                        child: Text(
                          "Read",
                          style: blackBoldText,
                        )),
                    TextButton(
                        style: whiteTextButton,
                        onPressed: () {},
                        child: Text(
                          "Unread",
                          style: blackBoldText,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
