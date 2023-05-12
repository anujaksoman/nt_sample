import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nt_sample/controller/homepage_controller.dart';

import 'news_details.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.withOpacity(0.7),
        title: Text("NY Times Most Popular"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      //Here we can see the leading property is null in AppBar
      drawer: Drawer(),
      body: Container(
          child: Obx(
        () => homeController.homeLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : homeController.homeData.value.results!.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeController.homeData.value.results!.length,
                    itemBuilder: (context,index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(NewsDetails(data:homeController.homeData.value.results![index]));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: CircleAvatar(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("${homeController.homeData.value.results?[index].title}",
                                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${homeController.homeData.value.results?[index].section}"),
                                            Text("${homeController.homeData.value.results?[index].publishedDate}")
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child:
                                        Icon(Icons.arrow_forward_ios_rounded),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : Container(
                    child: Center(
                      child: Text(
                        "No data found",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
      )),
    );
  }
}
