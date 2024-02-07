import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechReminder extends StatefulWidget {
  @override
  State<TextToSpeechReminder> createState() => _TextToSpeechReminderState();
}

class _TextToSpeechReminderState extends State<TextToSpeechReminder> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text-to-Speech Reminder'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _speak('Don\'t forget the meeting at 3 PM!');
          },
          child: Text('Set Reminder'),
        ),
      ),
    );
  }

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('en-HI');
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }
}
