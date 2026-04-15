import '../models/question.dart';

const List<Question> questionsDb = [
  Question(
    text: "Flutter ile hangi dilde kodlama yapılır?",
    options: ["Java", "Kotlin", "Swift", "Dart", "C#"],
    correctOptionIndex: 3,
  ),
  Question(
    text: "Aşağıdakilerden hangisi bir state management (durum yönetimi) aracı değildir?",
    options: ["Provider", "GetX", "Bloc", "Riverpod", "Django"],
    correctOptionIndex: 4,
  ),
  Question(
    text: "Flutter'da kullanıcı arayüzünü oluşturan temel yapı taşına ne ad verilir?",
    options: ["Component", "Widget", "Element", "Module", "View"],
    correctOptionIndex: 1,
  ),
  Question(
    text: "Uygulamada farklı sayfalar arası geçiş yapmak için hangi yapı kullanılır?",
    options: ["Navigator", "Router API", "StatefulWidget", "PageRoute", "Scaffold"],
    correctOptionIndex: 0,
  ),
  Question(
    text: "Aşağıdakilerden hangisi Flutter'ın en büyük avantajı olarak bilinir?",
    options: ["Sadece web için olması", "Sadece iOS'da çalışması", "Tek kod tabanıyla çoklu platform", "Eski dilleri desteklemesi", "Ücretli bir araç olması"],
    correctOptionIndex: 2,
  ),
  Question(
    text: "StatefulWidget ile StatelessWidget arasındaki en temel fark nedir?",
    options: ["Hız", "Görünüm", "Durumun (State) değişebilmesi", "Büyüklük", "Kullanılan dil"],
    correctOptionIndex: 2,
  ),
  Question(
    text: "Flutter uygulamasının çalıştığı ana fonksiyon hangisidir?",
    options: ["startApp()", "runApp()", "mainApp()", "buildApp()", "init()"],
    correctOptionIndex: 1,
  ),
  Question(
    text: "Ekrandaki widgetların dikey olarak sıralanmasını sağlayan widget hangisidir?",
    options: ["Row", "Wrap", "Stack", "Column", "Align"],
    correctOptionIndex: 3,
  ),
  Question(
    text: "Boşluk bırakmak (padding) için aşağıdaki widget'lardan hangisi kullanılır?",
    options: ["SizedBox", "Margin", "Padding Widget", "Container", "Hepsi veya çoğu"],
    correctOptionIndex: 4, // Although Padding is specific, Container/SizedBox can be used, usually Padding. Let's make it more specific
  ),
  Question(
    text: "Dart dilinde asenkron işlemler için hangi anahtar kelimeler kullanılır?",
    options: ["sync/await", "async/await", "future/wait", "delay/execute", "promise/then"],
    correctOptionIndex: 1,
  ),
];

// 9. Sorunun şıklarını daha netleştirelim
const List<Question> refinedQuestions = [
  ...questionsDb
];
