import 'package:client/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainNavigationController extends State<MainNavigationView>
    implements MvcController {
  static late MainNavigationController instance;
  late MainNavigationView view;

  @override
  void initState() {
    instance = this;
    setDefaultRoute();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<Map<String, dynamic>> menuList = [
    {
      "icon": Icons.dashboard,
      "label": "Dashboard",
      "page": "/",
    },
    {
      "icon": Icons.book,
      "label": "Products",
      "page": "/products",
    },
    {
      "icon": Icons.person,
      "label": "Profile",
      "page": "/profile",
    }
  ];

  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);
  updateIndex(int newIndex, String page) {
    selectedIndex.value = newIndex;
    Navigator.pushReplacementNamed(
      Get.currentContext,
      page,
    );
  }

  String getFragment(BuildContext context) {
    if (kIsWeb) {
      return Uri.base.fragment;
    } else {
      final currentRoute = ModalRoute.of(context)?.settings.name;
      return currentRoute ?? '';
    }
  }

  setDefaultRoute() {
    String? currentRoute = getFragment(context);
    var index = menuList.indexWhere((i) => i["page"] == currentRoute);
    selectedIndex.value = index;
    print(index);
  }
}
