import 'package:flutter/material.dart';

Widget dialogErr(context, String txtShow) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    content: Builder(
      builder: (context) {
        return SizedBox(
          height: 260,
          width: 350,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image.asset(
                      "images/cross.png",
                      width: 90,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'ไม่สามารถดำเนินการได้',
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: "Prompt",
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      txtShow,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Prompt",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        textStyle:
                            const TextStyle(fontSize: 18, fontFamily: "Prompt"),
                        primary: const Color.fromARGB(255, 101, 188, 231)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, "/cart");
                    },
                    child: const Text('ตกลง'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget dialogErrAll(context, String txtShow) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    content: Builder(
      builder: (context) {
        return SizedBox(
          height: 260,
          width: 350,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image.asset(
                      "images/cross.png",
                      width: 90,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'ไม่สามารถดำเนินการได้',
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: "Prompt",
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      txtShow,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Prompt",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        textStyle:
                            const TextStyle(fontSize: 18, fontFamily: "Prompt"),
                        primary: const Color.fromARGB(255, 101, 188, 231)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('ตกลง'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget dialogSuccessPay(context, String txtShow) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    content: Builder(
      builder: (context) {
        return SizedBox(
          height: 260,
          width: 350,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image.asset(
                      "images/checked.png",
                      width: 90,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'ดำเนินการเสร็จสิ้น',
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: "Prompt",
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      txtShow,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Prompt",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        textStyle:
                            const TextStyle(fontSize: 18, fontFamily: "Prompt"),
                        primary: const Color.fromARGB(255, 101, 188, 231)),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text('ตกลง'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Widget dialogQrcode(context, String urlImg) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    content: Builder(
      builder: (context) {
        return SizedBox(
          height: 600,
          width: 350,
          child: Stack(
            children: [
              Image.network(
                urlImg,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        textStyle:
                            const TextStyle(fontSize: 18, fontFamily: "Prompt"),
                        primary: const Color.fromARGB(255, 223, 73, 73)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('ยกเลิก'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
