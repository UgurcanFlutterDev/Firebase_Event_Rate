import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': "Welcome",
          "login": "Login",
          "register": "Register",
          "password": "Password",
          "fullName": "Full Name",
          "email": "E-Mail",
          "cantBeEmpty": "This field can't be empty",
          "add": "Add",
          "title": "Title",
          "subTitle": "Subtitle",
          "creator": "Creator",
          "startDate": "Start Date",
          "startTime": "Start Time",
          "endDate": "End Date",
          "endTime": "End Time",
          "addEventTitle": "Add Event",
          "eventListTitle": "Event List",
          "description": "Description",
        },
        'tr_TR': {
          'welcome': "Hoşgeldiniz",
          "login": "Giriş Yap",
          "fullName": "Ad Soyad",
          "password": "Şifre",
          "register": "Üye Ol",
          "email": "E-Posta",
          "cantBeEmpty": "Bu alan boş bırakılamaz",
          "add": "Ekle",
          "title": "Başlık",
          "subTitle": "Alt Başlık",
          "creator": "Düzenleyen",
          "startDate": "Başlangıç Tarihi",
          "startTime": "Başlangıç Saati",
          "endDate": "Bitiş Tarihi",
          "endTime": "Bitiş Saati",
          "addEventTitle": "Organizasyon Ekle",
          "eventListTitle": "Organizasyon Listesi",
          "description": "Açıklama",
        },
      };
}
