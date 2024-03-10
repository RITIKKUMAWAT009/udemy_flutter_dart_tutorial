import 'package:animation/widgets/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation<double> catAnimation;
  late AnimationController catController;
  @override
  void initState() {
    super.initState();
    catController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    catAnimation = Tween(begin: 60.0, end: 200.0).animate(CurvedAnimation(
      parent: catController,
      curve: Curves.easeIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!'),
        backgroundColor: Colors.amber,
      ),
      body: GestureDetector(
        child: Stack(
          children: [
            buildAnimation(context),
            buildContainer(),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget buildAnimation(BuildContext context) {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: catAnimation.value),
        );
      },
      child: Cat(),
    );
  }

  onTap() {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      catController.forward();
    }
  }

  buildContainer() {
    return Center(
      child: Container(
        width: double.infinity,
        height: 400,
        color: Colors.brown,
      ),
    );
  }
}
