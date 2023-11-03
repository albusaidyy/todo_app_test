import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  final VoidCallback onTap;
  const DoneButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      //edit text and go back

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 19),
        child: Container(
          width: double.infinity,
          height: 61,
          decoration: ShapeDecoration(
            color: const Color(0xFF3556AB),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFF0C2971),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: const Center(
            child: SizedBox(
              width: 115.94,
              child: Text(
                'Done',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
