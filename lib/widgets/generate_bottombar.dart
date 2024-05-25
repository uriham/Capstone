import 'package:flutter/material.dart';

class GenerateBottomBar extends StatelessWidget {
  const GenerateBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: double.infinity,
        height: 72,
        color: Colors.black,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle_notifications_rounded,color: Colors.white,),
            SizedBox(width: 4,),
            Text(
              'Generate',
              style: TextStyle(color: Colors.white,fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
