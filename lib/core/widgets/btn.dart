import 'package:flutter/material.dart';

enum BtnType { elvated, outLine, outLineDisable, cansle, reject }

class Btn extends StatelessWidget {
  final BtnType type;
  final String text;
  final VoidCallback onPressed;

   Btn({
    Key? key,
    this.type = BtnType.elvated,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: type == BtnType.outLine || type == BtnType.outLineDisable
          ? OutlinedButton(
              onPressed: type == BtnType.outLineDisable?null:(){
                onPressed();
              } ,
              child: Text(text),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: type == BtnType.outLineDisable?Color(0xffD8D8D8):Color(0xff4C8613)
                    ),
                alignment: Alignment.center,
                foregroundColor: Color(0xff4C8613),
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 27),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            )
          : ElevatedButton(
              onPressed: () {
                FocusManager.instance.primaryFocus!.unfocus();
                onPressed();
              },
              child: Text(text),
              style: ElevatedButton.styleFrom(
                foregroundColor: type == BtnType.cansle ? Colors.red : null,
                backgroundColor:
                    type == BtnType.cansle ? Color(0xffFFE1E1) : null,
                alignment: Alignment.center,
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 0,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
    );
  }
}
