import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// راح يكون مربوط في اوبسيكيور عشان ووظيفته راح يخلي المستخدم يقدر يخلي كلمة المرور مخفيه او ظاهره
bool isSecured = true;

// الجزئية هي كانها قاعدة بيانات مصغره بس سويتها عشان اجرب شرط التحقق
// لكن مستقبلاً راح اتعالمل مع فايربيس قاعدة البيانات
//متعلق بكلاس المستخدم
Map<String, User> users = {
  "ali@gmail.com": User(email: 'ali@gmail.com', password: '1234'),
  "omar@gmail.com": User(email: 'omar@gmail.com', password: '1234'),
  "saleh@gmail.com": User(email: 'saleh@gmail.com', password: '1234'),
};
//

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  //السطرين هذي راخ تخليني اقدر اتحقق من الايميل المدخل اذا كان صحيح او لا
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      //Appbar:الجزء العلوي من الشاشه
      //
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 8, 70),
        title: const Center(
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
      // whidget column: تسمح لك بترتيب العناصر فوق بعض
      // ويوجد داخله شيلد يسمح لنا باستخدام اكثر من ويدجيت بنفس الوقت
      //SingleChildScrollView: هو ويدجيت يسمح لنا وقت باستخدام الكيبورد مع رؤية الخانة الي بنسجل فيها
      body: SingleChildScrollView(
        child: Column(
          //MainAxisAlignment.spaceAround: ابحث عنه
          //MainAxisAlignment.spaceBetween:ابحث عنه
          //MainAxisAlignment.spaceEvenly:ابحث عنه
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "images/logo_app.jpg",
              width: 500,
              height: 250,
            ),
            //
            //Padding: يتحكم بالمساحه حسب المساحه المعطى
            //
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  //
                  // هنا بنسوي خانة تسجيل الإيميل
                  TextFormField(
                    // controller: emailController: راح يخليني اتحقق اذا الايميل المدخل صحيح او لا
                    controller: emailController,
                    //
                    decoration: const InputDecoration(
                      label: Text('Enter Email'),
                      // prefixIcon: يسمح لك بإضافة  ايكون قبل تيكست فروم فيلد
                      prefixIcon: Icon(Icons.person),
                      //
                      // border: يضيف لك الحواف حق تيكست فروم فيلد الحواف الي هي المستطيل حق النص الي بنسجل فيه دخول
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  //
                  //SizedBox: راح يسوي مسافة بين مربع تسجيل  الايميل ومرع تسجيل الرمز
                  const SizedBox(height: 30),
                  //
                  // هنا بنسوي خانة الباسوورد وهي كوبي بيست من الي فوق خانة تسجيل الإيميل لكن مع نعديل بعض الخصائص
                  //
                  TextFormField(
                    // controller: passwordController: راح يخليني اتحقق اذا الرمز المدخل صحيح او لا
                    controller: passwordController,
                    //
                    //obscureText:تخلي الباسوورد مخفي
                    obscureText: isSecured,
                    decoration: InputDecoration(
                      label: const Text('Enter Password'),
                      // prefixIcon: يسمح لك بإضافة  ايكون قبل تيكست فروم فيلد
                      prefixIcon: const Icon(Icons.lock),
                      //suffixIcon: يسمح لك باضافة ايكون بعد التيكست فروم فيلد بنضيف هنا شكل العين في الباسوورد
                      //IconButton:راح استخدم هذي ويدجيت عشان اقدر اتفاعل مع زر العين واضغطه اذا ابي الرمز مخفي او ظاهر
                      suffixIcon: IconButton(
                        // اذا كانت الايكون ترو راح يحولها الى فولس واذا كانت فولس راح يحولها الى ترو
                        // يعني اذا كان الايكون مخلي كلمة المرور ظاهره راح يخليها مخفيه واذا كانت مخفيه راح يخليها ظاهره
                        onPressed: () {
                          setState(() {
                            isSecured = !isSecured;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      // border: يضيف لك الحواف حق تيكست فروم فيلد الحواف الي هي المستطيل حق النص الي بنسجل فيه دخول
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                        //
                      ),
                    ),
                  ),
                  //
                  //عشان نسوي مسافه بين الباسوورد وخانة الدخول
                  SizedBox(
                    height: 40,
                  ),
                  //
                  //InkWell: كلاس يسمح لنا باستخدام بوتون
                  //
                  InkWell(
                    // onTap:معناها ان لما نضغط على البوتون يسوي لي حدق معين
                    onTap: () {
                      // الاكواد هذي وظيفتها التحقق من ان الايميل او الباسوورد صحيح
                      //users[i].email;&users[i].password: عشان يستدعي الايميل من قاعدة البيانات المصغره الي سويتها فوق ويقارنها بالايميل او الباسسورد المدخل
                      User user = users[emailController.text]!;

                      if (user.email == emailController.text &&
                          user.password == passwordController.text) {
                        print('logged');
                      } else {
                        print('email or password is wrong');
                      }
                    },
                    //
                    //نهاية شرط التحقق من الرمز والايميل
                    //

                    //Container:  زي الحاوية نقدر نضيف فيها خصائص زي النص او الايكون ونقدر نتحكم بهذي الخصائص
                    child: Container(
                      //Padding:  يتحكم بالمساحة من الداخل حسب المساحه المعطى
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        // border:يضيف لك الحواف حق تيكست فروم فيلد الحواف الي هي المستطيل حق الدخول اذا تبغى حوافع محدبة او مائلة
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromARGB(255, 0, 6, 54),
                      ),
                      //
                      //whidget Row: تسمح لك بترتيب العناصر جنب بعض
                      child: const Row(
                          //mainAxisAlignment: خاصية في الصف تسمح لنا بالتحكم في العنصر اذا نبغاه في الوسط او اليمين او اليسار
                          //MainAxisAlignment.center: العنصر في النص
                          //MainAxisAlignment.start: العنصر على اليسار في البداية
                          //MainAxisAlignment.end: العنصر على اليمين في النهاية
                          mainAxisAlignment: MainAxisAlignment.center,
                          // راح نكتب لوق ان وراح نخلي لونه ابيض
                          children: [
                            Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            // عشان نسوي مسافه بين الايكون والنص
                            SizedBox(width: 5),
                            // راح نضيف الايكون وهو رمز الدخول
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
