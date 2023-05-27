// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:client/module/main_navigation/controller/main_navigation_controller.dart';
import 'package:flutter/material.dart';

class MainNavigationSideBar extends StatelessWidget {
  const MainNavigationSideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = MainNavigationController.instance;
    return ValueListenableBuilder(
        valueListenable: controller.selectedIndex,
        builder: (context, index, widget) {
          return ListView.builder(
            itemCount: controller.menuList.length,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = controller.menuList[index];
              bool selected = controller.selectedIndex.value == index;

              return Container(
                margin: const EdgeInsets.only(
                  bottom: 12.0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selected ? Colors.black : Colors.transparent,
                    foregroundColor: selected ? Colors.white : Colors.black,
                    elevation: selected ? 1.0 : 0.0,
                  ),
                  onPressed: () => controller.updateIndex(index, item["page"]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        item["icon"],
                        size: 16.0,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Text(
                          item["label"],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
