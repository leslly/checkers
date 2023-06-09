import 'package:checkers/home_screen.dart';
import 'package:checkers/other/video_view.dart';
import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({Key? key, required this.callback}) : super(key: key);

  //final Navigator nextPage;
final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: callback,
      child: Container(
        alignment: Alignment.center,
        height: 173,
        width: 353,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 9,
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text(
                  "I have a dream role in mind!",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    height: 1.2,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Reem',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Fill in some basic information and sit back relax.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.2,
                    fontFamily: 'Reem',
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: const [
                    Icon(
                      Icons.circle_sharp,
                      size: 8,
                      // Icons.brightness_1_sharp,circle_sharp,arrow_forward_rounded
                      //check_sharp
                    ),
                    SizedBox(width: 5),
                    Text(
                      "AI Generated - 3 simple steps",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Reem',
                        fontSize: 16,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(width: 70),
                    Icon(
                      Icons.arrow_forward_rounded,
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}

