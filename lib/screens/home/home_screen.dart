import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_food_app/provider/product_provider.dart';
import 'package:my_food_app/screens/home/single_products.dart';
import 'package:my_food_app/services/Firebase_Services.dart';
import 'package:provider/provider.dart';
import '../../Network/NetworkManager.dart';
import '../../Network/NetworkWidgets.dart';
import '../../NoInternetConnection/InternetNotAvailable.dart';
import '../../config/colors.dart';
import '../../models/product_model.dart';
import '../../product_overview/product_overview.dart';
import '../../search/search.dart';
import 'drawer_side.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 1;
  ProductProvider? productProvider;
  NetworkManager _networkManager = Get.find<NetworkManager>();

  Widget _buildHerbsProduct(context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('HERBS SEASONING',style:TextStyle(
          color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 15),),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'VIEW ALL',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),

        StreamBuilder(
            stream: FirebaseFirestore.instance.collection("HerbsProduct").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
              if(snapshot.hasData && snapshot.data!=null){
                if(snapshot.data!.docs.isNotEmpty){
                  return SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child:  Container(
                      width: MediaQuery.of(context).size.width, // double.in
                      height: 210.0,
                      child: ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                onTap: (){
                                  Get.to(ProductOverview(
                                    productName: snapshot.data!.docs.elementAt(index).get("productName"),
                                    productPrice:snapshot.data!.docs.elementAt(index).get("productPrice"),
                                    productImage: snapshot.data!.docs.elementAt(index).get("productImage"),
                                  ));
                                },
                                child: SingleProducts(
                                    productImage: snapshot.data!.docs.elementAt(index).get("productImage"),
                                    productName: snapshot.data!.docs.elementAt(index).get("productName"),
                                    productPrice: snapshot.data!.docs.elementAt(index).get("productPrice"),

                                    productId: '', onClick: () {  },),
                              ),
                            );
                          }
                      ),
                    )
                  );
                }else{
                  return Center(child: Text("No Document Available"));
                }
              }else{
                return Center(child: Text("No Item Available"));
              }
            }
        ),


      ],
    );
  }

  Widget _buildFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('FRESH FRUITS',style:TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 15),),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'VIEW ALL',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),

        StreamBuilder(
            stream: FirebaseFirestore.instance.collection("FreshProduct").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
              if(snapshot.hasData && snapshot.data!=null){
                if(snapshot.data!.docs.isNotEmpty){
                  return SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child:  Container(
                        width: MediaQuery.of(context).size.width, // double.in
                        height: 210.0,
                        child: ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                  onTap: (){
                                    Get.to(ProductOverview(
                                      productName: snapshot.data!.docs.elementAt(index).get("productName"),
                                      productPrice:snapshot.data!.docs.elementAt(index).get("productPrice"),
                                      productImage: snapshot.data!.docs.elementAt(index).get("productImage"),
                                    ));
                                  },
                                  child: SingleProducts(
                                      productImage: snapshot.data!.docs.elementAt(index).get("productImage"),
                                      productName: snapshot.data!.docs.elementAt(index).get("productName"),
                                      productPrice: snapshot.data!.docs.elementAt(index).get("productPrice"),

                                      productId: '', onClick: () {  },),
                                ),
                              );
                            }
                        ),
                      )
                  );
                }else{
                  return Center(child: Text("No Document Available"));
                }
              }else{
                return Center(child: Text("No Item Available"));
              }
            }
        ),
      ],
    );
  }

  Widget _buildRootProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ROOT VEGETABLE',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'VIEW ALL',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),

        StreamBuilder(
            stream: FirebaseFirestore.instance.collection("RootProduct").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
              if(snapshot.hasData && snapshot.data!=null){
                if(snapshot.data!.docs.isNotEmpty){
                  return SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child:  Container(
                        width: MediaQuery.of(context).size.width, // double.in
                        height: 210.0,
                        child:  ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: InkWell(
                                  onTap: (){
                                    Get.to(ProductOverview(
                                      productName: snapshot.data!.docs.elementAt(index).get("productName"),
                                      productPrice:snapshot.data!.docs.elementAt(index).get("productPrice"),
                                      productImage: snapshot.data!.docs.elementAt(index).get("productImage"),
                                    ));
                                  },
                                  child: SingleProducts(
                                      productImage: snapshot.data!.docs.elementAt(index).get("productImage"),
                                      productName: snapshot.data!.docs.elementAt(index).get("productName"),
                                      productPrice: snapshot.data!.docs.elementAt(index).get("productPrice"),
                                      productId: '', onClick: () {  },),
                                ),
                              );
                            }
                        ),
                      )
                  );
                }else{
                  return Center(child: Text("No Document Available"));
                }
              }else{
                return Center(child: Text("No Item Available"));
              }
            }
        ),
      ],
    );
  }

  @override
  void initState() {
    productProvider=productProvider?.fetchHerbsProductData();
    productProvider?.getHerbsProductDataList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        backgroundColor: Color(0xffd1ad17),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        actions: [
          //networkUI(),
          SizedBox(width: 20,),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: IconButton(
              onPressed: () {
                Get.to(Search(
                  search: [],
                ));
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: Icon(
                  Icons.shop,
                  size: 17,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: <Widget>[
            Visibility(
              visible: Provider.of<InternetConnectionStatus>(context) ==
                  InternetConnectionStatus.disconnected,
              child: const InternetNotAvailable(),
            ),
            Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected?Text(""): Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi0Xg-k622Sbztlrb-L1o1CAla3zCbVc2lUw&usqp=CAU'),
                      ),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(right: 130, bottom: 10),
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xffd1ad17),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(50),
                                        bottomLeft: Radius.circular(50),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Punu',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          shadows: [
                                            BoxShadow(
                                                color: Colors.green,
                                                blurRadius: 10,
                                                offset: Offset(3, 3))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '30% Off',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.green[100],
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    'On all vegetables products',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  _buildHerbsProduct(context),
                  _buildFreshProduct(context),
                  _buildRootProduct(context),

                ],
              ),
          ],
        ),



      ),
    );
  }
}
