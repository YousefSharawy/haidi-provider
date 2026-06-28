import 'dart:convert';

import 'package:base_flutter/general/utilities/http/dio/http/GenericHttp.dart'
    show ReturnType;

/// DEMO / OFFLINE MODE
/// ------------------
/// While the real backend (`ApiNames.baseUrl`) is unavailable, API calls return
/// null. This provider substitutes broad placeholder data so the whole app flow
/// completes and screens render content instead of crashing or showing blank.
///
/// It only kicks in when a call actually returns null, so the moment a live
/// backend starts responding, real data flows through and this is bypassed.
/// Set [enabled] = false (or delete this) once the backend is connected.
class MockApi {
  static const bool enabled = false;

  /// LOGIN-ONLY BYPASS (testing). The test provider account is fully set up but
  /// the backend's `login` endpoint refuses it with "Awaiting management
  /// approval" (confirmedByDashboard=false). Only the login endpoint enforces
  /// that gate — the account's real token works on every other endpoint. So
  /// when this is true the login is short-circuited with a real login payload
  /// (real token from activation), and the WHOLE REST of the app keeps using
  /// the live API authenticated with that token. Set false once the account is
  /// approved by the dashboard (then real login works normally).
  static const bool mockLoginOnly = false;

  /// A real provider login response (real, non-expired token) used only when
  /// [mockLoginOnly] is true. Categories/workdates are non-empty and
  /// activedByCode=true, so login routes straight to Home.
  static Map<String, dynamic> loginResponse() =>
      json.decode(_loginJson) as Map<String, dynamic>;

  static const String _loginJson =
      r'''{"id": "43c69c96-14d7-4d1c-936d-840d13631866", "userName": "SpaTester", "placeName": "Spa Test Center", "email": "spatest1782632541@example.com", "phone": "0503334455", "lang": "en", "isAvilable": true, "imgProfile": "https://63.181.125.139/images/Users/7a32e99bfd5e4b7d890406ae74bbda51.jpg", "commercialRecord": "https://63.181.125.139/", "taxRecord": "https://63.181.125.139/", "cityId": 1, "cityName": "Riyadh", "description": "Spa demo provider", "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJTcGFUZXN0ZXIiLCJ1c2VyX2lkIjoiNDNjNjljOTYtMTRkNy00ZDFjLTkzNmQtODQwZDEzNjMxODY2IiwidHlwZV91c2VyIjoicHJvdmlkZXIiLCJleHAiOjE4MTQxNzI2ODEsImlzcyI6IlNpdGUiLCJhdWQiOiJTaXRlIn0.V5cYY1Jlz8xymGRlNMVKQ5ShJFsRpPnVVoXp44urBlw", "lat": "24.7136", "lng": "46.6753", "location": "Riyadh", "logo": "https://63.181.125.139/images/Users/7a32e99bfd5e4b7d890406ae74bbda51.jpg", "typeUser": 2, "workdates": [{"id": 1, "day": 1, "startHour": "9:00 AM", "endHour": "5:00 PM", "isClosed": false, "providerId": "43c69c96-14d7-4d1c-936d-840d13631866"}, {"id": 2, "day": 2, "startHour": "9:00 AM", "endHour": "5:00 PM", "isClosed": false, "providerId": "43c69c96-14d7-4d1c-936d-840d13631866"}, {"id": 3, "day": 3, "startHour": "9:00 AM", "endHour": "5:00 PM", "isClosed": false, "providerId": "43c69c96-14d7-4d1c-936d-840d13631866"}, {"id": 4, "day": 4, "startHour": "9:00 AM", "endHour": "5:00 PM", "isClosed": false, "providerId": "43c69c96-14d7-4d1c-936d-840d13631866"}, {"id": 5, "day": 5, "startHour": "9:00 AM", "endHour": "5:00 PM", "isClosed": false, "providerId": "43c69c96-14d7-4d1c-936d-840d13631866"}, {"id": 6, "day": 6, "startHour": "9:00 AM", "endHour": "5:00 PM", "isClosed": false, "providerId": "43c69c96-14d7-4d1c-936d-840d13631866"}, {"id": 7, "day": 7, "startHour": "9:00 AM", "endHour": "5:00 PM", "isClosed": false, "providerId": "43c69c96-14d7-4d1c-936d-840d13631866"}], "mainCategories": [{"id": 47, "title": "Spa", "taxRecord": "https://63.181.125.139/", "commercialNumber": "https://63.181.125.139/"}, {"id": 48, "title": "Market", "taxRecord": "https://63.181.125.139/", "commercialNumber": "https://63.181.125.139/"}], "activedByCode": true, "confirmedByDashboard": false, "workDocumenrIsUploded": true}''';

