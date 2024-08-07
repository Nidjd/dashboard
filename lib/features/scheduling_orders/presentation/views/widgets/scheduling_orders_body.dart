import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchedulingOrdersBody extends StatefulWidget {
  const SchedulingOrdersBody({super.key});

  @override
  State<SchedulingOrdersBody> createState() => _SchedulingOrdersBodyState();
}

class _SchedulingOrdersBodyState extends State<SchedulingOrdersBody> {
  TimeOfDay selectedFirstTime = TimeOfDay.now();
  TimeOfDay selectedSecondTime = TimeOfDay.now();
  DateTime selectedFirstDate = DateTime.now();
  DateTime selectedSecondDate = DateTime.now();
  TextEditingController firstDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  Future<DateTime> _selectDate(
      BuildContext context, DateTime selectedFirstDatee) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedFirstDatee,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedFirstDatee) {
      setState(() {
        selectedFirstDatee = picked;
        firstDate.text = "${selectedFirstDatee.toLocal()}".split(' ')[0];
        // print(selectedFirstDatee);
        // print(selectedFirstDate);
        // print(selectedSecondDate);
      });
    }
    return selectedFirstDatee;
  }

  Future<TimeOfDay> selectTime(
      BuildContext context, TimeOfDay pickedTime) async {
    TimeOfDay? pickedTimefirst;

    pickedTimefirst = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 20, minute: 47),
    );
    if (pickedTimefirst != null) {
      setState(() {
        pickedTime = pickedTimefirst!;
        // endDate.text = "${selectedSecondDate.toLocal()}".split(' ')[0];
      });
    }
    return pickedTime;
  }

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
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                          backgroundColor:
                                              Colors.white.withOpacity(0.5),
                                          child: SizedBox(
                                              width: size.width * 0.6,
                                              height: size.height * 0.4,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.28,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                "${selectedFirstTime.hour.toString()}"
                                                                        ":"
                                                                        "${selectedFirstTime.hour.toString()}"
                                                                    .split(
                                                                        ' ')[0],
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20.0,
                                                              ),
                                                              ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  selectedFirstTime =
                                                                      await selectTime(
                                                                          context,
                                                                          selectedFirstTime);
                                                                  print(
                                                                      "=========");
                                                                  print(
                                                                      "الوقت الاول");
                                                                  print(
                                                                      "${selectedFirstTime.format(context).substring(0, 4)} ");

                                                                  print(
                                                                      "=========");
                                                                },
                                                                child: const Text(
                                                                    'اختر الوقت'),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.28,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                "${"${selectedFirstDate.toLocal()}".split(' ')[0]}"
                                                                    .split(
                                                                        ' ')[0],
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20.0,
                                                              ),
                                                              ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  selectedFirstDate =
                                                                      await _selectDate(
                                                                          context,
                                                                          selectedFirstDate);
                                                                  print(
                                                                      "=============");
                                                                  print(
                                                                      "التاريخ الاول ");
                                                                  print(
                                                                      "${selectedFirstDate.toLocal()}");

                                                                  print(
                                                                      "=========");
                                                                },
                                                                child: const Text(
                                                                    'اختر التاريخ الأول'),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.28,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                "${selectedSecondTime.hour.toString()}"
                                                                        ":"
                                                                        "${selectedSecondTime.minute.toString()}"
                                                                    .split(
                                                                        ' ')[0],
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20.0,
                                                              ),
                                                              ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  selectedSecondTime =
                                                                      await selectTime(
                                                                          context,
                                                                          selectedSecondTime);

                                                                  print(
                                                                      "=========");
                                                                  print(
                                                                      "الوقت الثاني ");
                                                                  print(
                                                                      "${selectedSecondTime.format(context).substring(0, 4)} ");

                                                                  print(
                                                                      "=========");
                                                                },
                                                                child: const Text(
                                                                    'اختر الوقت'),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0.0),
                                                        child: SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.28,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                "${"${selectedSecondDate.toLocal()}".split(' ')[0]}"
                                                                    .split(
                                                                        ' ')[0],
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 20.0,
                                                              ),
                                                              ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  selectedSecondDate =
                                                                      await _selectDate(
                                                                          context,
                                                                          selectedSecondDate);
                                                                  print(
                                                                      "=============");
                                                                  print(
                                                                      "التاريخ الثاني  ");
                                                                  print(
                                                                      "${selectedSecondDate.toLocal()}");

                                                                  print(
                                                                      "=========");
                                                                },
                                                                child: const Text(
                                                                    'اختر التاريخ الثاني'),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )));
                                    });
                              },
                              icon: const Icon(
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
