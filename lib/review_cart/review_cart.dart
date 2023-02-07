import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../screens/home/single_products.dart';

class ReviewCart extends StatelessWidget {
  showAlertDialog(
    BuildContext context,
  ) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text("Yes"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you devete on cartProduct?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ListTile(
          title: Text("Total Aount"),
          subtitle: Text(
            "\$50",
            style: TextStyle(
              color: Colors.green[900],
            ),
          ),
          trailing: Container(
            width: 160,
            child: MaterialButton(
              child: Text("Submit"),
              color: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "Review Cart",
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
        body: Row(
          children: [
            SizedBox(
              height: 20,
            ),

            Container(
              height: 250,
              child: Expanded(
                flex: 1,

                child: SingleProducts(
                  productName: 'Mahipal',
                  productPrice: 50,
                  productId: '',
                  productImage: 'https://www.transparentpng.com/thumb/watermelon/TsIHwz-watermelon-clipart-file.png', onClick: (){},
                ),
              ),
            )
          ],
        ));
  }
}
