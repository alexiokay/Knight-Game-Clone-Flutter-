import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class GuildInvitation extends StatelessWidget {
  const GuildInvitation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 35, 20, 7),
              border: Border.all(
                color: Color.fromARGB(255, 162, 162, 162),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        'Pending Guild Invitations: ${playerControler.guildInvitations.length}',
                        style: TextStyle(color: Colors.white))
                  ],
                ))));
  }
}
