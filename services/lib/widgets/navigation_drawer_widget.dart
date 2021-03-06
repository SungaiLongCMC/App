import 'package:flutter/material.dart';
import 'package:services/pages/profile/profile.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const name = 'SLCMC 2';
    const church = 'Sungai Long Chinese Methodist Church';
    const urlImage =
        'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50';
    return Drawer(
      child: Container(
        color: Colors.grey[800],
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: urlImage,
                name: name,
                church: church,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ))),
            //const SizedBox(height: 48),
            const Divider(color: Colors.grey),
            buildMenuItem(
              text: 'People',
              icon: Icons.people,
            ),
            const Divider(color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(
          {required String urlImage,
          required String name,
          required String church,
          required VoidCallback onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 20)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(urlImage),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(name,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
                const SizedBox(height: 4),
                Text(church,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                    )),
              ])
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
  }) {
    const color = Colors.white;
    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
    );
  }
}
