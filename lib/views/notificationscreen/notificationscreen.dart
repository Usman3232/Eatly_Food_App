import 'package:eatly_foodapp/utils/aut_btn.dart';
import 'package:eatly_foodapp/utils/constants.dart';
import 'package:eatly_foodapp/views/notificationscreen/components/delivery.dart';
import 'package:eatly_foodapp/views/notificationscreen/components/newsandupdates.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                        height: SizeConfig.heightMultiplier * 6.5,
                        width: SizeConfig.widthMultiplier * 13,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        )),
                    Spacer(),
                    Container(
                      height: SizeConfig.heightMultiplier * 6.5,
                      width: SizeConfig.widthMultiplier * 13,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/images/me.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primarycolor, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  child: TabBar(
                    unselectedLabelColor: AppColors.primarycolor,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(
                        text: 'Delivery',
                      ),
                      Tab(
                        text: 'News&Updates',
                      )
                    ],
                    unselectedLabelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                      color: AppColors.primarycolor,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    // indicatorWeight: 2,
                    // padding: const EdgeInsets.only(bottom: 7),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: SizeConfig.widthMultiplier * 100,
                  height: SizeConfig.heightMultiplier * 80,
                  child: TabBarView(
                    controller: _tabController,
                    children: [Delivery(), NewsAndUpdates()],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
