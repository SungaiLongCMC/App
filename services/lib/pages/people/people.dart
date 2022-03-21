import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:services/config/constant.dart';
import 'package:services/widgets/simple_indicator.dart';

class PeopleScreen extends StatefulWidget {
  PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  bool boolSortBy = true;
  bool boolSortDirection = true;
  bool boolView = false;
  final GlobalKey _menuKey = GlobalKey();

  List data = ["ABC", "DEF", "GHI", "WCC", "John"];

  Future loadList() async {
    final data = ["ABC", "DEF", "ASFAsf", "QCC", "218fds8"];
    setState(() => this.data = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add, size: 35, color: Colors.white),
        ),
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            final resultNumber = data.length;
            return <Widget>[
              SliverAppBar(
                //title: const Text('Floating Nested SliverAppBar'),
                floating: true,
                //expandedHeight: 150,
                backgroundColor: Colors.white.withOpacity(0),
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.add,
                                  color: kPrimaryColor,
                                  size: 20,
                                ),
                                label: const Text('Filter',
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.black))),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(0),
                        // color: Colors.white,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: Colors.grey.shade300)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(resultNumber > 1
                                  ? "$resultNumber Results"
                                  : "$resultNumber Result"),
                            ),
                            Flexible(
                              child: Container(),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.email_outlined,
                                    size: 20,
                                    color: kPrimaryColor,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: PopupMenuButton(
                                key: _menuKey,
                                offset: const Offset(0, 50),
                                icon: Icon(
                                  // FontAwesomeIcons.arrowDown,
                                  // Icons.sort,
                                  boolSortDirection
                                      ? MdiIcons.sortAscending
                                      : MdiIcons.sortDescending,
                                  size: 20,
                                  color: kPrimaryColor,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    const PopupMenuItem<int>(
                                        enabled: false,
                                        child: ItemMenu(
                                            text: "SORT BY", selected: false)),
                                    CheckedPopupMenuItem(
                                        value: 1,
                                        checked: boolSortBy,
                                        child: ItemMenu(
                                            text: "First Name",
                                            selected: boolSortBy)),
                                    PopupMenuItem<int>(
                                        value: 2,
                                        child: ItemMenu(
                                            text: "Last Name",
                                            selected: !boolSortBy)),
                                    const PopupMenuItem<int>(
                                        enabled: false,
                                        child: ItemMenu(
                                            text: "SORT DIRECTION",
                                            selected: false)),
                                    PopupMenuItem<int>(
                                        value: 3,
                                        child: ItemMenu(
                                            text: "A-Z",
                                            selected: boolSortDirection)),
                                    PopupMenuItem<int>(
                                        value: 4,
                                        child: ItemMenu(
                                            text: "Z-A",
                                            selected: !boolSortDirection)),
                                  ];
                                },
                                onSelected: (value) {
                                  switch (value) {
                                    case 1:
                                      setState(() {
                                        boolSortBy = true;
                                      });
                                      dynamic state = _menuKey.currentState;
                                      state.showButtonMenu();
                                      break;
                                    case 2:
                                      setState(() {
                                        boolSortBy = false;
                                        boolSortDirection = false;
                                        boolView = true;
                                      });
                                      dynamic state = _menuKey.currentState;
                                      state.showButtonMenu();
                                      break;
                                    case 3:
                                      setState(() {
                                        boolSortDirection = true;
                                      });
                                      dynamic state = _menuKey.currentState;
                                      state.showButtonMenu();
                                      break;
                                    case 4:
                                      setState(() {
                                        boolSortDirection = false;
                                      });
                                      dynamic state = _menuKey.currentState;
                                      state.showButtonMenu();
                                      break;
                                    case 5:
                                      setState(() {
                                        boolView = !boolView;
                                      });
                                      dynamic state = _menuKey.currentState;
                                      state.showButtonMenu();
                                      break;
                                    default:
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Container(
            color: Colors.white,
            child: RefreshIndicator(
              onRefresh: loadList,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final text = data[index];
                  final date = data[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      height: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text,
                            style: const TextStyle(fontSize: 10),
                          ),
                          if (boolView)
                            Text(date,
                                style: TextStyle(
                                    color: kSecondaryColor, fontSize: 10)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}

class RefreshWidget extends StatefulWidget {
  final Widget child;
  final Future Function() onRefresh;

  RefreshWidget({Key? key, required this.child, required this.onRefresh})
      : super(key: key);

  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget> {
  @override
  Widget build(BuildContext context) => buildList();

  Widget buildList() => RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: widget.child,
      );
}

customRefreshBuilder() => (context, child, controller) {
      return Stack(
        children: <Widget>[
          child,
          PositionedIndicatorContainer(
            controller: controller,
            child: SimpleIndicatorContent(
              controller: controller,
            ),
          ),
        ],
      );
    };

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    Key? key,
    required this.text,
    required this.selected,
  }) : super(key: key);
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (selected)
          Icon(
            Icons.check,
            size: 20,
            color: kPrimaryColor,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(text),
        ),
      ],
    );
  }
}
