import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                  child: Icon(
                CupertinoIcons.heart_fill,
                size: 50,
              )),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.home),
                      SizedBox(
                        width: 20,
                      ),
                      Text("H O M E")
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Padding(
              //   padding: const EdgeInsets.only(left: 30.0),
              //   child: InkWell(
              //     onTap: () => Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => BlockedUser())),
              //     child: const Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Icon(Icons.block),
              //         SizedBox(
              //           width: 20,
              //         ),
              //         Text("B L O C K E D  U S E R S")
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 50),
            child: GestureDetector(
              onTap: () {
                // AuthServices().logOut();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 20,
                  ),
                  Text("L O G O U T")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
