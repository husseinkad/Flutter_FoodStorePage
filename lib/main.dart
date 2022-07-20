import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodstoreui/Categories_widgit.dart';
import 'package:foodstoreui/models/Product_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
var _selectedIndex = 0;
class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: const [
          CircleAvatar(backgroundImage: AssetImage('assets/pexels-photo-1384219.png'), child: FittedBox(fit: BoxFit.cover,),),
        ],
        leading: Image.asset('assets/slider.png'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text('Chose the'),
          ), const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text('Food you love', style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 25,),
          Center(
            child: Container(
              height: 42,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(width: 0.1),
                  color: Colors.white54,
                borderRadius: BorderRadius.circular(30)
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20, top: 12),
                child: Text('Search for a food item', style: TextStyle(color: Colors.grey),),
              ),
            ),
          ),
          const SizedBox(height: 40,),
          const Padding(
            padding: EdgeInsets.only(left: 15,),
            child: Text('Categories'),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  categoriesWidgetRed(image: 'burger', foodName: 'burger'),
                  SizedBox(width: 20,),
                  categoriesWidget(image: 'fast-food', foodName: 'pizza'),
                  SizedBox(width: 20,),
                  categoriesWidget(image: 'chicken', foodName: 'chicken'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40,),
          const Padding(
            padding: EdgeInsets.only(left: 15,),
            child: Text('Burgers'),),
          productImages(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Image.asset('assets/shopping-bag.png'),
        onPressed: () {  },
    ),
    );
  }
  productImages() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          height: 250,
          child: PageView.builder(
              onPageChanged: (index){
                setState((){
                  _selectedIndex = index;
                });
              },
              controller: PageController(viewportFraction: 0.5),
              itemCount: productBannerList.length,
              itemBuilder: (context, index){
                var _scale = _selectedIndex == index? 1.0 : 0.95;
                return TweenAnimationBuilder(
                  duration: const Duration(microseconds: 350),
                  tween: Tween(begin: _scale, end: _scale),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Container(
                    width: 100,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        ),
                     child: DefaultTextStyle(
                       style: const TextStyle(color: Colors.black, fontSize: 15),
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 12),
                         child: Container(
                           width: 50,
                           decoration: BoxDecoration(
                             border: Border.all(width: 0.2),
                             borderRadius: BorderRadius.circular(30),
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(15.0),
                                 child: Image.asset(productBannerList[index].urlImage),
                               ),
                               Text(productBannerList[index].name),
                               RatingBarIndicator(
                                 rating: 4.5,
                                 itemBuilder: (context, index) => const Icon(
                                   Icons.star,
                                   color: Colors.amber,
                                 ),
                                 itemCount: 5,
                                 itemSize: 18.0,
                                 direction: Axis.horizontal,
                               ),
                               Text(productBannerList[index].price),

                             ],
                           ),
                         ),
                       ),
                     ),
                    ),
                );
              }
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(productBannerList.length, (index) => DotsRow(
                isActive: _selectedIndex == index ? true : false
            ))
          ],
        )
      ],
    );
  }
}

class DotsRow extends StatelessWidget {
  DotsRow({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: AnimatedContainer(
        duration: const Duration(microseconds: 300),
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: isActive? Colors.red : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

