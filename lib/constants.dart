import 'package:flutter/material.dart';

const ivory = Color(0xffffffee);
const eirie = Color(0xff181818);
const family = 'Grotesk';
const backgroundColor = Colors.white12;
const balance = 22578.66;

class NumericKeyboard extends StatelessWidget {
  final Function(String) onKeyboardTap;

  NumericKeyboard({required this.onKeyboardTap});

  void _handleTap(String value) {
    onKeyboardTap(value);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      childAspectRatio: 2,
      shrinkWrap: true,
      crossAxisCount: 3,
      children: [
        _buildKey('1'),
        _buildKey('2'),
        _buildKey('3'),
        _buildKey('4'),
        _buildKey('5'),
        _buildKey('6'),
        _buildKey('7'),
        _buildKey('8'),
        _buildKey('9'),
        Center(),//_buildKey('.'),
        _buildKey('0'),
        _buildKey('⌫', isBackspace: true),
      ],
    );
  }

  Widget _buildKey(String value, {bool isBackspace = false}) {
    return GestureDetector(
      onTap: () => _handleTap(value),
      child: Center(
        child: Container(
          //height: 50,
          child: Text(
            value,
            style: TextStyle(fontSize: 30.0,fontFamily: family,color: ivory),
          ),
        ),
      ),
    );
  }
}

class LongArrowPainter extends CustomPainter {
  final Color color;

  LongArrowPainter({this.color = eirie});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Path path = Path();
    // Draw the line part of the arrow
    path.moveTo(size.width / 2, size.height);
    path.lineTo(size.width / 2, size.height / 4);

    // Draw the arrow head
    path.moveTo(size.width / 2, size.height / 4);
    path.lineTo(size.width / 4, size.height / 2);
    path.moveTo(size.width / 2, size.height / 4);
    path.lineTo(size.width * 3 / 4, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}