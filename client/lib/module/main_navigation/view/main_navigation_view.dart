import 'package:flutter/material.dart';
import 'package:client/core.dart';

class MainNavigationView extends StatefulWidget {
  final Widget child;
  const MainNavigationView({
    Key? key,
    required this.child,
  }) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return Scaffold(
      body: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20.0),
            width: 180,
            decoration: const BoxDecoration(
              color: Color(0xfff9f9f9),
            ),
            child: Column(
              children: [
                const MainNavigationLogo(),
                const SizedBox(
                  height: 40.0,
                ),
                const Expanded(
                  child: MainNavigationSideBar(),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    elevation: 0.0,
                  ),
                  onPressed: () {},
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Text(
                          "Logout",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
