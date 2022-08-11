import 'package:fluro/fluro.dart';
import 'package:sell_books_web/account.dart';
import 'package:sell_books_web/check_out_page.dart';
import 'package:sell_books_web/click_list_page.dart';
import 'package:sell_books_web/contact_us.dart';
import 'package:sell_books_web/homepage.dart';
import 'package:sell_books_web/how_to_buy.dart';
import 'package:sell_books_web/login_page.dart';
import 'package:sell_books_web/policy.dart';
import 'package:sell_books_web/registor_page.dart';
import 'package:sell_books_web/shop_list_page.dart';
import 'package:sell_books_web/thank_shop.dart';

class FluroRouters {
  static final FluroRouter router = FluroRouter();
  TransitionType transitionType = TransitionType.fadeIn;
  static Handler homeHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => const Homepage());
  static Handler loginHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          const Login_Page());
  static Handler productHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    var id = params['id']?.first;
    return Click_List_Page(
      idGet: id,
    );
  });

  static Handler regisHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          const Registor_Page());
  static Handler cartHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Shop_List_Page());
  static Handler checkOutHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          const CheckOutPage());
  static Handler contactHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Contact_US());
  static Handler acHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => const Account());
  static Handler thankyouHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          const ThankyouShop());
  static Handler storyBuyHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          const ThankyouShop());
  static Handler howTobuyHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          const HowToBuyPage());
  static Handler policyHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) =>
          const PolicyPage());

  static void setupRouter() {
    router.define('/',
        handler: homeHandler, transitionType: TransitionType.native);
    router.define('/login',
        handler: loginHandler, transitionType: TransitionType.native);
    router.define('/registor',
        handler: regisHandler, transitionType: TransitionType.native);
    router.define('/cart',
        handler: cartHandler, transitionType: TransitionType.native);
    router.define('/checkout',
        handler: checkOutHandler, transitionType: TransitionType.native);
    router.define('/contact_us',
        handler: contactHandler, transitionType: TransitionType.native);
    router.define('/account',
        handler: acHandler, transitionType: TransitionType.native);
    router.define('/history',
        handler: storyBuyHandler, transitionType: TransitionType.native);
    router.define('/thankyou',
        handler: thankyouHandler, transitionType: TransitionType.native);
    router.define('/product',
        handler: productHandler, transitionType: TransitionType.native);
    router.define('/how_to_buy',
        handler: howTobuyHandler, transitionType: TransitionType.native);
    router.define('/policy',
        handler: policyHandler, transitionType: TransitionType.native);
  }
}
