import 'package:flutter/material.dart';

class SchedulingOrdersBody extends StatelessWidget {
  const SchedulingOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: SizedBox(
            width: size.width,
            child: const Text(
              "جدولة الطلبات  ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            )),
      ),
      Expanded(
          child: Container(
              width: 1250,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.1,
                        child: const Text(
                          "رقم العميل  ",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        child: const Text(
                          "معرف الفريق",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.2,
                        child: const Text(
                          "الأيام المناسبة لقدوم فريق العمل ",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.2,
                        child: const Text(
                          "ملاحظات",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                        child: const Text(
                          "",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
                Expanded(
                    child: ListView(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.1,
                          child: Text(
                            "0959636242",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                          child: Padding(
                            padding: EdgeInsets.only(right: size.width * 0.02),
                            child: Text(
                              "5",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                          child: Text(
                            "جمعة, سبت ,احد ,اثنين",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                          child: Text(
                            "الجهاز لا يقوم بالتشغيل، الشاشة لا تعرض أي شيء، وأحيانًا يصدر صوت طنين غريب",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                            width: size.width * 0.02,
                            child: IconButton(
                              onPressed: () async {},
                              icon: Icon(
                                Icons.checklist,
                                color: Colors.blue,
                                size: 20,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade100,
                    height: 20,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),
                ]))
              ])))
    ]));
  }
}
