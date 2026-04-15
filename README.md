# Flutter Quiz Uygulaması 🚀

Bu proje, Flutter kullanılarak geliştirilmiş, etkileşimli, dinamik skorlamaya sahip ve estetik açıdan zengin (Premium UI) bir mobil "Quiz (Bilgi Yarışması)" uygulamasıdır. Mobil Uygulama Geliştirme dersi için hazırlanan ödev isterlerini (%100 oranında) eksiksiz karşılamak üzere tasarlanmıştır.

## 🌟 Ekran Görüntüsü / Görünüm
**(Burası projenin GitHub'a eklenmesi durumunda uygulamanın çalıştığını gösteren görseller konulacak alandır.)**

Proje **Glassmorphism** (Cam efekti) hissi veren, **Purple & Blue Vibrant (Vurgulu Mor ve Mavi)** gradient geçişleri olan ultra-modern bir arayüz tasarımına sahiptir. Sıkıcı ve düz bir tasarımdan ziyade kullanıcının gözüne hitap eden bir UX/UI sunar. Tıklamalar, animasyonlar ve gölge detayları profesyonel bir hassasiyetle kodlanmıştır.

---

## 🎯 Proje İsterleri Çizelgesi

| # | İster / Özellik | Durum | Detaylar |
| - | -------------- | ----- | --------- |
| **1.** | Soru-Cevap Yapısı (60p) | ✅ Tamamlandı | Uygulama, model tabanlı 10 adet soru içeren stabil bir altyapıya sahiptir. |
| **2.** | Şık Seçenekleri (60p) | ✅ Tamamlandı | Her soru için tam olarak 5 adet tıklanabilir animasyonlu (%100 uyumlu) şık bulunmaktadır. |
| **3.** | Süre Sınırı / Sayacı (60p) | ✅ Tamamlandı | Ekranın üst köşesinde yer alan sayaç (saniye) vasıtasıyla her soruya **15 saniye** sınırlama konulmuştur. Süre bittiğinde şık seçimi otomatik olarak engellenir ve bir sonraki soruya atlanır. Akıllı uyarı efekti (5 saniye kala kırmızı olur) eklidir. |
| **4.** | Puanlama Sistemi (20p) | ✅ Tamamlandı | Seçilen şıkkın doğru olması halinde arka planda şeffaf bir yeşil ton görünür ve skoru arttırır. |
| **5.** | Toplam Puanın Gösterimi (20p)| ✅ Tamamlandı | Sorular bittikten sonra sonuç (ResultScreen) ekranı açılır ve **"Skorunuz: X / Y"** şeklinde net mesaj verir. |
| **6.** | Quiz Sonu Ekranı (20p) | ✅ Tamamlandı | Akıcı bir geçiş ile (Navigation) "Quiz Tamamlandı!" ibaresiyle öğrenciye sonuçlar sunulur. |
| **7.** | Yeniden Başlatma Tuşu (20p) | ✅ Tamamlandı | State resetlemesi tam yapılarak oluşturulan "Yeniden Başla" butonu yardımıyla uygulamayı yeniden başlatır ve skoru ile indeksi problemsiz sıfırlar. |

---

## 🛠️ Kullanılan Teknolojiler
- **Framework:** Flutter (Dart)
- **Tema & Tasarım:** Native Material / Custom Gradient BoxDecoration
- **State Yönetimi:** Vanilla Flutter (StatefulWidget) -> Karmaşık paketler kullanılmadan saf ve hızlı durum yönetimi sağlanmıştır.

## 🚀 Projeyi Çalıştırma

Projeyi bilgisayarınızda çalıştırmak için aşağıdaki adımları takip edebilirsiniz:

1. Bilgisayarınızda Flutter'ın kurulu olduğundan emin olun.
2. Proje dizinine gidin:
```bash
cd flutter_quiz_app
```
3. Paketleri (Dependencies) indirin:
```bash
flutter pub get
```
4. Projeyi herhangi bir Emülatör veya Chrome üzerinde başlatın:
```bash
flutter run
```

---

## 💡 Klasör Yapısı (Architecture)
Projenin ölçeklenebilir olması için kodlar "Spaghetti Code" yerine temiz mimari klasörleri ile bölünmüştür:
* `lib/models/`: Veri modelleri (Soru Yapısı)
* `lib/data/`: Geçici Veritabanı ve Soru listeleri
* `lib/screens/`: Arayüz (UI) ekranları
  * `quiz_screen.dart`: Yarışma mantığı, zamanlayıcı, state kontrolü
  * `result_screen.dart`: Puanların hesaplandığı sonuç ekranı
* `lib/main.dart`: Uygulama Başlatıcısı & Tema Yöneticisi

> "Tasarım yalnızca nasıl göründüğü ya da hissettirdiği değildir. Tasarım nasıl çalıştığıdır." - Steve Jobs
