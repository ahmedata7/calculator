import 'package:flutter/material.dart';
typedef OnClick =  void Function(String digit);
class Calcbuttom extends StatelessWidget {
  String text;
  OnClick on_Click ;
  Calcbuttom(this.text,this.on_Click);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(2),
        height: double.infinity,
        width: double.infinity,
        child: ElevatedButton(
          onPressed:(){
            if(text != " ") {
              on_Click.call(text);
          }
          },
          child: Text(text, style: TextStyle(fontSize: 25)),
        ),
      ),
    );
  }
}
