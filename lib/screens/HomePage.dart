import 'package:flutter/material.dart';
import 'package:todey/components/ToDoCard.dart';
import 'package:todey/models/TaskList.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: Text("Todey"),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.beach_access,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
                child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              child: Text(
                "Hello, User\nHave A Good Day",
                overflow: TextOverflow.visible,
                style: TextStyle(
                  wordSpacing: 2,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  fontSize: 40,
                ),
              ),
            )),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Card(
                    child: ToDoCard(index: index, notifyParent: update),
                  ),
                ),
                childCount: kTaskList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
