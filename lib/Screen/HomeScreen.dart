// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screen/CameraScreen.dart';
import 'package:whatsapp_clone/Screen/Pages/page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatClone'),
        actions: [
          const InkWell(
            child: Icon(Icons.search),
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                value: 'New group',
                child: Text('New group'),
              ),
              PopupMenuItem(
                value: 'New broadcast',
                child: Text('New broadcast'),
              ),
              PopupMenuItem(
                value: 'WhatClone web',
                child: Text('WhatClone web'),
              ),
              PopupMenuItem(
                value: 'Start message',
                child: Text('Start message'),
              ),
              PopupMenuItem(
                value: 'Settings',
                child: Text('Settings'),
              ),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS')
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          CameraScreen(),
          // CameraPage(),
          ChatPage(),
          Center(child: Text('Status')),
          Center(child: Text('Calls'))
        ],
      ),
    );
  }
}
