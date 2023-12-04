import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertest/api/local_service.dart';
import 'package:fluttertest/page/main/controller_main.dart';
import 'package:fluttertest/route/route_names.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PageMain extends GetView<ControllerMain>{
  const PageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0ED),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(
                    width: 90,
                    height: 90,
                    image: AssetImage('assets/images/logo_black.png')
                ),
                RichText(
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Helvetica Bold',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Making memories"
                          ),
                          TextSpan(
                              text: " of those\ngiving their best",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Helvetica',
                              )
                          ),
                        ]
                    )
                ),
                const Spacer(),
                InkWell(
                  onTap: ()async{
                    var sample = await LocalService().getLoginStatus();
                    log(controller.isLogin.toString());
                    log(sample.toString());
                  },
                  child: const Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.black87,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
          Obx(() => Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: Get.width,
              height: controller.isLogin == true ? Get.height * 0.8 : Get.height * 0.75,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18)
                  )
              ),
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 3));
                  controller.items.clear();
                  controller.getRecent();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: controller.isLogin == true ? true : false,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            children: <Widget>[
                              const Image(
                                width: 70,
                                height: 70,
                                image: AssetImage('assets/images/sample_user.png'),
                              ),
                              const SizedBox(width: 10),
                              RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontFamily: 'Helvetica'
                                      ),
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text: 'Welcome back\n'
                                        ),
                                        TextSpan(
                                            text: controller.controllerUser.user.value.fullname == ''
                                                ? 'Adha wiyana'
                                                : controller.controllerUser.user.value.fullname,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black87,
                                                fontFamily: 'Helvetica'
                                            )
                                        ),
                                      ]
                                  )
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.account_balance_wallet_rounded, color: Color(0XFFE1D3C9)),
                                      const SizedBox(width: 5),
                                      Text(
                                        'Rp ${controller.controllerUser.user.value.wallet}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Helvetica Bold',
                                            color: Color(0XFFA67C52)
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: const Text(
                                      'Top Up',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Helvetica Bold',
                                          color: Color(0XFFE1D3C9)
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Visibility(
                        visible: controller.isLogin == true ? true : false,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Divider(
                            color: Colors.grey.shade400,
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 50,
                        width: Get.width,
                        margin: EdgeInsets.fromLTRB(20, controller.isLogin == true ? 20 : 50, 20, 20),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xFFF4F0ED),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 12
                          ),
                          decoration: const InputDecoration(
                              hintText: 'Search',
                              suffixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.grey
                              ),
                              hintStyle: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 12
                              ),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Services',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: 'Helvetica Bold',
                              ),
                            ),
                            Image(
                                width: 20,
                                height: 20,
                                image: AssetImage('assets/images/chevron.png')
                            )
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        width: Get.width,
                        height: Get.height * 0.35,
                        child: GridView.builder(
                          itemCount: controller.listService.length,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5
                          ),
                          itemBuilder: (context, index) => Card(
                            elevation: 5,
                            color: controller.listService[index]['color'] as Color,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.listService[index]['feature_name'].toString(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'Helvetica Bold',
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Image(
                                        height: 95,
                                        fit: BoxFit.fitHeight,
                                        alignment: Alignment.centerRight,
                                        image: AssetImage(controller.listService[index]['img'].toString())
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Recent Event',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Helvetica Bold',
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: controller.items.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      width: Get.width,
                                      fit: BoxFit.cover,
                                      height: Get.height * 0.3,
                                      imageUrl: controller.items[index].coverImage ?? '',
                                      errorWidget: (context, url, error) {
                                        return Image(
                                            width: Get.width,
                                            fit: BoxFit.cover,
                                            height: Get.height * 0.3,
                                            image: const AssetImage('assets/images/news_sample.png')
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      controller.items[index].name ?? 'Basketball Junior Drums League - BasketballCompetition 2022',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontFamily: 'Helvetica Bold',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      controller.items[index].description ?? 'Warriors vs Lakers (ini event name)',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: 'Helvetica',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: Text(
                                      DateFormat('MMMM dd, yyyy').format(controller.items[index].dateStart ?? DateTime.now()),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontFamily: 'Helvetica',
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
          Obx(() => Visibility(
            visible: controller.isLogin == true ? false : true,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 120),
                child: ElevatedButton(
                    onPressed: ()=> Get.toNamed(Routes.WELCOME),
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: const Color(0XFFA67C52),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        fixedSize: Size(Get.width * 0.8, Get.height * 0.06)
                    ),
                    child: const Text(
                      'Login / Sign Up',
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          color: Colors.white,
                          fontSize: 12
                      ),
                    )
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}