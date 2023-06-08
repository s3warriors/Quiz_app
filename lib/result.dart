import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int total;
  final Function reset;
  Result(this.total, this.reset);
  //lec53 getter
  String get result {
    if (total >= 8)
      return 'you r nice';
    else if (total >= 12)
      return 'you r very nice';
    else if (total >= 13)
      return 'you r unbetable';
    else
      return 'you r so bad';
  }

  @override
  Widget build(BuildContext context) {
    print(total);
    return Center(
      child: Column(
        children: [
          Text(
            result,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: (() => reset()),
              child: Container(
                padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    
                    border: Border.all(
                      color: Colors.black,
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(
                    'Restart Now',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 229, 8, 8),
                    ),textAlign: TextAlign.center,
                  )))
        ],
      ),
    );
  }
}
