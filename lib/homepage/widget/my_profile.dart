// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sukunya/core/custom_pageroute.dart';
import 'package:sukunya/homepage/widget/dashboard_homepage.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final phoneNumberController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  bool isButtonEnabled = false;

  FocusNode focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String prefixText = 'Mr.';
  Color prefixColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.person_2_rounded,
              size: 18,
              color: Color.fromARGB(255, 124, 10, 1),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                    const Expanded(
                      flex: 4,
                      child: Center(
                        child: Text(
                          'Personal Info',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: Colors.black,
                controller: userNameController,
                onChanged: (value) {
                  setState(() {});
                  isButtonEnabled = _formKey.currentState?.validate() ?? false;
                },
                decoration: InputDecoration(
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'Full Name',
                  hintText: 'Enter Your Name',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: DropdownButton<String?>(
                      underline: Container(),
                      dropdownColor: Colors.white,
                      value: prefixText,
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 15,
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          prefixText = newValue ?? '';
                          prefixColor =
                              newValue!.isNotEmpty ? Colors.blue : Colors.grey;
                        });
                      },
                      items: ['Mr.', 'Ms.', 'Mx.']
                          .map(
                            (prefix) => DropdownMenuItem<String?>(
                              value: prefix,
                              child: Text(
                                prefix,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  } else if (value.length <= 2) {
                    return 'Please enter a minimum of 3 letters for your name';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              if (userNameController.text.length <= 2)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Text(
                    '(Max.12 letters with space button allowed, No Numeric, No Special Charater allowed)',
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                controller: phoneNumberController,
                dropdownTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                initialCountryCode: 'IN',
                focusNode: focusNode,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  labelText: 'Mobile Number',
                  hintText: 'Enter Your Phone Number',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: (phone) {
                  if (phone!.completeNumber.length < 10) {
                    return 'Please enter 10 digits of your mobile number';
                  }
                  return null;
                },
                onChanged: (phone) {
                  setState(() {});
                  isButtonEnabled = _formKey.currentState?.validate() ?? false;
                  // print(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  //  print('Country changed to: ${country.name}');
                },
              ),
              if (phoneNumberController.text.length < 10)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Text(
                    '(Max.10 Numbers allowed (after 5 Numbers one space by default),No Letters, No Special Characters allowed)',
                  ),
                ),
              const SizedBox(
                height: 5,
              ),
              if (phoneNumberController.text.length < 10)
                const SizedBox(
                  height: 5,
                ),
              TextFormField(
                onChanged: (value) {
                  isButtonEnabled = _formKey.currentState?.validate() ?? false;
                  setState(() {});
                },
                cursorColor: Colors.black,
                controller: emailController,
                decoration: InputDecoration(
                  errorStyle: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelText: 'E-mail Address',
                  hintText: 'Enter Your E-mail Address',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!value.contains('@') || !value.contains('.')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: isButtonEnabled ? _saveProfile : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: isButtonEnabled
                        ? const Color.fromARGB(255, 236, 23, 8)
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 55,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'Save Profile',
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
    );
  }

  void _saveProfile() {
    Navigator.push(
      context,
      CustomPageRoute(page: const DashBoardHomePAge(), side: 'right'),
    );
  }
}
