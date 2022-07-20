import 'package:flutter/material.dart';

class categoriesWidget extends StatefulWidget {
  const categoriesWidget({Key? key, required this.image, required this.foodName}) : super(key: key);
  final String image;
  final String foodName;

  @override
  State<categoriesWidget> createState() => _categoriesWidgetState();
}

class _categoriesWidgetState extends State<categoriesWidget> {
  @override
  Widget build(BuildContext context) {
    bool changeColor = true;
    return InkWell(
      onTap: (){
        while(changeColor = true){
          changeColor = false;
        }


        print(changeColor);

      },
      child: Container(
        width: 110,
        decoration: BoxDecoration(

          border: changeColor? Border.all(width: 0.1, style: BorderStyle.solid) : Border.all(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(25)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              changeColor? Image.asset('assets/${widget.image}.png', color: Colors.grey,) : Image.asset('assets/${widget.image}.png', color: Colors.red,),
              changeColor? Text(widget.foodName, style: const TextStyle( color: Colors.grey,)) : Text(widget.foodName, style: const TextStyle( color: Colors.red,)),
            ],
          ),
        ),
      ),
    );
  }
}


class categoriesWidgetRed extends StatelessWidget {
  const categoriesWidgetRed({Key? key, required this.image, required this.foodName}) : super(key: key);
  final String image;
  final String foodName;
  @override
  Widget build(BuildContext context) {
    bool changeColor;
    return Container(
      width: 110,

      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.red),
          borderRadius: BorderRadius.circular(25)

      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/$image.png', color: Colors.red,),
            Text(foodName, style: const TextStyle( color: Colors.red, fontSize: 12),)
          ],
        ),
      ),
    );
  }
}