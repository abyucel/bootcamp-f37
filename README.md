# OUA Bootcamp, F-37

Oyun ve Uygulama Akademisi Bootcamp, Takım F-37'nin projesi.

## Takım üyeleri

| Ad ve soyad       | Görevler                 | Bağlantılar                                                                                                  |
| ----------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------ |
| Ahmet Baran YÜCEL | Product Owner, Developer | [GitHub](https://github.com/abyucel), [LinkedIn](https://linkedin.com/in/abyucel)                            |
| Mustafa KARA      | Scrum Master, Developer  | [GitHub](https://github.com/Mustafaakaraa), [LinkedIn](https://linkedin.com/in/mustafakara0)                 |
| Ümmügülsüm YÜCEL  | Developer                | [GitHub](https://github.com/ummugulsumyucel), [LinkedIn](https://linkedin.com/in/ümmügülsüm-yücel-437510255) |
| Erva Nazlı TÜCCAR | Developer                | [GitHub](https://github.com/nazlii02), [LinkedIn](https://linkedin.com/in/erva-nazlı-tüccar-b7a800212)       |
| Mert SÖNMEZ       | Developer                | [GitHub](https://github.com/SnmzTony), [LinkedIn](https://linkedin.com/in/mert-sönmez-83b889246)             |

## Build işlemi

### Android

Modern Android akıllı telefon havuzunun büyük bir kısmında çalışacak bir APK oluşturmak için:

```sh
flutter build apk --release --target-platform android-arm,android-arm64
```

### iOS

Takımımızda macOS kullanan bir üye bulunmadığından Apple cihazları için bir uygulama sağlayamıyoruz.

## Product Backlog URL

 + https://docs.google.com/spreadsheets/d/1-t9auiCSkU0xhwKEhTpSQff-Z8Cynn-lCvCoE_f39IQ/edit?usp=sharing


# Ekotel - Ekoturizm odaklı tatil/seyahat uygulaması

## Özellikler

Uygulama; seyahat güzergahı, oteller ve aktiviteler gibi konular hakkında bilgi verir.
Kullanıcılar, tatil ve seyahat şirketlerini çevre dostu özellikleri üzerinden puanlandırırlar.
Tatil ve seyahat şirketleri, kendi profillerini doldurarak kullanıcılara hitap edebilirler.
Kullanıcılar, kendi profillerini tatilleri ve gezilerinde elde ettikleri kazanımlarla doldurarak yorumlarını dikkate alır bir görünüme sokabilirler.
Benzer şekilde her sezon, şirketler de bir liderlik tablosuna eklenir. En yüksek puanı alan şirketler, rekabetlerine nazaran daha çok gösterilirler.

## Kazanımlar
Ekoturistleri seyahat ve turizm sektörleri ile buluşturarak isteklerini karşılamayı amaçlar.
Tatil ve seyahat sektörlerini çevre dostu pratikler uygulamaya iterek dünyaya katkıda bulunur.

## Monetizasyon şeması
Şirketler ve yerel topluluklar, reklam vererek rekabette öne çıkmaya çalışacaklardır. Ana gelir kaynağımız reklamlardır.

## Hedef kitle
Uygulamanın hedef kitlesi ekoturizme yakın turistler ve sıkı ekoturistler olarak ikiye ayrılıyor.
Ekoturizme yakın turistleri uygulamada tutmanın en iyi yolu, sürekli indirimlerdir.
Sıkı ekoturistler, uygulamadan detaylı şirket analizleri isteyeceklerdir.

## Uygulamanın kullanım döngüsü:
Yayla turizmi tatili yapmak isteyen kullanıcı, uygulamaya giriş yapar ve arama sayfasını açar.
Kullanıcı fitreleri kendi kriterleri çerçevesinde ayarlar.
Kriterleri girdikten sonra kullanıcı, ekranda listelenen otelleri karşılaştırmak için karşılaştırma menüsünü açar.
Karşılaştırma menüsü, seçilen iki aynı tür şirketin özelliklerini kısa bir şekilde ekrana yan yana yansıtan bir sayfadır.
Uygulama üzerinden rezervasyon yapmak ve otele kendi iletişim yollarından ulaşmak gibi iki seçenekle karşı karşıya kalır.
Uygulama üzerinden rezervasyon yapan kullanıcılar, belirli kriterleri karşılayarak indirim kuponları gibi ödüller kazanırlar.
Uygulamadan rezervasyon yapıldıktan sonra, kullanıcının profiline ortalama olarak otellerle kıyasla dünyaya yayılmasını desteklemediği zararlı maddeler eklenir.
Bu örnekte, örnek olarak diğer oteller yerine bu oteli tercih ederek karbon salınımı konusunda diğer turistlere kıyasla %X daha az zarar vermiş ise profile bu miktar eklenir.+ Profile ekleme sistemi isteğe bağlıdır. Rezervasyon sırasında bu durum iptal edilebilir.
Otel dönüşü sonrası kullanıcı, uygulamada yorum yaparak bu otel hakkında tecrübelerini paylaşabilir ve rekabette görünümüne etki edebilir.

## SPRINT 1:
+Sprint içinde tamamlanması tahmin edilen puan:59
+Puan tamamlama şeması: Proje toplamında şu an bulunan görev listesine göre 206 puanlık temel iş bulunmaktaadır. Sprint 1 temel oluşturma ve fikir bulma aşaması olduğu için düşük puanlı fakat kritik görevleri koyduk. Sprint 2 en yüksek puanlı ve en önemli sprint olduğuna kararına varıldı.

## DAILY SCRUM:
+ Dailylerin belirlenmesi için ekibin içerisinde bulunan öğrencilerin final haftalarında bulunan sınav tarihlerini topladık.

![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/54a28874-39a1-4d0b-93bb-a6081e174040)

+ Tüm bu sınav takvimleri ardından Whatsapp üzerinden bir anket ile toplantıların aralıklarını ve toplantı saatlerini kararlaştırdık.

  ![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/3f6213d4-4206-4fe8-8797-265dc7d09bd9)   ![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/947cee77-6fb8-40b5-a791-7bc62dd134b8)

+ Anket ardından hafta içi her gün 20.30’da 15 dakikalık Dailyler yapmaya karar verdik. Toplantılarımızın yapılması ve dosyalarımızın saklanması için bir Discord kanalı oluşturduk.

  ## Sprint Review:
+ Projemizin fikir aşamasının çok önemli olduğu için ekibin temel odak noktasını bu tarafa çektik. Beyin fırtınası yaparak ekibin her üyesinin birden çok proje fikri bulmasını istedik ve eleyerek 5 adet temel proje fikri bıraktık.

![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/d0e68c48-ef10-4696-8f15-2d24a73d0de7)

+ Son aşamada proje fikrinin belirlenmesi için kapalı bir oylama yaptık ve projemizin fikri belirlenmiş oldu.

![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/0bfe609a-3251-43ee-8c8e-b1b7ccbc5f1a)

Proje fikri belirlendikten sonra ekibin görev dağılımlarını tamamladık.
+Mustafa : Scrum Master,Developer
+ Ahmet : Proje Master.Developer
+ Ümmügülsüm: Developer
+ Erva: Developer
+ Mert: Developer

+ Proje fikrinin sahibi Ahmet olduğu için proje master, daha önce bulunan deneyimlerden dolayı Mustafa Scrum Master seçildi.
+ Proje fikri sahibi Ahmet uygulamanın genel duruşu hakkında en fazla bilgiye sahip olması için Pseudo UI çizilmesi istendi, bu sayede Designerlar daha net şekilde tasarım yapılması sağlandı.

 
![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/ae3c0053-ded9-4e77-b115-7f8960997284)
![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/f8770ad5-5bbd-43c3-873c-da0d24939087)

+ Pseudo Design ardından UI tarafında daha önce tasarım yaptığı için Mustafa uygulamanın UI Designlarını figma üzerinden tasarlamaya başladı.

![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/01971817-9c86-41d0-b1e9-dfb7a1a65676)
![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/7eef9982-dacc-45e1-8f9a-7659375e6d66)

+ Uygulama UI’ı Proje Master’ının düşüncesi doğrultusunda olması için birden fazla revize gördü ve ortak noktalara ulaşıldı.

+ Tasarımların netleşmesi ardından uygulamanın sahip olması gereken fonksiyonlar ve özellikler backloglanarak listelendi.

+ Proje büyüklüğü ve ekip üyesi sayısı dikkate alınarak uygulamayı yürütmek için en pratik yolu Google Tablolarda bulduk. Backlog dosyasının yazılması için Project Master ve Scrum Master birden fazla toplantı gerçekleştirdi.
+ Scrum Master(Mustafa KARA)Teknik ve teknik olmayan task listesi üzerinden ekip üyelerine görevlerini atamaya başladı.
+ Tasklerin atanması ardından ekip üyeleri deadline sınırları içerisinde görevlerini yapmalarına başladılar.
+ Versiyonlar halinde gerçekleştirilmesine karar verilen proje ilk scum yani version 0.0.1 içersinde 
•	Welcome Page
•	Signin Screen
•	Register Screen
•	HomePage Basics
Sayfalarının kodlanması için gereken taskler verildi ve tamamlandı

## SPRINT BOARD UPDATE:

  ![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/d6f6ec58-507e-41d8-9d34-3187a845eb1e)    ![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/b37e2948-77b1-41b6-96b9-7f8f6b55f675)

## SPRINT NOTLARI:

Teknik Olmayan Görevler:
-Ekip üyelerine uygun dailylerin tasarlandı ve genel toplantıların yapılması için bir discord sunucusu kuruldu
- Sprintler arasında yapılacak işlerin karar verilmesi. 
- Github reposunun açıldı ve her üyenin o repoyu forklandı.

Teknik Olan Görevler: 
-UI Designda bulunan Color Palette'nin çıkarıldı.
-Uygulamanın içerisinde bulunan Asstlerler projeye dahil edildi.
-Uygulamanın kullanacağı font grupları dahil edildi.
-Firebase servisleri bağlandı ve temelleri atıldı.
-Projede bulunan sabit olan butonlar, bottombar vb. bir const objeler tanımlandı.
-WelcomePage kodlandı.
-SigninPage kodlandı.
-Login kodlandı.
-HomePage kodlandı.

 ## Screen Shots
 ![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/0529ee64-e16c-453d-bca2-8560658f0ec3)   ![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/f2ed2020-5dd6-4592-9a62-efcc7064cc8f) 
![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/99c9af18-4bb6-48de-b081-eb7f606ec4a5)
 ![image](https://github.com/abyucel/bootcamp-f37/assets/123782291/d33f8c22-5e52-444a-9e90-90de44d2ab97)


## Sprint Retrospective:
-	Projenin genel gidişatı için gereken temeller tamamlanmıştır
-	Projede kullanıcı girişi, kayıt ol ve misafir girişi işlemleri için firebase temelleri kurulmuştur.
-	4 sayfanın şablon olarak kullanılıcak kodlanmaları tamamlanmıştır
-	Uygulama içerisinde kullanılıcak button kütüphanesi custom olarak kodlanmıştır.
-	Geri kalan 2 sprint süresinde ekibin her üyesinin daha fazla aktif olması gerektiği kararına varılmıştır.
-	Görevlerin deadline ı için daha fazla süre istenmiştir.











