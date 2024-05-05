import 'package:flutter/material.dart';
import 'package:sukunya/core/custom_pageroute.dart';
import 'package:sukunya/homepage/widget/my_profile.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final mq = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/pngs/100x38 nischals.png',
              height: 60,
              width: 80,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'assets/pngs/1152x1152  Vikram.png',
              height: 300,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                  child: Column(
                    children: [
                      const Text(
                        "Welcome to PostElite's",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Sukanya Samriddhi Yojana Calculator',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "Empowering Your Daughter's Future",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 119, 215),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Ready to begin?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomPageRoute(
                              page: const MyProfile(),
                              side: 'right',
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 236, 23, 8),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 55,
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "Let's start with your profile ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
