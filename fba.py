#!/usr/bin/env python3

import base64

import firebase_admin
from firebase_admin import credentials, firestore

hotels = [
    [
        "Greenleaf Oasis",
        "Greenleaf Oasis, yeşilin ve doğal güzelliklerin arasında saklı bir cennet olarak öne çıkar. Çevreci tasarımı ve sürdürülebilirlik çabalarıyla konaklamalara çevre dostu bir konaklama deneyimi sunar. Doğal malzemelerin kullanımı ve enerji tüketimiyle ilgili önlemlerle koruma önlemlerini gösterir.",
        "K8nUCKZEwyOi4awd5oOeNoqewZj1",
        "Greenleaf Oasis otelinde geçirdiğim konaklama deneyimi oldukça çeşitli duyguları beraberinde getirdi. Otelin doğal güzelliklerle çevrili olduğu gerçekten etkileyiciydi. Yeşilin ve doğanın içinde kaybolmuş gibi hissetmek harikaydı. Otelin çevreci tasarımı ve sürdürülebilirlik çabaları da takdire şayandı. Doğal malzemelerin kullanımı ve enerji tüketimiyle ilgili önlemler, çevre dostu bir konaklama deneyimi sunuyor. Ancak, konaklama sürecinde bazı beklentilerimi karşılamayan unsurlar da vardı. Otelin hizmet kalitesi bazen düşük olabiliyordu ve bazı zamanlarda iletişim eksikliği yaşandı. Bu durum benim konaklamamı biraz etkiledi. 5 üzerinden 3",
        ["placeholder2.jpg"],
        5,
        1.5,
    ],
    [
        "Verdant Retreat",
        "Yeşillikler içinde gizlenmiş olan Verdant Retreat, doğada kaybolmak huzurlu bir konaklama deneyimi sunar. Çevre dostu tasarımı ve doğal materyallerin kullanımıyla dikkat çekici otel, misafirlere doğayla iç içe bir tatil imkanı sunar. Sürdürülebilirlik ve doğal koruma ön korumadır.",
        "K8nUCKZEwyOi4awd5oOeNoqewZj1",
        "Verdant Retreat otelinde geçirdiğim tatil unutulmazdı. Doğa ile iç içe olan konumu ve çevre dostu tasarımı gerçekten etkileyiciydi. Odalar doğal malzemelerle dekore edilmişti ve huzurlu bir atmosfer sunuyordu. Otelin sürdürülebilirlik çabaları takdir edilesiydi. Küçük aksaklıklar yaşadığımı söylemek gerekirse, internet bağlantısı ve sıcak su temini bazen sorunlu olabiliyordu. Bununla birlikte, genel olarak Verdant Retreat'i 5 üzerinden 4 puanla değerlendiriyorum. Doğayla uyumlu bir konaklama deneyimi için harika bir seçenek olduğunu düşünüyorum.",
        ["placeholder2.jpg"],
        4,
        2.5,
    ],
    [
        "Evergreen Retreat",
        "Evergreen Retreat, bitkilerle kaplı bir çevrede bir sığınak sunar. Geri dönüştürülebilir malzemeler kullanılan yapılar ve enerji önlemleriyle çevre dostu bir konaklama sağlar. Misafirlerine doğayla uyumlu bir tatil deneyimi ve dingin bir atmosfer sunar.",
        "K8nUCKZEwyOi4awd5oOeNoqewZj1",
        "Evergreen Retreat otelinde geçirdiğim konaklamadan biraz hayal kırıklığı yaşadım. Otelin doğal bitki örtüsüyle kaplı bir çevrede konumlanması güzel olsa da, bazı beklentilerimi karşılamadı. Geri dönüştürülebilir malzemelerin kullanıldığı yapılar ve enerji önlemleri, çevre dostu bir konaklama deneyimi sunuyor olsa da, benim için yeterli değildi. Otelde hizmet kalitesi ve personelin ilgisi biraz düşük seviyedeydi. İletişim eksikliği ve bazı sorunlara hızlı çözüm bulamama gibi durumlar konaklamamı olumsuz etkiledi. Ayrıca, oda temizliği ve düzen konusunda da bazı aksaklıklar vardı. 5 üzerinden 2",
        ["placeholder2.jpg"],
        4,
        3.5,
    ],
    [
        "Harmony Eco Lodge",
        "Doğayla uyumlu bir konaklama deneyimi sunan Harmony Eco Lodge, sefer düzenleme konusunda öncü bir oteldir. Doğal güzelliklerle dolu ortamlar, geri dönüşümlü malzemelerin kullanımı ve tüketilen enerji kaynaklarıyla çevre dostu bir tatil imkanı sağlar. Huzur dolu huzurlu ve kalıcı olmak üzere konaklamayla misafirlerine unutulmaz anlar sunar.",
        "K8nUCKZEwyOi4awd5oOeNoqewZj1",
        "Harmony Eco Lodge'da geçirdiğim konaklama süreci harikaydı. Doğayla uyumlu yaklaşımı ve huzur dolu atmosferi beni etkiledi. Çevre dostu bir tatil deneyimi için mükemmel bir seçenek! 5 üzerinden 5",
        ["placeholder2.jpg"],
        3,
        4.5,
    ],
    [
        "Tropikal Nefes",
        "Tropikal Nefes, doğanın sıcak kucaklamasında huzur ve macera sunan benzersiz bir ekoturizm destinasyonudur. Sürdürülebilirlik ilkesine dayalı olarak inşa edilmiş olan otelimiz, yerel ekonomiye katkıda bulunmayı ve doğal kaynakları korumayı amaçlamaktadır. Misafirlerimiz, tropik yağmur ormanlarıyla çevrili olan konaklama birimlerinde unutulmaz bir deneyim yaşarken, doğal yaşamı keşfetme fırsatı bulacaklar.",
        "K8nUCKZEwyOi4awd5oOeNoqewZj1",
        "Tropikal Nefes, eşsiz doğal güzellikleri ve sürdürülebilirlik odaklı yaklaşımıyla beni büyüledi. Burada kaldığım süre boyunca yerel flora ve fauna hakkında çok şey öğrendim. Çalışanlar, çevre dostu uygulamalara olan bağlılıklarıyla etkileyici bir örnek oldular. Konaklama birimleri harikaydı ve huzurlu bir atmosferde dinlenebildim. Kesinlikle geri dönmek isteyeceğim bir yer. 5 yıldız.",
        ["placeholder2.jpg"],
        4,
        5.5,
    ],
    [
        "Dağların Sessizliği",
        "Dağların Sessizliği, yüksek rakımlarda konumlanmış olan sakin ve çevre dostu bir ekoturizm otelidir. İşletmemiz, misafirlerine doğal güzelliklerle dolu bir ortamda rahatlık ve huzur sunmayı amaçlamaktadır. Organik tarım uygulamalarıyla yetiştirilen yerel yemeklerimizi tadarken veya rehberli doğa yürüyüşleriyle etkileyici manzaraları keşfederken, misafirlerimiz doğayla bütünleşme deneyimi yaşayacaklar.",
        "K8nUCKZEwyOi4awd5oOeNoqewZj1",
        "Dağların Sessizliği, adını hak eden bir otel. Buraya geldiğimde doğanın gücünü ve sessizliğini hissettim. Personel, çevrenin korunmasına büyük önem veriyor ve yerel topluluğa katkıda bulunuyor. Konforlu odalar ve nefes kesen manzaralar, tam bir geri çekilme ve yeniden şarj olma fırsatı sunuyor. Kesinlikle doğa severlere tavsiye ederim.",
        ["placeholder2.jpg"],
        2,
        6.5,
    ],
]

if __name__ == "__main__":
    cred = credentials.Certificate("firebase.cred.json")
    app = firebase_admin.initialize_app(
        cred,
        {
            "databaseURL": "https://bootcamp-f37-app.europe-west1.firebasedatabase.app",
        },
    )
    db = firestore.client()
    # print(db.document("users/x").get().to_dict())
    for i in range(len(hotels)):
        comments = [
            {
                "user": hotels[i][2],
                "content": hotels[i][3],
            }
        ]
        images = []
        for j in range(len(hotels[i][4])):
            image_path = hotels[i][4][j]
            with open(image_path, "rb") as f:
                b64 = base64.b64encode(f.read()).decode()
            images.append(b64)
        try:
            comments = [*db.document(f"hotels/{i}").get()._data["comments"], *comments]
            images = [*db.document(f"hotels/{i}").get()._data["images"], *images]
        except:
            pass
        db.document(f"hotels/{i}").delete()
        db.document(f"hotels/{i}").create(
            {
                "id": i,
                "name": hotels[i][0],
                "description": hotels[i][1],
                "created_at": 0,
                "comments": comments,
                "images": images,
                "stars": hotels[i][5],
                "distance": hotels[i][6]
            },
        )
