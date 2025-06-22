import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final String description;
  final IconData location;
  final DateTime date;
  const CardComponent({
    super.key,

    required this.title,
    required this.description,
    required this.location,
    required this.date
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
        subtitle:  
        RichText(
          textDirection: TextDirection.rtl,
          text: TextSpan(children: [
            TextSpan(              
              text: description,
              style: TextStyle(
                // fontWeight: FontWeight.bold
              ),
            ),
          ]
        ),
        ),
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       padding: EdgeInsets.all(10),
      //       child: Row(
      //         children: [
      //           Text(
      //             count.toString(),
      //             style: TextStyle(
      //               fontSize: 50,
      //               color: clPrimary,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           VerticalDivider(
      //             color: clMuted,
      //             thickness: 5,
      //           ),
      //           Container(
      //             padding: EdgeInsets.only(right: 10),
                  
      //             width: 250,
      //             child: Column(
      //               mainAxisSize: MainAxisSize.max,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               children: [
                      
      //                 Text(
      //                   title,
      //                   style: TextStyle(
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.bold,
      //                     color: clPrimary,
      //                   ),
      //                 ),
      //                 Text(
      //                   description,
      //                   overflow: TextOverflow.ellipsis,
      //                   maxLines: 5,
      //                   softWrap: true,
      //                   style: TextStyle(
                          
      //                     color: clSec,
      //                     fontSize: 15,
                          
      //                   ),
      //                 ),
                      
      //               ],
      //             ),
      //           ),
                
      //         ],
      //       ),
      //     ),
          
      //     Container(
      //       margin: EdgeInsets.only(right: 20),
      //       alignment: Alignment.topRight,
      //       width: 50,
      //       child: CircleAvatar(
      //         backgroundColor: clMuted,
      //         child: 
      //         Icon(icon, size: 30),
      //       ),
      //     ),
          
      //   ],
      // ),

    );
  }
}