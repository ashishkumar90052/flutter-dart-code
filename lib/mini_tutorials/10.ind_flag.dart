import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(minutes: 5), vsync: this);
    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * .5,
                  color: const Color.fromRGBO(255, 153, 51, 1),
                ),
              ),
              AnimatedBuilder(
                animation: _controller,
                child: Image.asset(
                  'assets/ashok_chakra.png',
                  height: 100.0,
                  width: 100.0,
                ),
                builder: (BuildContext context, widget) {
                  return Transform.rotate(
                    angle: _controller.value * 300,
                    child: widget,
                  );
                },
              ),
              RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5 - 100,
                    color: const Color.fromRGBO(19, 136, 8, 1),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
              bottom: 32,
              left: 100,
              child: Text(
                "Happy 77th\nIndependence Day",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * 0.5, size.height - 30.0);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width * .75, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
