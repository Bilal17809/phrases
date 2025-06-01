import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class TranslationController extends GetxController {
  RxString selectedLanguage1 = "English".obs;
  RxString selectedLanguage2 = "Spanish".obs;
  RxString translatedText = "".obs;
  RxBool isListening = false.obs;
  RxBool isLoading = false.obs;
  final pitch = 0.5.obs;
  final speed = 0.5.obs;
  final isSpeechPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {

    super.onClose();
  }
  TextEditingController controller = TextEditingController();
  final translator = GoogleTranslator();
  FlutterTts flutterTts = FlutterTts();

  final Map<String, String> languageCodes = {
    'English': 'en',
    'French': 'fr',
    'Spanish': 'es',
    'German': 'de',
    'Italian': 'it',
    'Portuguese': 'pt',
    'Dutch': 'nl',
    'Russian': 'ru',
    'Chinese (Simplified)': 'zh-cn',
    'Japanese': 'ja',
    'Korean': 'ko',
    'Arabic': 'ar',
    'Hindi': 'hi',
    'Urdu': 'ur',
    'Bengali': 'bn',
    'Punjabi': 'pa',
    'Turkish': 'tr',
    'Vietnamese': 'vi',
    'Thai': 'th',
    'Indonesian': 'id',
    'Tagalog': 'tl',
    'Hebrew': 'he',
    'Swedish': 'sv',
    'Norwegian': 'no',
    'Danish': 'da',
    'Finnish': 'fi',
    'Polish': 'pl',
    'Greek': 'el',
    'Czech': 'cs',
    'Hungarian': 'hu',
    'Romanian': 'ro',
    'Ukrainian': 'uk',
    'Malay': 'ms',
    'Tamil': 'ta',
    'Telugu': 'te',
    'Kannada': 'kn',
    'Marathi': 'mr',
    'Gujarati': 'gu',
    'Swahili': 'sw',
    'Zulu': 'zu',
  };
  final languageFlags = {
    'Afrikaans': 'ZA',
    'Albanian': 'AL',
    'Amharic': 'ET',
    'Arabic': 'AE',
    'Armenian': 'AM',
    'Azerbaijani': 'AZ',
    'Basque': 'ES',
    'Belarusian': 'BY',
    'Bengali': 'BD',
    'Bosnian': 'BA',
    'Bulgarian': 'BG',
    'Catalan': 'ES',
    'Chinese (Simplified)': 'CN',
    'Chinese (Traditional)': 'TW',
    'Croatian': 'HR',
    'Czech': 'CZ',
    'Danish': 'DK',
    'Dutch': 'NL',
    'English': 'US',
    'Estonian': 'EE',
    'Filipino': 'PH',
    'Finnish': 'FI',
    'French': 'FR',
    'Georgian': 'GE',
    'German': 'DE',
    'Greek': 'GR',
    'Gujarati': 'IN',
    'Haitian Creole': 'HT',
    'Hebrew': 'IL',
    'Hindi': 'IN',
    'Hungarian': 'HU',
    'Icelandic': 'IS',
    'Indonesian': 'ID',
    'Irish': 'IE',
    'Italian': 'IT',
    'Japanese': 'JP',
    'Kannada': 'IN',
    'Kazakh': 'KZ',
    'Khmer': 'KH',
    'Korean': 'KR',
    'Kurdish': 'IQ',
    'Latvian': 'LV',
    'Lithuanian': 'LT',
    'Macedonian': 'MK',
    'Malay': 'MY',
    'Maltese': 'MT',
    'Marathi': 'IN',
    'Mongolian': 'MN',
    'Nepali': 'NP',
    'Norwegian': 'NO',
    'Persian': 'IR',
    'Polish': 'PL',
    'Portuguese (Brazil)': 'BR',
    'Portuguese (Portugal)': 'PT',
    'Punjabi': 'PK',
    'Romanian': 'RO',
    'Russian': 'RU',
    'Serbian': 'RS',
    'Slovak': 'SK',
    'Slovenian': 'SI',
    'Spanish': 'ES',
    'Swahili': 'KE',
    'Swedish': 'SE',
    'Tamil': 'LK',
    'Telugu': 'IN',
    'Thai': 'TH',
    'Turkish': 'TR',
    'Ukrainian': 'UA',
    'Urdu': 'PK',
    'Vietnamese': 'VN',
    'Welsh': 'GB',
    'Yiddish': 'IL',
  };

  final List<String> _rtlLanguages = ['ar', 'he', 'ur', 'fa'];
  bool isRTLLanguage(String language) {
    final languageCode = languageCodes[language] ?? 'en';
    return _rtlLanguages.contains(languageCode);
  }

  static const MethodChannel _methodChannel =
  MethodChannel('com.example.phrases/speech_Text');

  Future<void> startSpeechToText(String languageISO) async {
    print("Translation Screen selected language Code ------------${languageISO} ----------");

    try {
      isListening.value = true;
      print("Starting speech recognition for language: $languageISO");
      final result = await _methodChannel.invokeMethod('getTextFromSpeech', {'languageISO': languageISO});

      if (result != null && result.isNotEmpty) {
        controller.text = result;
        await handleUserActionTranslate(result);
      }
    } on PlatformException catch (e) {
      print("####################### Error in Speech-to-Text: ${e.message}");
    } finally {
      isListening.value = false;
    }
  }

  Future<void> speakText() async {
    try {
      // Set the TTS engine (optional for Android)
      await flutterTts.setEngine('com.google.android.tts');

      // Language map with corresponding locales
      // final Map<String, String> languageCodes = {
      //   'Urdu': 'ur-PK',
      //   'Hindi': 'hi-IN',
      //   'Punjabi': 'pa-IN',
      //   'Marathi': 'mr-IN',
      //   'Arabic': 'ar',
      //   'English': 'en-US',
      // };

      // Get the selected language code, default to English if not found
      String selectedLanguageCode = languageCodes[selectedLanguage2.value] ?? 'en-US';

      // Set the selected language
      await flutterTts.setLanguage(selectedLanguageCode);

      // Set pitch and speech rate
      await flutterTts.setPitch(pitch.value);
      await flutterTts.setSpeechRate(speed.value);

      // Speak the translated text
      if (translatedText.value.isNotEmpty) {
        await flutterTts.speak(translatedText.value);
        print("############# Speaking in $selectedLanguageCode: ${translatedText.value}");
      } else {
        Get.snackbar("Error", "No text available to speak.");
      }
    } catch (e) {
      print("########## Error in TTS: ${e.toString()}");
      Get.snackbar("############# Error", "TTS failed: ${e.toString()}");
    }
  }
  static const MethodChannel _channel = MethodChannel('com.example.phrases/tts');

  Future<void> speakUsingNative(String text, String languageCode) async {
    try {
      await _channel.invokeMethod('speakText', {'text': text, 'language': languageCode});
    } on PlatformException catch (e) {
      print("Error: ${e.message}");
    }
  }

  Future<void> handleUserActionTranslate(String text) async {
      await translate(text);
      await speakText();
  }

  void onTranslateButtonPressed() async {

    final textToTranslate = controller.text;
    if (textToTranslate.isEmpty) {
      Get.snackbar("Error", "Please enter text to translate.");
      return;
    }
  }

  Future<void> translate(String text) async {
    if (text.isEmpty) {
      translatedText.value = "Please enter text to translate.";
      return;
    }

    isLoading.value = true; // Show loading indicator
    try {
      final sourceLang = languageCodes[selectedLanguage1.value] ?? 'en';
      final targetLang = languageCodes[selectedLanguage2.value] ?? 'es';

      final result = await translator.translate(text, from: sourceLang, to: targetLang);

      translatedText.value = result.text;
      // await speakText();

    } catch (e) {
      translatedText.value = "Translation failed: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }

  // Method to clear the input and output text
  void clearData() {
    controller.clear();
    translatedText.value = "";
    speakText();

  }

  // New function to copy text to clipboard
  void copyText() {
    if (translatedText.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: translatedText.value));
      Get.snackbar("Copied", "Translated text copied to clipboard!");
    }
  }


  // Reset the language and clear data
  void resetData() {
    selectedLanguage1.value = 'English';
    selectedLanguage2.value = 'French';
    clearData();
    speakText();
  }

  // double _mapSpeedToDisplayValue(double value) {
  //   return _mapPitchToDisplayValue(value); // Use the same logic for speed as pitch
  // }
  //
  // double _mapDisplayValueToSpeed(double displayValue) {
  //   return _mapDisplayValueToPitch(displayValue);
  // }
  //
  // double _mapPitchToDisplayValue(double value) {
  //   return 0.1 + (value * 0.9);
  // }
  //
  // double _mapDisplayValueToPitch(double displayValue) {
  //   return (displayValue - 0.1) / 0.9;
  // }
}
