import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get_storage/get_storage.dart';

void goLogOut(context) {
  final box = GetStorage();
  box.write("login", false);

  Navigator.pushNamed(context, "/");
}

Widget getCateMain(BuildContext context, String pageshow) {
  return Column(
    children: [
      Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 101, 188, 231),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        height: 50,
        width: double.infinity,
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.account_circle_sharp,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              Text(
                "บัญชีของฉัน",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                child: Container(
                  color: pageshow == "account"
                      ? const Color.fromARGB(255, 226, 238, 248)
                      : null,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: InkWell(
                      onTap: (() {
                        Navigator.of(context).pushNamed("/account");
                      }),
                      child: const Text(
                        "ข้อมูลของฉัน",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  height: 1,
                  color: Colors.black12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                child: Container(
                  color: pageshow == "his"
                      ? const Color.fromARGB(255, 226, 238, 248)
                      : null,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: InkWell(
                      onTap: (() {
                        Navigator.of(context).pushNamed("/history");
                      }),
                      child: const Text(
                        "ประวัติการสั่งซื้อ",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  height: 1,
                  color: Colors.black12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                child: Container(
                  color: pageshow == "chp"
                      ? const Color.fromARGB(255, 226, 238, 248)
                      : null,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: InkWell(
                      onTap: (() {
                        Navigator.of(context).pushNamed("/change_password");
                      }),
                      child: const Text(
                        "ตั้งค่ารหัสผ่าน",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  height: 1,
                  color: Colors.black12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: InkWell(
                  onTap: () {
                    goLogOut(context);
                  },
                  child: const Text(
                    "ออกจากระบบ",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget getContMenuAc(BuildContext context, String pageshow) {
  if (pageshow == "account") {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 71, 181, 236),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 10),
          child: Row(children: const [
            Icon(
              Icons.folder,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Text(
                "ข้อมูลของฉัน",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            )
          ]),
        ),
      ),
    );
  } else {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/account");
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Row(children: const [
          Icon(
            Icons.folder,
            color: Color.fromARGB(255, 141, 140, 140),
          ),
        ]),
      ),
    );
  }
}

Widget getContMenuhis(BuildContext context, String pageshow) {
  if (pageshow == "his") {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 71, 181, 236),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 10),
          child: Row(children: const [
            Icon(
              Icons.history,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Text(
                "ประวัติการสั่งซื้อ",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            )
          ]),
        ),
      ),
    );
  } else {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/history");
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Row(children: const [
          Icon(
            Icons.history,
            color: Color.fromARGB(255, 141, 140, 140),
          ),
        ]),
      ),
    );
  }
}

Widget getContMenuCPW(BuildContext context, String pageshow) {
  if (pageshow == "chp") {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 71, 181, 236),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 13, right: 13, top: 10, bottom: 10),
          child: Row(children: const [
            Icon(
              Icons.key,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Text(
                "เปลี่ยนรหัสผ่าน",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            )
          ]),
        ),
      ),
    );
  } else {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/change_password");
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Row(children: const [
          Icon(
            Icons.key,
            color: Color.fromARGB(255, 141, 140, 140),
          ),
        ]),
      ),
    );
  }
}

BootstrapCol getMobileCate(BuildContext context, String pageshow) {
  return BootstrapCol(
    invisibleForSizes: ' lg xl',
    sizes: 'col 12',
    child: Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        getContMenuAc(context, pageshow),
        getContMenuhis(context, pageshow),
        getContMenuCPW(context, pageshow),
        InkWell(
          onTap: () {
            goLogOut(context);
          },
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Row(children: const [
              Icon(
                Icons.logout,
                color: Colors.redAccent,
              ),
            ]),
          ),
        )
      ]),
    ),
  );
}
