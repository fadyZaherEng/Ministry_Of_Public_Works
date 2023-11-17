import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/presentation/screens/home/home_screen.dart';
import 'package:aim/src/presentation/screens/more/more_screen.dart';
import 'package:aim/src/presentation/screens/payments/payments_screen.dart';
import 'package:aim/src/presentation/screens/projects/projects_screen.dart';
import 'package:aim/src/presentation/screens/reports/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  final String permission;

  const MainScreen({
    Key? key,
    required this.permission,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProjectsScreen(),
    const ReportsScreen(),
    const MoreScreen(),
  ];
  int _selectedIndex = 0;
  late List<BottomNavigationBarItem> _navigationBarItem;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_validateUserPermission()) {
      _screens.removeAt(2);
      _screens.insert(
          2,
          const PaymentsScreen(
            showBackButton: false,
          ));
      setState(() {});
    }
    _navigationBarItem = [
      BottomNavigationBarItem(
          icon: SvgPicture.asset(ImagePaths.homeBar),
          label: S.of(context).home,
          activeIcon: SvgPicture.asset(ImagePaths.homeFillBar)),
      BottomNavigationBarItem(
          icon: SvgPicture.asset(ImagePaths.projectsBar),
          label: S.of(context).projects,
          activeIcon: SvgPicture.asset(ImagePaths.projectsFillBar)),
      !_validateUserPermission()
          ? BottomNavigationBarItem(
              icon: SvgPicture.asset(ImagePaths.reportsBar),
              label: S.of(context).reports,
              activeIcon: SvgPicture.asset(ImagePaths.reportsFillBar))
          : BottomNavigationBarItem(
              icon: SvgPicture.asset(ImagePaths.reportsBar),
              label: S.of(context).payments,
              activeIcon: SvgPicture.asset(ImagePaths.reportsFillBar)),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(ImagePaths.moreBar),
        label: S.of(context).more,
        activeIcon: SvgPicture.asset(ImagePaths.moreFillBar),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        constraints: const BoxConstraints(minHeight: 70, maxHeight: 100),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -4),
              blurRadius: 12,
              spreadRadius: 0,
              color: ColorSchema.black.withOpacity(0.1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(height: 1.8),
          unselectedLabelStyle: const TextStyle(height: 1.8),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorSchema.primary,
          unselectedItemColor: ColorSchema.gray,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: _navigationBarItem,
        ),
      ),
    );
  }

  bool _validateUserPermission() {
    return widget.permission == "Financial Department" ||
        widget.permission == "Financial Auditors";
  }
}