  static int _seed = 0;

  /// Ever-incrementing so every generated record gets a UNIQUE id. (`_seed`
  /// cycles 1-6 for display variety, which would make several rows in a list
  /// share an id — then `removeWhere((e) => e.id == id)` on delete would wipe
  /// every row with that id, not just one.)
  static int _uid = 1000;

  /// A single placeholder record with a wide superset of fields that the app's
  /// many models look for. Models' fromJson pick the keys they know and ignore
  /// the rest (their fromJson are null-tolerant).
  static Map<String, dynamic> item() {
    final i = (_seed++ % 6) + 1;
    final uid = _uid++; // unique per record (id/orderId/productId used in removeWhere)
    final img = 'https://picsum.photos/seed/$i/400/400';
    return {
      'id': uid,
      'userId': i,
      'categoryId': i,
      'subCategoryId': i,
      'productId': uid,
      'orderId': uid,
      'name': 'Sample $i',
      'nameAr': 'نموذج $i',
      'nameEn': 'Sample $i',
      'userName': 'Demo User $i',
      'clientName': 'Demo Client $i', // orders list card label
      'servicesCount': i, // orders list card: number of services/items
      // common name-field variants different models read
      'providerName': 'Demo Provider $i',
      'placeName': 'Demo Place $i',
      'storeName': 'Demo Store $i',
      'workshopName': 'Demo Workshop $i',
      'serviceName': 'Demo Service $i',
      'serviceTitle': 'Demo Service $i', // ServiceOrderDetailsModel reads serviceTitle
      'productName': 'Demo Product $i',
      'categoryName': 'Demo Category $i',
      'categoryNameAr': 'فئة $i',
      'categoryNameEn': 'Demo Category $i',
      'subCategoryName': 'Demo Subcategory $i',
      'fullName': 'Demo User $i',
      'displayName': 'Demo $i',
      'title': 'Placeholder $i',
      'subTitle': 'Demo subtitle',
      'desc': 'Placeholder content shown while the API is offline.',
      'description': 'Placeholder content shown while the API is offline.',
      'descriptionAr': 'محتوى تجريبي يظهر بينما الخدمة غير متصلة.',
      'descriptionEn': 'Placeholder content shown while the API is offline.',
      'details': 'Placeholder details.',
      'content': 'Placeholder content.',
      'address': 'Sample address $i, Riyadh',
      'location': 'Sample address $i, Riyadh',
      'image': img,
      'img': img,
      'providerImage': img,
      'mainImage': img,
      'coverImage': img,
      'cover': img,
      'thumbnail': img,
      'icon': 'https://picsum.photos/seed/ic$i/120/120',
      'imgProfile': 'https://picsum.photos/seed/u$i/200/200',
      'logo': 'https://picsum.photos/seed/lg$i/200/200',
      'images': [img, 'https://picsum.photos/seed/${i}b/400/400'],
      'price': 100 + i,
      'servicePrice': 100 + i, // ServiceOrderDetailsModel reads servicePrice
      'oldPrice': 120 + i,
      'totalPrice': 100 + i,
      'total': 100 + i,
      'delivery': 15, // edit-product screen reads model.delivery
      'discount': 0,
      'count': i,
      'quantity': 1,
      'rate': 4,
      'rating': 4.0,
      'ratingCount': 12,
      'lat': '24.7136',
      'lng': '46.6753',
      'phone': '0500000000',
      'mobile': '0500000000',
      'phoneNumber': '0500000000', // OrderDetailsModel reads json['phoneNumber']
      // Order DETAILS model reads this as a String (shown verbatim); the orders
      // LIST model reads it as an int code (0=Wallet,1=Visa,2=Mada,3=Sadad) and
      // its guard maps this non-int to code 1 -> both render "Visa" consistently.
      'paymentType': 'Visa',
      'email': 'demo$i@example.com',
      'date': '2026-01-01',
      'time': '12:00',
      'orderDate': '2026-01-01', // ServiceOrderDetailsModel reads orderDate/orderTime
      'orderTime': '12:00',
      'status': 1,
      'statusName': 'Active',
      'state': 'active',
      'isActive': true,
      'active': true,
      'isFavorite': false,
      'type': 1,
      'typeUser': 1,
      'serviceCart': false,
      'productCart': false,
      'token': 'demo-token',
      'cityId': i,
      'cityName': 'Riyadh',
      'country': 'SA',
      'lang': 'ar',
      'body': 'Placeholder notification body.',
      'message': 'Placeholder message.',
      'text': 'Placeholder notification',
      // NOTE: 'notifications' is intentionally a LIST (HomeModel does
      // notifications.forEach). SettingModel reads it as an int count and
      // degrades gracefully to an empty model if so. Defined once below.
      'orderServiceCount': 3,
      'orderProductCount': 2,
      'ordersCount': 3,
      'orderstatus': 0,
      'ordertype': 1,
      // non-empty so guards like `model.mainCategories!.isEmpty` pass and the
      // login flow proceeds to Home instead of an onboarding sub-step.
      'mainCategories': <dynamic>[<String, dynamic>{}],
      'workdates': <dynamic>[<String, dynamic>{}],
      'workDates': <dynamic>[<String, dynamic>{}],
      'categories': <dynamic>[<String, dynamic>{}],
      // social links need url + img (model reads `img`)
      'sociaMedias': <dynamic>[
        {
          'id': 1,
          'name': 'Demo',
          'url': 'https://example.com',
          'img': 'https://picsum.photos/seed/sm/80/80',
          'image': 'https://picsum.photos/seed/sm/80/80',
          'icon': 'https://picsum.photos/seed/sm/80/80'
        }
      ],
      // order/detail/cart/search item lists (screens force-unwrap + index these)
      'orderProducts': <dynamic>[_subItem(), _subItem()],
      'orderServices': <dynamic>[_subItem(), _subItem()],
      'orderItems': <dynamic>[_subItem(), _subItem()],
      'cartProducts': <dynamic>[_subItem()],
      'cartServices': <dynamic>[_subItem()],
      'productsInCart': <dynamic>[_subItem(), _subItem()],
      'searchResult': <dynamic>[_subItem(), _subItem(), _subItem()],
      // other nested collections default to empty so `.map`/`.length` never hit null
      'data': <dynamic>[],
      'items': <dynamic>[],
      'products': <dynamic>[],
      'services': <dynamic>[],
      'children': <dynamic>[],
      'subCategories': <dynamic>[],
      'offers': <dynamic>[],
      // product features (edit-product screen does `model.features!.forEach`;
      // a null here would throw in initState and white-screen the edit page).
      'features': <dynamic>[
        {'id': 1, 'featureAr': 'ميزة 1', 'featureEn': 'Feature 1'},
        {'id': 2, 'featureAr': 'ميزة 2', 'featureEn': 'Feature 2'},
      ],
      'reviews': <dynamic>[],
      'rates': <dynamic>[],
      'ads': <dynamic>[],
      'advertisements': <dynamic>[],
      'orders': <dynamic>[],
      'banners': <dynamic>[],
      'sliders': <dynamic>[],
      'notificationsModel': <dynamic>[],
      'notifications': <dynamic>[
        {'id': 1, 'text': 'Demo notification 1', 'orderId': 1, 'orderstatus': 0, 'ordertype': 1},
        {'id': 2, 'text': 'Demo notification 2', 'orderId': 2, 'orderstatus': 0, 'ordertype': 0},
      ],
      'addresses': <dynamic>[],
      'options': <dynamic>[],
      'gallery': <dynamic>[],
    };
  }

