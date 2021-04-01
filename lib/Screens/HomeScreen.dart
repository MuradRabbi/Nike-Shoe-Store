import 'package:flutter/material.dart';
import 'package:nikeshoestoreui/Screens/Nike_shoes_Details.dart';

import '../Nike_Shoes.dart';




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier <bool> notifierBottomBarVisible = ValueNotifier(true);

  void _onShoesPressed( NikeShoes shoes , BuildContext context)async{
    notifierBottomBarVisible.value = false;
   await Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder:(context , animation1 , animation2){
            return FadeTransition(
              opacity: animation1,
              child: NikeShoesDetails( shoes: shoes),
            );

          }
      )
    );
    notifierBottomBarVisible.value = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left:20, top:20, right:20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("assets/images/nike_logo.png", height:60),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 20.0),
                    itemCount: shoes.length,
                    itemBuilder: (context, index){
                      final shoesItem = shoes[index];
                      return NikeShoesItem(
                          shoesItem : shoesItem,
                        onTap: (){
                          _onShoesPressed(shoesItem,context);
                        }
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          ValueListenableBuilder <bool> (
              valueListenable: notifierBottomBarVisible,
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: Row(
                  children: [
                    Expanded(child: Icon(Icons.home)),
                    Expanded(child: Icon(Icons.search)),
                    Expanded(child: Icon(Icons.favorite_border)),
                    Expanded(child: Icon(Icons.shopping_cart)),
                    Expanded(child: Center(child:Padding(padding:EdgeInsets.all(2.0),child: CircleAvatar( radius:13 , backgroundImage: AssetImage("assets/images/profile-icon.jpg"),))))

                  ],
                ),
              ),
              builder: (context , value , child){
                return AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: 0,
                    right:0,
                    bottom:value ? 0.0 : -kToolbarHeight,
                    height:kToolbarHeight,
                    child: child
                );
              }
          )
        ],
      )
    );
  }
}



class NikeShoesItem extends StatelessWidget {

  final NikeShoes shoesItem;
  final VoidCallback onTap;

  const NikeShoesItem({Key key, this.shoesItem, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 290;
    return InkWell(
      onTap: onTap,
      child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
          child:  SizedBox(
            height: itemHeight,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: "background_${shoesItem.model}",
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                            color:Color(shoesItem.color)
                        ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,

                    child: Hero(
                      tag: "number_${shoesItem.model}",
                      child: SizedBox(
                        height: itemHeight * 0.6,
                        child: Material(
                          color: Colors.transparent,
                          child: FittedBox(
                            child: Text(shoesItem.modelNumber.toString(),
                              style: TextStyle(color:Colors.black.withOpacity(0.03),
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                          ),
                        ),
                      ),
                    ),
                  ) ,

                Positioned(
                  top: 20,
                  left: 100,
                  height: itemHeight * 0.65,
                  child: Hero(
                      tag: "image_${shoesItem.model}",
                      child: Image.asset(shoesItem.images.first , fit:  BoxFit.contain,)),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Icon(Icons.favorite_border , color: Colors.grey,),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Icon(Icons.shopping_cart , color: Colors.grey,),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(shoesItem.model, style: TextStyle(color:Colors.grey),),
                      SizedBox(height:8),
                      Text(
                       "\$ ${shoesItem.oldPrice.toInt().toString()}", style: TextStyle(color:Colors.red, decoration: TextDecoration.lineThrough),),
                      Text(
                        "\$ ${shoesItem.currentPrice.toInt().toString()}", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    ],
                  ),
                )
              ],
            ),
          ),

      ),
    );
  }
}

