import 'package:e_shopping/data/comment.dart';
import 'package:e_shopping/data/notification.dart';
import 'package:e_shopping/data/user.dart';

import 'data/category.dart';
import 'data/product.dart';

const String menLookRightImageUrl = 'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/man-look-right.jpg';
const String petsImageUrl = 'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/pet.jpg';
const String womenLookLeftImageUrl = 'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/woman-look-left.jpg';

Category menCategory = Category(title: "Men", selections: [
  "Shirts",
  "Jeans",
  "Shorts",
]);
Category womenCategory = Category(title: "Women", selections: [
  "Shirts",
  "Jeans",
]);
Category petCategory = Category(title: "Pets", selections: [
  "Toys",
  "Treats",
]);

List<UserModel> users = [
  UserModel.fromJson({
    "id": 3,
    "account": "GiGiTsaDa",
    "user_name": "Neymar.jr",
    "profile": "https://www.personality-database.com/profile_images/44140.png",
  }),
  UserModel.fromJson({
    "id": 4,
    "account": "t021wqd",
    "user_name": "Sasha",
    "profile": "https://i.pinimg.com/564x/85/d7/76/85d776c6a75b4ba98e98b631bdda7852.jpg",
  }),
  UserModel.fromJson({
    "id": 5,
    "account": "jcCrazy23",
    "user_name": "智輝",
    "profile": "https://64.media.tumblr.com/5d5183c5210f4fa06d80a9925b1f1e86/e973c9806d4e5c96-1e/s1280x1920/6dfa401cae85c837ddf3a1865741f23b057ce6a4.jpg",
  }),
  UserModel.fromJson({
    "id": 6,
    "account": "zombie235",
    "user_name": "Zombie",
    "profile": "https://upload.wikimedia.org/wikipedia/commons/5/58/CheHigh.jpg",
  }),
];

List<CommentModel> comments = [
  CommentModel(
    user: users[1],
    createTime: "2021-04-06 15:22:23",
    productID: 1,
    comment: "這衣服好醜",
    star: 2,
  ),
  CommentModel(
    user: users[2],
    createTime: "2021-04-29 08:53:14",
    productID: 1,
    comment: "台灣獨立!",
    star: 5,
  ),
  CommentModel(
    user: users[3],
    createTime: "2021-05-21 11:24:20",
    productID: 1,
    comment: "還不錯只是穿起來有新疆的味道",
    star: 4,
  ),
  CommentModel(
    user: users[0],
    createTime: "2021-08-05 06:24:20",
    productID: 1,
    comment: "好啦，給你個好評",
    star: 5,
  ),
];

List<Product> products = [
  Product(
    productID: 1,
    name: "2-Pack Crewneck T-Shirts - Black",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/71UqhKT2MDL._AC_UX466_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81K7OAepB9L._AC_UX466_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/812T%2Bu00R4L._AC_UX466_.jpg"
    ],
    cost: 12.99,
    category: menCategory,
    productType: "shirts",
    sizes: ["S", "M", "L", "XL"],
  ),
  Product(
    productID: 2,
    name: "Short Sleeve Henley - Blue",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/81tpGc13OgL._AC_UX522_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81oNSlos2tL._AC_UY679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/819ea2vQIjL._AC_UY679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/91SH0RB-8dL._AC_UY606_.jpg"
    ],
    cost: 17.99,
    category: menCategory,
    productType: "shirts",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 3,
    name: "Polo RL V-Neck",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/61m68nuygSL._AC_UX522_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/61URnzIoCPL._AC_UX522_.jpg",
    ],
    cost: 24.99,
    category: menCategory,
    productType: "shirts",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 4,
    name: "Athletic-Fit Stretch Jeans",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/91SIuLNN%2BlL._AC_UY679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/91Qpp%2BRPLtL._AC_UX522_.jpg",
    ],
    cost: 29.99,
    category: menCategory,
    productType: "jeans",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 5,
    name: "Levi's Original Jeans",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/91L4zjZKF-L._AC_UX522_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/91Mf37jbSvL._AC_UX522_.jpg",
    ],
    cost: 39.99,
    category: menCategory,
    productType: "jeans",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 6,
    name: "2-Pack Performance Shorts",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/A1lTY32j6gL._AC_UX679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/71JYOHJ%2BS-L._AC_UX522_.jpg",
    ],
    cost: 19.99,
    category: menCategory,
    productType: "shorts",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 7,
    name: "Levi's Cargo Shorts",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/915Io2JEUPL._AC_UX679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/91WJgn0FNkL._AC_UX679_.jpg",
    ],
    cost: 29.99,
    category: menCategory,
    productType: "shorts",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 8,
    name: "2-Pack Short-Sleeve Crewneck",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/911mb8PkHSL._AC_UX522_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81LDpImWPAL._AC_UX522_.jpg",
    ],
    cost: 16.99,
    category: womenCategory,
    productType: "shirts",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 9,
    name: "Waffle Knit Tunic Blouse",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/71lDML8KDQL._AC_UX522_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/61Ojm-DnojL._AC_UY679_.jpg",
    ],
    cost: 22.99,
    category: womenCategory,
    productType: "shirts",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 10,
    name: "Mid-Rise Skinny Jeans",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/71canaWSlAL._AC_UX522_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/71zLzCwbXUL._AC_UX522_.jpg",
    ],
    cost: 28.99,
    category: womenCategory,
    productType: "jeans",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 11,
    name: "Levi's Straight 505 Jeans",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/51D4eXuwKaL._AC_UX679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/51sHwN6mDzL._AC_UX679_.jpg",
    ],
    cost: 34.99,
    category: womenCategory,
    productType: "jeans",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 12,
    name: "Levi's 715 Bootcut Jeans",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/81QwSgeXHTL._AC_UX522_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81qmkt1Be0L._AC_UY679_.jpg",
    ],
    cost: 34.99,
    category: womenCategory,
    productType: "jeans",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 13,
    name: "3-Pack - Squeaky Plush Dog Toy",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/712YaF31-3L._AC_SL1000_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/71K1NzmHCfL._AC_SL1000_.jpg",
    ],
    cost: 9.99,
    category: petCategory,
    productType: "toys",
  ),
  Product(
    productID: 14,
    name: "Wobble Wag Giggle Ball",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/81XyqDXVwCL._AC_SX355_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81Ye9KrP3pL._AC_SY355_.jpg",
    ],
    cost: 11.99,
    category: petCategory,
    productType: "toys",
  ),
  Product(
    productID: 15,
    name: "Duck Hide Twists",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/51dS9c0xIdL._SX342_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81z4lvRtc5L._SL1500_.jpg",
    ],
    cost: 8.99,
    category: petCategory,
    productType: "treats",
  ),
  Product(
    productID: 16,
    name: "Zuke's Mini Training Treats",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/81LV2CHtGKL._AC_SY355_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81K30Bs9C6L._AC_SY355_.jpg",
    ],
    cost: 10.99,
    category: petCategory,
    productType: "treats",
  ),
];

