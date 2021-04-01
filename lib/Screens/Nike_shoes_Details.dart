import 'package:flutter/material.dart';
import 'Package:nikeshoestoreui/ShakeTransition.dart';
import 'package:nikeshoestoreui/Screens/Nike_ShoppingCart.dart';
import '../Nike_Shoes.dart';




class NikeShoesDetails extends StatelessWidget {
  final NikeShoes shoes;
  final ValueNotifier <bool> notifierButtonVisible = ValueNotifier(false);

  NikeShoesDetails({Key key , @required this.shoes});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierButtonVisible.value = true;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Image.asset("assets/images/nike_logo.png", height: 60,),
        leading: BackButton(
          color:Colors.black
        )
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
         Positioned.fill(
           child:  Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
                _buildCarosole(context),
               ShakeTransition(
                 
                 child: Padding(
                   padding: const EdgeInsets.all(20),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         shoes.model,
                         style: TextStyle( color:Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Text(
                             "\$ ${ shoes.oldPrice.toInt().toString()}",
                             style: TextStyle( color:Colors.red, decoration: TextDecoration.lineThrough, fontSize:11),
                           ),
                           Text(
                             "\$ ${ shoes.currentPrice.toInt().toString()}",
                             style: TextStyle( color:Colors.black, fontWeight: FontWeight.bold, fontSize:15),
                           )
                         ],
                       )

                     ],
                   ),

                 ),
               ),

               ShakeTransition(
                 duration: Duration(milliseconds: 1100),
                 child: Padding(
                   padding: const EdgeInsets.all(20),
                   child: Text("AVAILABLE SIZE", style: TextStyle(fontSize: 14 , color: Colors.black, fontWeight: FontWeight.bold),),
                 ),
               ),
               ShakeTransition(
                 duration: Duration(milliseconds: 1100),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     _shoeSizeItem(text: "6",),
                     _shoeSizeItem(text: "7",),
                     _shoeSizeItem(text: "9",),
                     _shoeSizeItem(text: "10",),
                     _shoeSizeItem(text: "11",),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: Text("DESCRIPTION", style: TextStyle(fontSize: 14 , color: Colors.black, fontWeight: FontWeight.bold),),
               ),
             ],
           ),
         ),
          ValueListenableBuilder(
              valueListenable: notifierButtonVisible,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    FloatingActionButton(
                        heroTag: 'fav_1',
                        backgroundColor: Colors.white,
                        onPressed: (){},
                        child:  Icon(Icons.favorite, color: Colors.black,)
                    ),
                    Spacer(),
                    FloatingActionButton(
                        heroTag: 'fav_2',
                        backgroundColor: Colors.black,
                        onPressed: (){
                          _openShoppingCart(context);
                        },
                        child:  Icon(Icons.shopping_cart)
                    )
                  ],
                ),
              ),
              builder: (context , value , child){
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 250),
                  left: 0,
                  right: 0,
                  bottom: value ? 0.0 : -kToolbarHeight * 1.5,
                  child: child
                );
              })
        ],
      ),
    );
  }

  void _openShoppingCart( BuildContext context) async{
    notifierButtonVisible.value = false;
     await  Navigator.of(context).push(PageRouteBuilder(
         opaque: false,
         pageBuilder: (_ , animation1 , __){
        return FadeTransition(

          opacity: animation1,

          child: NikeShoppingCart(shoes: shoes),
        );
      }));
     notifierButtonVisible.value = true;
  }


  Widget _buildCarosole(BuildContext context){
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: "background_${shoes.model}",
              child: Container(
                  color:Color(shoes.color)
              ),
            ),
          ),
          Positioned(
            left: 70,
            right:70,
            top:10,
            child: Hero(
              tag: "number_${shoes.model}",
              child: ShakeTransition(
                axis: Axis.vertical,
                offset: 15 ,
                duration: Duration(milliseconds: 1400),
                child: Material(
                  color: Colors.transparent,
                  child: FittedBox(
                    child: Text(shoes.modelNumber.toString(),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.03),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
              itemCount: shoes.images.length,
              itemBuilder: (context , index){
                final tag = index == 0 ? "image_${shoes.model}" : "image_${shoes.model}_$index";
                return Container(
                  alignment: Alignment.center,
                  child: ShakeTransition(
                    duration: index == 0 ? Duration(milliseconds: 900) : Duration.zero,
                    offset: 10,
                    axis: Axis.vertical,
                    child: Hero(
                      tag: "image_${shoes.model}",
                      child: Image.asset(shoes.images[index],
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}


class _shoeSizeItem extends StatelessWidget {
  final String text;

 const _shoeSizeItem({Key key , this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Text(
          "US $text",
        style: TextStyle( fontWeight: FontWeight.bold , fontSize: 11),
      ),
    );
  }
}
