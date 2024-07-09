# 간단한 설명과 사용법

먼저 빠르게 경험을 해 보고 싶은 분들을 위해서 짧게 설명을 한다.



## 간단한 초기화 방법


- `TranslationService.instance.init()` 를 호출하여, 다국어 관련 기능을 초기화 한다. 만약 이 기능을 초기화하지 않으면 영어만 화면에 나올 수 있다.
- `UserService.instance.init();` 를 호출하여,사용자 기능을 초기화 해야 한다. 사용자 기능을 초기화 해야지 로그인 한 사용자의 기능을 사용할 수 있다. 또한 로그인을 하지 않았어도 anonymous 옵션을 통해서 앱을 사용 할 수 있다.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TranslationService.instance.init(); // 다국어
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    UserService.instance.init(); // 사용자 기능 초기화
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

```

