import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentapp/utils/colors/app_colors.dart';

import '../../controllers/ai_assistant_controller.dart';

class AIAssistantView extends GetView<AIAssistantController> {
  const AIAssistantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.darkBlueColor,
          ),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(13),
              ),
              child: const Icon(
                Icons.smart_toy_rounded,
                color: Colors.white,
                size: 23,
              ),
            ),
            const SizedBox(width: 11),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Campus AI Assistant',
                  style: TextStyle(
                    color: AppColors.darkBlueColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    CircleAvatar(radius: 4, backgroundColor: Color(0xFF22C55E)),
                    SizedBox(width: 5),
                    Text(
                      'Online • Demo Mode',
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.snackbar(
                'Campus AI',
                'Chat history feature will be added later.',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            icon: const Icon(
              Icons.more_vert_rounded,
              color: AppColors.darkBlueColor,
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // CHAT MESSAGES
          Expanded(
            child: Obx(
              () => ListView.builder(
                controller: controller.scrollController,
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 15),
                itemCount:
                    controller.messages.length +
                    (controller.isTyping.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == controller.messages.length) {
                    return const _TypingIndicator();
                  }

                  final message = controller.messages[index];

                  return _MessageBubble(
                    message: message.text,
                    isUser: message.isUser,
                  );
                },
              ),
            ),
          ),

          // QUICK QUESTIONS
          Obx(
            () => controller.messages.length <= 1
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'QUICK QUESTIONS',
                          style: TextStyle(
                            fontSize: 10,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w800,
                            color: AppColors.greyColor,
                          ),
                        ),
                        const SizedBox(height: 11),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: controller.quickQuestions.map((question) {
                            return InkWell(
                              onTap: () => controller.sendMessage(question),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF4FF),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(0xFFDCE7FF),
                                  ),
                                ),
                                child: Text(
                                  question,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),

          // MESSAGE INPUT
          Container(
            padding: EdgeInsets.fromLTRB(
              14,
              12,
              14,
              12 + MediaQuery.of(context).viewInsets.bottom * 0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 15,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 50,
                        maxHeight: 120,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F6FA),
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(color: const Color(0xFFE8EDF5)),
                      ),
                      child: TextField(
                        controller: controller.messageController,
                        textCapitalization: TextCapitalization.sentences,
                        minLines: 1,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Ask anything about your university...',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: AppColors.greyColor,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 15,
                          ),
                        ),
                        onSubmitted: (_) => controller.sendMessage(),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Obx(
                    () => GestureDetector(
                      onTap: controller.isTyping.value
                          ? null
                          : () => controller.sendMessage(),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: controller.isTyping.value
                              ? AppColors.greyColor
                              : AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 21,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const _MessageBubble({required this.message, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: isUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isUser) ...[
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Icon(
                  Icons.smart_toy_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 8),
            ],

            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.76,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isUser ? AppColors.primaryColor : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(18),
                    topRight: const Radius.circular(18),
                    bottomLeft: Radius.circular(isUser ? 18 : 5),
                    bottomRight: Radius.circular(isUser ? 5 : 18),
                  ),
                  border: isUser
                      ? null
                      : Border.all(color: const Color(0xFFE8EDF5)),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    color: isUser ? Colors.white : AppColors.darkBlueColor,
                    fontSize: 13,
                    height: 1.5,
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

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 40, bottom: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                Icons.smart_toy_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 9),
            Text(
              'AI is thinking...',
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
