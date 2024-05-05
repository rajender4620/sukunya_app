import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashBoardHomePAge extends StatefulWidget {
  const DashBoardHomePAge({super.key});

  @override
  State<DashBoardHomePAge> createState() => _DashBoardHomePAgeState();
}

class _DashBoardHomePAgeState extends State<DashBoardHomePAge> {
  int selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[
    const Text('Home Page'), // Placeholder for Home Page
    const Text('Accounts Page'), // Placeholder for Accounts Page
    const Text('Profile Page'), // Placeholder for Profile Page
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/pngs/100x38 nischals.png',
              height: 100,
              width: 120,
              fit: BoxFit.contain,
            ),
            const Icon(
              Icons.home_outlined,
              color: Colors.grey,
              size: 35,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue, width: 1.5),
              ),
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  fit: BoxFit.fill,
                  'assets/pngs/classmates-writing-learning-study-session.jpg',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: Colors.blue, width: 1.5),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 4, 93, 167),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.error_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sukunya Samridhi Yojana',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.double_arrow,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    lableWidget('Eligibility', 'Girl Child below 10 Yrs'),
                    lableWidget('Accounts Opened at', 'Post offices or Banks'),
                    lableWidget('Min. Deposit', formatAsCurrency(250)),
                    lableWidget(
                      'Subsequent Deposit',
                      'Multiple of  ${formatAsCurrency(50)}',
                    ),
                    lableWidget('Max. Deposit in FY', formatAsCurrency(150000)),
                    lableWidget('Deposit Period', '15 Years from a/c opening'),
                    lableWidget(
                      'Freezing Period',
                      '06 Years after deposit period',
                    ),
                    lableWidget('Maturity Period', '21 Years from a/c opening'),
                    lableWidget('Loan Eligibility', 'Not Permissible'),
                    lableWidget(
                      'Withdrawal Option',
                      'At Age 18/After 10th Grade',
                    ),
                    lableWidget('Premature Closure', 'After 5 Years*'),
                    lableWidget('Current Int. Rate', '8.20%'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onItemTapped,
      ),
    );
  }

  Padding lableWidget(String s1, String s2) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                s1,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Text(
            ':',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                s2,
                style: TextStyle(
                  color: s1 == 'Current Int. Rate' ? Colors.red : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatAsCurrency(int amount) {
    // Format the amount as currency using NumberFormat
    final currencyFormat =
        NumberFormat.currency(symbol: '\u20B9'); // Indian Rupee symbol
    return currencyFormat.format(amount);
  }
}
