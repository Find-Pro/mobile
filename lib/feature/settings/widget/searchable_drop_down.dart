import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

class MenuItem {
  MenuItem(this.id, this.label, this.icon);
  final int id;
  final String label;
  final IconData icon;
}

List<MenuItem> menuItems = [
  MenuItem(1, 'Home', Icons.home),
  MenuItem(2, 'Profile', Icons.person),
  MenuItem(3, 'Settings', Icons.settings),
  MenuItem(4, 'Favorites', Icons.favorite),
  MenuItem(5, 'Notifications', Icons.notifications),
  MenuItem(6, 'Messages', Icons.message),
  MenuItem(7, 'Explore', Icons.explore),
  MenuItem(8, 'Search', Icons.search),
  MenuItem(9, 'Chat', Icons.chat),
  MenuItem(10, 'Calendar', Icons.calendar_today),
];

class DropdownMenuSample extends StatefulWidget {
  const DropdownMenuSample({super.key});

  @override
  State<DropdownMenuSample> createState() => _DropdownMenuSampleState();
}

class _DropdownMenuSampleState extends State<DropdownMenuSample> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 16.0;
    final menuController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownMenu<MenuItem>(
        //initialSelection: menuItems.first,
        controller: menuController,
        width: width,
        hintText: 'Select Menu',
        requestFocusOnTap: true,
        enableFilter: true,
        menuStyle: MenuStyle(
          backgroundColor:
              WidgetStateProperty.all<Color>(Colors.lightBlue.shade50),
        ),

        label: const Text('Select Menu'),
        onSelected: (MenuItem? menu) {
          setState(() {});
        },
        dropdownMenuEntries:
            menuItems.map<DropdownMenuEntry<MenuItem>>((MenuItem menu) {
          return DropdownMenuEntry<MenuItem>(
              value: menu,
              label: menu.label,
              leadingIcon: Icon(
                Icons.location_city,
                color: context.themeData.indicatorColor,
              ));
        }).toList(),
      ),
    );
  }
}
