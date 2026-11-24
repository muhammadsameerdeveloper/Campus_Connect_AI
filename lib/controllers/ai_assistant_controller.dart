import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime time;

  ChatMessage({required this.text, required this.isUser, required this.time});
}

class AIAssistantController extends GetxController {
  final messageController = TextEditingController();
  final scrollController = ScrollController();

  final messages = <ChatMessage>[].obs;
  final isTyping = false.obs;

  final List<String> quickQuestions = [
    'What are the library timings?',
    'Where is the CS department?',
    'How can I check exam schedule?',
    'How can I apply for scholarship?',
  ];

  @override
  void onInit() {
    super.onInit();

    messages.add(
      ChatMessage(
        text:
            'Hello! 👋 Welcome to CampusConnect AI. I am your university assistant. How can I help you today?',
        isUser: false,
        time: DateTime.now(),
      ),
    );
  }

  void sendMessage([String? quickMessage]) {
    final text = (quickMessage ?? messageController.text).trim();

    if (text.isEmpty || isTyping.value) return;

    messages.add(ChatMessage(text: text, isUser: true, time: DateTime.now()));

    messageController.clear();
    isTyping.value = true;

    _scrollToBottom();

    Future.delayed(const Duration(milliseconds: 1200), () {
      messages.add(
        ChatMessage(
          text: getDemoResponse(text),
          isUser: false,
          time: DateTime.now(),
        ),
      );

      isTyping.value = false;
      _scrollToBottom();
    });
  }

  String getDemoResponse(String question) {
    final value = question.toLowerCase();

    if (value.contains('library')) {
      return '📚 The university library timings are currently not configured. Please contact the library administration for confirmed opening and closing hours.';
    }

    if (value.contains('cs department') ||
        value.contains('computer science') ||
        value.contains('department')) {
      return '🏫 The Computer Science Department location information will be available here once university campus details are added.';
    }

    if (value.contains('exam') || value.contains('schedule')) {
      return '🗓️ You can check your examination schedule through the university examination office or student portal. Actual exam dates will be added after university data integration.';
    }

    if (value.contains('scholarship')) {
      return '🎓 For scholarship information, contact the university financial aid office. Scholarship eligibility, deadlines and application instructions will be added to the assistant.';
    }

    if (value.contains('admission')) {
      return '📋 For admission information, please contact the university admission office. You can ask about eligibility, required documents and application deadlines.';
    }

    if (value.contains('complaint')) {
      return '📝 You can submit a university complaint from the Report Complaint section on your dashboard. You will be able to track its status there.';
    }

    return 'I am here to help with university-related questions! You can ask me about library timings, departments, exams, scholarships, admissions and student services.';
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
