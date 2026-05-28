import 'package:flutter/material.dart';
class WelcomePage extends StatelessWidget {
const WelcomePage({super.key});
static const Color primaryBlue = Color(0xFF1565C0);
static const Color primaryGreen = Color(0xFF5CB85C);
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
body: Center(
child: SingleChildScrollView(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const SizedBox(height: 60),
const Text(
'Welcome to',
style: TextStyle(
fontSize: 16,
color: Colors.black54,
),
),
const Text(
'PRAKTIKUM PAB 2023',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
color: primaryBlue,
),
),
const SizedBox(height: 16),
const Text(
'1462300059',
style: TextStyle(
fontSize: 14,
letterSpacing: 2.5,
fontWeight: FontWeight.w600,
color: Colors.black87,
),
),
const SizedBox(height: 24),
Container(
width: 140,
height: 140,
decoration: BoxDecoration(
shape: BoxShape.circle,
color: const Color(0xFFE8F0FE),
border: Border.all(
color: const Color(0xFF90B4E8),
width: 3,
),
),
child: ClipOval(
child: CustomPaint(
painter: _AvatarPainter(),
size: const Size(140, 140),
),
),
),
const SizedBox(height: 24),
const Text(
'Bahrul Daniar Alamsyah',
style: TextStyle(
fontSize: 18,
fontWeight: FontWeight.bold,
color: Colors.black87,
),
),
const SizedBox(height: 36),
ElevatedButton(
onPressed: () {
Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (_) => const FormMahasiswaPage(),
),
);
},
style: ElevatedButton.styleFrom(
backgroundColor: primaryGreen,
foregroundColor: Colors.white,
padding: const EdgeInsets.symmetric(
horizontal: 60, vertical: 14),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(30),
),
elevation: 4,
),
child: const Text(
'Masuk',
style: TextStyle(
fontSize: 16,
fontWeight: FontWeight.bold,
letterSpacing: 1,
),
),
),
const SizedBox(height: 60),
],
),
),
),
);
}
}
class _AvatarPainter extends CustomPainter {
@override
void paint(Canvas canvas, Size size) {
final cx = size.width / 2;
final cy = size.height / 2;
final bgPaint = Paint()..color = const Color(0xFFE8F0FE);
canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);
final headPaint = Paint()..color = const Color(0xFFFFDDB4);
canvas.drawCircle(Offset(cx, cy * 0.55), 28, headPaint);
final bodyPaint = Paint()..color = const Color(0xFF1565C0);
final bodyRect = RRect.fromRectAndRadius(
Rect.fromCenter(
center: Offset(cx, cy * 1.4), width: 54, height: 50),
const Radius.circular(10),
);
canvas.drawRRect(bodyRect, bodyPaint);
canvas.drawRRect(
RRect.fromRectAndRadius(
Rect.fromLTWH(cx - 43, cy * 1.2, 18, 10), const Radius.circular(5)),
bodyPaint,
);
canvas.drawRRect(
RRect.fromRectAndRadius(
Rect.fromLTWH(cx + 25, cy * 1.2, 18, 10), const Radius.circular(5)),
bodyPaint, );
final hairPaint = Paint()..color = const Color(0xFF3E2723);
canvas.drawCircle(Offset(cx, cy * 0.45), 28, hairPaint);
canvas.drawCircle(Offset(cx, cy * 0.55), 28, headPaint);
final eyePaint = Paint()..color = const Color(0xFF3E2723);
canvas.drawCircle(Offset(cx - 9, cy * 0.53), 3, eyePaint);
canvas.drawCircle(Offset(cx + 9, cy * 0.53), 3, eyePaint);
final smilePaint = Paint()
..color = const Color(0xFF3E2723)
..strokeWidth = 2
..style = PaintingStyle.stroke
..strokeCap = StrokeCap.round;
final smilePath = Path()
..moveTo(cx - 8, cy * 0.62)
..quadraticBezierTo(cx, cy * 0.70, cx + 8, cy * 0.62);
canvas.drawPath(smilePath, smilePaint);
final greenPaint = Paint()..color = const Color(0xFF5CB85C);
canvas.drawCircle(Offset(cx - 44, cy * 0.75), 8, greenPaint);
canvas.drawCircle(Offset(cx + 44, cy * 0.75), 8, greenPaint);
}
@override
bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
