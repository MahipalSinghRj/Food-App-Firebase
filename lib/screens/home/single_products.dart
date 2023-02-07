import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleProducts extends StatefulWidget {
    String? productImage;
    String? productName;
    int? productPrice;
    Function()? onClick;
    String? productId;

    SingleProducts(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.onClick,
      required this.productId})
      : super(key: key);

  @override
  State<SingleProducts> createState() => _SingleProductsState();
}

class _SingleProductsState extends State<SingleProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 230,
      width: 185,
      decoration: BoxDecoration(
          color: Color(0xffd9dad9), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: InkWell(child: Image.network("${widget.productImage}", )),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.productName}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${widget.productPrice}\$/ 50gm",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          height: 30,
                          //width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "50gm",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                              Icon(Icons.arrow_drop_down_outlined),
                            ],
                          ),
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Container(
                          height: 30,
                          //width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.remove),
                              Text(
                                "1",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        )),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
