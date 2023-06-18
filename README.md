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