  /// A compact record for nested order/cart/detail item lists.
  static Map<String, dynamic> _subItem() {
    final i = (_seed++ % 6) + 1;
    final uid = _uid++; // unique per nested row (cart/order-item removal by id)
    final img = 'https://picsum.photos/seed/p$i/300/300';
    return {
      'id': uid,
      'productId': uid,
      'serviceId': uid,
      'productTitle': 'Demo Product $i',
      'serviceTitle': 'Demo Service $i',
      'productName': 'Demo Product $i',
      'serviceName': 'Demo Service $i',
      'name': 'Demo Item $i',
      'title': 'Demo Item $i',
      'orderDate': '2026-01-01', // OrderProducts reads json['orderDate']
      'orderTime': '12:00', // customer OrderServices reads json['orderTime']
      'orderId': i, // customer OrderServices reads json['orderId']
      'quntity': 1, // OrderProducts reads json['quntity'] (typo'd key in model)
      'servicePrice': 100 + i, // customer ServiceDetailsItem reads servicePrice! (force-unwrap)
      'productImage': img,
      'serviceImage': img,
      'image': img,
      'img': img,
      'icon': img,
      'count': 1,
      'quantity': 1,
      'price': 100 + i,
      'totalPrice': 100 + i,
      'total': 100 + i,
      'rate': 4,
      'status': 1,
      'options': <dynamic>[],
      'attributes': <dynamic>[],
    };
  }

