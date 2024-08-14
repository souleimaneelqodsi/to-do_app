import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    '9btt93g5': {
      'en': 'Signup',
      'fr': 'S\'inscrire',
    },
    'g54t0ark': {
      'en': 'Email...',
      'fr': 'E-mail...',
    },
    'p29ulo4q': {
      'en': 'Password...',
      'fr': 'Mot de passe...',
    },
    'uipfypl4': {
      'en': 'Confirm Password...',
      'fr': 'Confirmez le mot de passe...',
    },
    '13d77tca': {
      'en': 'Field is required',
      'fr': 'Le champ est obligatoire',
    },
    'y3y2pyj1': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'jc60gnne': {
      'en': 'Field is required',
      'fr': 'Le champ est obligatoire',
    },
    '9phx70ua': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    't4v5msxj': {
      'en': 'Field is required',
      'fr': 'Le champ est obligatoire',
    },
    'lp6av42g': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'esmdgg24': {
      'en': 'Login',
      'fr': 'Se connecter',
    },
    'giee85kc': {
      'en': 'Email...',
      'fr': 'E-mail...',
    },
    '9mvsl0hi': {
      'en': 'Password...',
      'fr': 'Mot de passe...',
    },
    'e52o1b7e': {
      'en': 'Forgot your password?',
      'fr': 'Mot de passe oublié ?',
    },
    'j4391osm': {
      'en': 'Field is required',
      'fr': 'Le champ est obligatoire',
    },
    '3phfpqtv': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'bm59ckqp': {
      'en': 'Field is required',
      'fr': 'Le champ est obligatoire',
    },
    'poom9yhi': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'x54kcmsj': {
      'en': 'Log In',
      'fr': 'Se connecter',
    },
    'bpfmzgpb': {
      'en': 'Sign up',
      'fr': 'S\'inscrire',
    },
    '1vx2cw41': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // tasks
  {
    'lpqb5mtq': {
      'en': 'Tasks',
      'fr': 'Tâches',
    },
    'vsvxt4u6': {
      'en': 'Tasklist',
      'fr': 'Accueil',
    },
  },
  // onboarding
  {
    '8g0ncvhp': {
      'en': 'Profile',
      'fr': 'Profil',
    },
    'lz0w3ghy': {
      'en': 'Name...',
      'fr': 'Nom...',
    },
    'wa3rug27': {
      'en': 'Set Birthday',
      'fr': 'Définir l\'anniversaire',
    },
    '087nk81n': {
      'en': 'Complete Profile ',
      'fr': 'Compléter le profil',
    },
    'wlnudh22': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // completed
  {
    'g49k1f75': {
      'en': 'Completed tasks',
      'fr': 'Tâches complétées',
    },
    'wnp6uas9': {
      'en': 'Completed',
      'fr': 'Complétées',
    },
  },
  // details
  {
    'fh3xo69g': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // profile
  {
    'c8jbnqbo': {
      'en': 'Profile',
      'fr': 'Profil',
    },
    'fexcmnsx': {
      'en': 'Tap to change your profile picture',
      'fr': 'Appuyez pour modifier la photo de profil',
    },
    'rm0wkdx8': {
      'en': 'Name...',
      'fr': 'Nom...',
    },
    'ncgluni5': {
      'en': 'Email Address',
      'fr': 'Adresse email',
    },
    '66l0hhmo': {
      'en': 'Change password',
      'fr': 'Modifier le mot de passe',
    },
    'rvcmekgz': {
      'en': 'Update Profile',
      'fr': 'Mettre à jour le profil',
    },
    '5g029rr7': {
      'en': 'Profile',
      'fr': 'Profil',
    },
  },
  // onboarding1
  {
    'ef2mp9jy': {
      'en': 'E-mail verification',
      'fr': 'Vérification de l\'adresse mail',
    },
    'mocgg0u4': {
      'en': 'Please enter the code we have sent you on your e-mail address',
      'fr':
          'Merci d\'entrer le code de vérification que nous vous avon envoyé par mail',
    },
    '3p252anw': {
      'en': 'Verification code...',
      'fr': 'Code de vérification...',
    },
    'f6qvz9vl': {
      'en': '',
      'fr': '',
    },
    'epmqeyrv': {
      'en': 'Complete Profile',
      'fr': 'Complétez votre profil',
    },
    '7j5s5cme': {
      'en': 'Home',
      'fr': '',
    },
  },
  // forgotPassword
  {
    'pbffokys': {
      'en': 'Reset your password',
      'fr': 'Réinitialiser votre mot de passe',
    },
    'w1leeuqk': {
      'en':
          'Enter your e-mail address, validate and a password reset link will be sent to you right afterwards!',
      'fr':
          'Entrez votre adresse e-mail, validez et un lien de réinitialisation de mot de passe vous sera envoyé juste après !',
    },
    'y1fjtwau': {
      'en': 'Email Address...',
      'fr': 'E-mail...',
    },
    '8jtp78iz': {
      'en': '',
      'fr': '',
    },
    'u783a395': {
      'en': 'Send password reset link',
      'fr': 'Envoyer le lien de réinitialisation',
    },
    'othnz9gx': {
      'en': 'Home',
      'fr': 'Accueil',
    },
  },
  // addTask
  {
    'll9mcemr': {
      'en': 'Add Task',
      'fr': 'Ajouter une tâche',
    },
    'k213qtnu': {
      'en': 'Title...',
      'fr': 'Titre...',
    },
    'eq3gekb0': {
      'en': 'Details...',
      'fr': 'Détails...',
    },
    'q0g3ucqe': {
      'en': 'Add Task',
      'fr': 'Ajouter une tâche',
    },
  },
  // detailsSheet
  {
    'j5lm32sw': {
      'en': 'Task Details',
      'fr': 'Détails de la tâche',
    },
    'jr7cb6qs': {
      'en': 'Title',
      'fr': 'Titre',
    },
    'svfm8sga': {
      'en': 'Details',
      'fr': 'Détails',
    },
    'vqgd0ozs': {
      'en': 'Update Task',
      'fr': 'Mettre à jour la tâche',
    },
  },
  // Miscellaneous
  {
    'zdvy5ch1': {
      'en': 'Button',
      'fr': 'Bouton',
    },
    'x6ogfiox': {
      'en': 'Email...',
      'fr': 'E-mail...',
    },
    '20u8xwt3': {
      'en': '',
      'fr':
          'Pour prendre une photo ou une vidéo, cette application nécessite une autorisation d\'accès à l\'appareil photo.',
    },
    '54d3u9bj': {
      'en': '',
      'fr':
          'Afin de télécharger des données, cette application nécessite une autorisation d\'accès à la photothèque.',
    },
    'e372v23t': {
      'en': '',
      'fr': 'Erreur: [error]',
    },
    '15rf5iz3': {
      'en': '',
      'fr': 'E-mail de réinitialisation du mot de passe envoyé !',
    },
    '3dndicov': {
      'en': '',
      'fr': 'L\'adresse e-mail est requise !',
    },
    '3tphs6i6': {
      'en': '',
      'fr': 'Le numéro de téléphone est requis et doit commencer par +.',
    },
    'djh3fjx6': {
      'en': '',
      'fr': 'Les mots de passe ne correspondent pas',
    },
    'x1c2m9fl': {
      'en': '',
      'fr': 'Entrez le code de vérification reçu par message',
    },
    'm7svdjue': {
      'en': '',
      'fr':
          'Trop de temps écoulé depuis la dernière connexion. Reconnectez-vous avant de supprimer votre compte.',
    },
    '2rac8cv8': {
      'en': '',
      'fr':
          'Trop de temps écoulé depuis la dernière connexion. Reconnectez-vous avant de changer votre adresse e-mail.',
    },
    'hovrwde0': {
      'en': '',
      'fr': 'E-mail de confirmation de changement d\'adresse e-mail envoyé !',
    },
    'xanys97q': {
      'en': '',
      'fr': 'Cette adresse e-mail est déjà utilisée',
    },
    'pb0wjozf': {
      'en': '',
      'fr':
          'L\'identifiant de connexion fourni est incorrect, mal renseigné ou a expiré',
    },
    'l16q3bj2': {
      'en': '',
      'fr': 'Format du fichier invalide',
    },
    'uzy3cx7j': {
      'en': '',
      'fr': 'Téléversement du fichier...',
    },
    '82ltfb30': {
      'en': '',
      'fr': 'Réussite !',
    },
    'v6w70ug9': {
      'en': '',
      'fr': 'Échec de téléversement du fichier',
    },
    '3bh7d286': {
      'en': '',
      'fr': '',
    },
    '0ktn5gbb': {
      'en': '',
      'fr': 'Choisir la source',
    },
    '4quoxri2': {
      'en': '',
      'fr': 'Galerie',
    },
    'z9yn0kvc': {
      'en': '',
      'fr': 'Galerie (photos)',
    },
    'jhs662k9': {
      'en': '',
      'fr': 'Galerie (vidéos)',
    },
    '8vmfla1s': {
      'en': '',
      'fr': 'Caméra',
    },
    'eff9jb2s': {
      'en': '',
      'fr': '',
    },
    'm9cazt54': {
      'en': '',
      'fr': '',
    },
    'euw891ks': {
      'en': '',
      'fr': '',
    },
    'b95vk2cd': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
