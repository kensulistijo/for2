import 'package:flutter/material.dart';

class BoxMenu extends StatelessWidget {
  final String title;

  const BoxMenu({
    super.key,

    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        // side: BorderSide(color: borderColor ?? clMuted, width: 1),
      ),
      color: Colors.white,
      child: 
      ListTile(
        // trailing: Icon(icon, 
        //   color: textColor ?? Colors.black,),
          isThreeLine: false,
          leading: 
          Text('test',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
        title: Text(
          textDirection: TextDirection.rtl,
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),
        ),
      );
  }
}