  static List<Map<String, dynamic>> list([int n = 5]) =>
      List.generate(n, (_) => item());

  /// Builds a placeholder response body shaped like the real API
  /// (`{ status, message, data }`) so the existing `returnDataFun` extractors
  /// (`(d) => d["data"]`) keep working unchanged.
  /// A user-shaped placeholder with the exact field types the (strict,
  /// json_serializable) UserModel expects: String id, non-empty
  /// mainCategories/workdates whose items carry an int id.
  static Map<String, dynamic> userItem() => {
        'id': '1', // UserModel.id is a non-nullable String
        'userName': 'Demo User',
        'placeName': 'Demo Place',
        'email': 'demo@example.com',
        'phone': '0500000000',
        'lang': 'ar',
        'token': 'demo-token',
        'imgProfile': 'https://picsum.photos/seed/u/200/200',
        'logo': 'https://picsum.photos/seed/lg/200/200',
        'cityId': 1,
        'typeUser': 1,
        'cityName': 'Riyadh',
        'location': 'Riyadh',
        'lat': '24.7136',
        'lng': '46.6753',
        'description': 'Demo description',
        'commercialRecord': '123456',
        'taxRecord': '123456',
        'isAvilable': true,
        'activeCode': true, // customer login reads `data['activeCode']` as bool
        'activedByCode': true,
        'confirmedByDashboard': true,
        'isActive': true,
        'active': true,
        // non-empty (so onboarding guards pass) with int ids (Workdate/MainCategorie)
        'mainCategories': [
          {'id': 1, 'title': 'Demo Category'}
        ],
        // 7 entries (one per weekday) - the WorkDates screen indexes [0..6]
        'workdates': List.generate(
            7,
            (d) => {
                  'id': d + 1,
                  'day': d,
                  'startHour': '09:00',
                  'endHour': '17:00',
                  'isClosed': false,
                }),
      };

  static dynamic bodyFor(ReturnType returnType) {
    switch (returnType) {
      case ReturnType.List:
        return {'status': true, 'message': 'ok', 'data': list()};
      case ReturnType.Model:
        return {'status': true, 'message': 'ok', 'data': item()};
      case ReturnType.Type:
        // Used by auth (login does `UserModel.fromJson(wholeBody)`): spread the
        // user fields at top level AND nest under "data" for `(d) => d["data"]`.
        // Also carries single-text content keys that About/Terms-style screens
        // extract directly (e.g. `(d) => d["aboutUs"]`, `(d) => d["condtions"]`).
        final u = userItem();
        const content =
            'This is placeholder content shown while the API is offline.\n\n'
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do '
            'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim '
            'ad minim veniam, quis nostrud exercitation ullamco laboris.';
        return {
          ...u,
          'data': u,
          'status': true,
          'message': 'ok',
          'aboutUs': content,
          'about': content,
          'condtions': content, // matches the app's (typo'd) key
          'conditions': content,
          'terms': content,
          'privacy': content,
          'policy': content,
          'description': content,
          'text': content,
          'content': content,
          'wallet': 250, // balance shown on the wallet screen
          'msg': 'ok',
        };
    }
  }
}
