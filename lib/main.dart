import 'package:taskmanager/util/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage=await HydratedStorage.build(storageDirectory: kIsWeb
      ?HydratedStorage.webStorageDirectory: await getApplicationDocumentsDirectory());

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => SwitchBloc()),

      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme:state.switchvalue==true?AppThemes.appThemeData[AppTheme.darkTheme]
                :AppThemes.appThemeData[AppTheme.lightTheme],
            debugShowCheckedModeBanner: false,
            home: const TabPage(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