List<Product> recommendProducts = [
  Product(
    productID: 11,
    name: "Levi's Straight 505 Jeans",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/51D4eXuwKaL._AC_UX679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/51sHwN6mDzL._AC_UX679_.jpg",
    ],
    cost: 34.99,
    category: womenCategory,
    productType: "jeans",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 16,
    name: "Zuke's Mini Training Treats",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/81LV2CHtGKL._AC_SY355_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81K30Bs9C6L._AC_SY355_.jpg",
    ],
    cost: 10.99,
    category: petCategory,
    productType: "treats",
  ),
  Product(
    productID: 2,
    name: "Short Sleeve Henley - Blue",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/81tpGc13OgL._AC_UX522_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81oNSlos2tL._AC_UY679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/819ea2vQIjL._AC_UY679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/91SH0RB-8dL._AC_UY606_.jpg"
    ],
    cost: 17.99,
    category: menCategory,
    productType: "shirts",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
  Product(
    productID: 1,
    name: "2-Pack Crewneck T-Shirts - Black",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/91ieWhKe9AL._AC_UX569_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/71UqhKT2MDL._AC_UX466_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/81K7OAepB9L._AC_UX466_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/812T%2Bu00R4L._AC_UX466_.jpg"
    ],
    cost: 12.99,
    category: menCategory,
    productType: "shirts",
    sizes: ["S", "M", "L", "XL"],
  ),
  Product(
    productID: 6,
    name: "2-Pack Performance Shorts",
    imageUrls: [
      "https://images-na.ssl-images-amazon.com/images/I/A1lTY32j6gL._AC_UX679_.jpg",
      "https://images-na.ssl-images-amazon.com/images/I/71JYOHJ%2BS-L._AC_UX522_.jpg",
    ],
    cost: 19.99,
    category: menCategory,
    productType: "shorts",
    sizes: ["XS", "S", "M", "L", "XL"],
  ),
];

List<NotificationModel> notifications = [
  NotificationModel(
    notificationID: 3,
    notificationType: 1,
    title: "還在煩惱要買什麼嗎?",
    short: "日常活動所需，美日鍛鍊所需",
    content: "",
    createTime: "2021-08-18 15:29:23",
  ),
  NotificationModel(
    notificationID: 2,
    notificationType: 1,
    title: "男性商品必買商品一律6折!",
    short: "日常活動所需，美日鍛鍊所需",
    content: "",
    createTime: "2021-08-06 15:22:23",
  ),
  NotificationModel(
    notificationID: 1,
    notificationType: 2,
    title: "恭喜會員註冊成功!",
    short: "歡迎使用E-Shopping",
    content: "",
    createTime: "2021-07-06 22:23:21",
  ),
];