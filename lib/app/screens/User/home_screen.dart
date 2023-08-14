import 'package:ecommerce_app/app/screens/User/search_screen.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/declarations.dart';
import '../../widgets/addresbar.dart';
import '../../widgets/carousel_image.dart';
import '../../widgets/deal_of_day.dart';
import '../../widgets/top_categories.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName ='/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void searchForProduct(String text){
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: text);
  }
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: Declarations.appBarGradient
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted:searchForProduct,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: (){},
                          child:  const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(Icons.search,color: Colors.black,size: 23,),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide.none
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1
                            )
                        ),
                        hintText: "Search..."

                      ),
                    ),
                  )
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15,right: 15),
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic,color: Colors.black,size: 25,),
              )

            ],
          ),
        ),
      ),

      body:   const SingleChildScrollView(
        child: Column(
          children: [
            AddressBar(),
            SizedBox(height: 10,),
            TopCategories(),
            SizedBox(height: 10,),
            CarouselImage(),
            SizedBox(height: 10,),
            DealOfDay(),
            SizedBox(height: 10,),




          ],
        ),
      ),

    );
  }
}
