library globals;

import 'package:chat_task_t2/Controllers/MessageController.dart';
import 'package:chat_task_t2/models/MessageModel.dart';
import 'package:chat_task_t2/models/UserModel.dart';
import 'package:flutter/material.dart';

int login = 0;
int register = 1;

UserModel userModel = UserModel();
List<MessageModel> messageModels = [];
MessageController messageController = MessageController();
//serController

Color loginColor = Colors.lightBlue;
Color registerColor = Colors.blueAccent;
