import 'package:flutter/material.dart';
import 'package:i2connect/view/basewidget/custom_app_bar.dart';
import 'package:i2connect/view/screen/auth/sign_in.dart';
import 'package:i2connect/view/screen/dashboard/dashboard_screen.dart';
import 'package:i2connect/view/screen/ecampaigns/ecampaigns_screen.dart';
import 'package:i2connect/view/screen/calendar/calendar_screen.dart';
import 'package:i2connect/view/screen/votersdata/search_voter.dart';
import 'package:i2connect/view/screen/votersdata/votersdata_screen.dart';
import 'package:i2connect/view/screen/birthdays/birthdays_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../util/color_resources.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({Key? key}) : super(key: key);

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
    Text(
      'Index 4: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getBody() {
    switch (_selectedIndex) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const ECampaignsScreen();
      case 2:
        return const CalendarScreen();
      case 3:
        return const VotersDataScreen();
      case 4:
        return const BirthdaysScreen();
      default:
        return Container();
    }
  }

  String getTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'E-Campaign';
      case 2:
        return 'Calender';
      case 3:
        return 'Voter\'s Data';
      case 4:
        return 'Birthday';
      default:
        return '';
    }
  }

  Widget getAction() {
    switch (_selectedIndex) {
      case 0:
        return IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.grey,
            size: 32,
          ),
          onPressed: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.clear().then((value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(),
                ),
                (route) => false));
          },
        );
      case 1:
        return const SizedBox.shrink();
      case 2:
        return const SizedBox.shrink();
      case 3:
        return IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 32,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchVoterView(),
                ),
              );
            });
      case 4:
        return const SizedBox.shrink();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF0F0F0),
      // appBar: AppBar(
      //   leading: const Icon(Icons.menu, color: Colors.black87,),
      //   backgroundColor: const Color(0xFFF0F0F0),
      //   shadowColor:  Colors.green,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: Text(getTitle(),
      //     style: titleHeader
      //   ),
      // ),

      body: Column(
        children: [
          CustomAppBar(
            title: getTitle(),
            action: getAction(),
          ),
          Expanded(child: getBody()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'E-Campaign',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: "Voter's Data",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Birthdays",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: ColorResources.getDarkGrey(context),
        onTap: _onItemTapped,
      ),
    );
  }
}
