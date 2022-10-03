// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  const TopBarContents(this.opacity, {super.key});

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [false, false, false, false];
  List<Widget> rowElements = [];

  List<String> items = ['Home', 'About', 'History', 'Contact'];

  List<Widget> generateRowElements() {
    var screenSize = MediaQuery.of(context).size;

    rowElements.clear();
    for (int i = 0; i < items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            value ? _isHovering[i] = true : _isHovering[i] = false;
          });
        },
        onTap: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              items[i],
              style: TextStyle(
                  color: _isHovering[i]
                      ? const Color(0xFF077bd7)
                      : const Color(0xFF077bd7),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 5),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              visible: _isHovering[i],
              child: Container(
                height: 2,
                width: 20,
                color: const Color(0xFF077bd7),
              ),
            )
          ],
        ),
      );

      Widget spacer = SizedBox(width: screenSize.width / 15);
      rowElements.add(spacer);
      rowElements.add(elementTile);
    }

    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.white.withOpacity(widget.opacity),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width / 4,
                  ),
                  const Text(
                    'Author',
                    style: TextStyle(
                      color: Color(0xFF077bd7),
                      fontSize: 26,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  Row(
                    children: generateRowElements(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
