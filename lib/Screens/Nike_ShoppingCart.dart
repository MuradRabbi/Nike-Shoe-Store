import 'package:flutter/material.dart';
import '../Nike_Shoes.dart';



class NikeShoppingCart extends StatelessWidget {

  NikeShoppingCart({Key key , @required this.shoes}) : super(key: key);

  final NikeShoes shoes;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: Stack(
         fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                color: Colors.black87,

              ),
            )
          ),
         Positioned(
           left: 0,
           right: 0,
           bottom: 0,
           child: Stack(
             children: [
               TweenAnimationBuilder <double>(
                 duration: Duration(milliseconds: 600),
                 tween: Tween(begin: 1.0 , end: 0.0),
                 builder: (context , value , child){
                   return Transform.translate(
                     offset:  Offset(
                         0.0 ,
                       value * - size.height * 0.6
                     ),
                     child: child,

                   );
                    },
                 child: Container(
                   height: size.height * 0.6,
                   decoration: BoxDecoration(
                       color: Colors.white,
                     borderRadius: BorderRadius.only(
                       topRight: Radius.circular(20),
                       topLeft: Radius.circular(20)
                     )
                   ),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Container(
                               height: 100,
                                 width: 100,
                                 child: Image.asset(shoes.images.first, fit: BoxFit.cover,)),
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                 Text(shoes.model , style: TextStyle(fontSize: 12),),
                                 Text("\$ ${shoes.currentPrice.toInt().toString()}" , style: TextStyle(fontSize: 14 ,fontWeight: FontWeight.bold),)
                               ],
                             )
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               )
             ],
           ),
         )
        ],

      )
    );
  }
}
