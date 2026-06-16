import 'package:flutter/material.dart';

void main() {
  runApp(const HezeTravelApp());
}

const Color kPrimary = Color(0xffb83268);
const Color kPrimaryLight = Color(0xffffeaf3);
const Color kAccentBlue = Color(0xff2f79bd);
const Color kAccentGreen = Color(0xff287a54);
const Color kInk = Color(0xff21181d);
const Color kBg = Color(0xfffff7fb);
const Color kCard = Color(0xffffffff);

// 真实图片来源：Wikimedia Commons、齐鲁网/闪电新闻、优旅度假网、新华网、凤凰网等公开页面。
const String _imgPeony =
    'https://commons.wikimedia.org/wiki/Special:FilePath/%E7%89%A1%E4%B8%B9-%E8%8F%B1%E8%8A%B1%E6%B9%9B%E9%9C%B2%20Paeonia%20suffruticosa%20-%E8%8F%8F%E6%BE%A4%E6%9B%B9%E5%B7%9E%E7%89%A1%E4%B8%B9%E5%9C%92%20Heze%2C%20China-%20%2812517375434%29.jpg';
const String _imgPeony2 =
    'https://commons.wikimedia.org/wiki/Special:FilePath/%E6%97%A5%E6%9C%AC%E7%89%A1%E4%B8%B9-%E8%8A%B1%E7%8E%8B%20Paeonia%20suffruticosa%20Kao%20-%E8%8F%8F%E6%BE%A4%E6%9B%B9%E5%B7%9E%E7%89%A1%E4%B8%B9%E5%9C%92%20Heze%2C%20China-%20%2812517374004%29.jpg';
const String _imgOldCaozhou =
    'https://img12.iqilu.com/1/clue/202205/19/eb887a5b-67a3-4732-a852-3440f4b830ef.jpg';
const String _imgTianxiang =
    'https://www.yolv.com/uploads/allimg/c090820/12512c111D0-3c15.jpg';
const String _imgMuseum =
    'https://commons.wikimedia.org/wiki/Special:FilePath/Heze%20Museum.jpg';
const String _imgSheepSoup =
    'https://www.news.cn/food/20241101/fc3f8c9e4ee64c8db53bdba6aaabb61f/20241101fc3f8c9e4ee64c8db53bdba6aaabb61f_20241101d86ab6c410a9434897bd6eb5e4917d3c.png';
const String _imgZhuangmo =
    'https://p0.itc.cn/q_70/images03/20220211/ab45d8c0885a42d1bebe52e93882ba66.jpeg';
const String _imgBeef =
    'https://x0.ifengimg.com/res/2019/41DCA13F7FD9BA69514CE1E2F2B53A9083D2C40E_size103_w640_h857.jpeg';

String tr(AppLang lang, String zh, String ko) => lang == AppLang.zh ? zh : ko;

enum AppLang { zh, ko }

class HezeTravelApp extends StatefulWidget {
  const HezeTravelApp({super.key});

  @override
  State<HezeTravelApp> createState() => _HezeTravelAppState();
}

class _HezeTravelAppState extends State<HezeTravelApp> {
  AppLang lang = AppLang.zh;

  void toggleLang() {
    setState(() => lang = lang == AppLang.zh ? AppLang.ko : AppLang.zh);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: tr(lang, '菏泽旅行推荐', '허쩌 여행 추천'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
        scaffoldBackgroundColor: kBg,
        useMaterial3: true,
        fontFamilyFallback: const ['PingFang SC', 'Noto Sans CJK SC', 'Microsoft YaHei', 'Arial'],
      ),
      home: HomePage(lang: lang, onToggleLang: toggleLang),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.lang, required this.onToggleLang});
  final AppLang lang;
  final VoidCallback onToggleLang;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      OverviewPage(lang: widget.lang, onToggleLang: widget.onToggleLang),
      PlacesPage(lang: widget.lang, onToggleLang: widget.onToggleLang),
      FoodPage(lang: widget.lang, onToggleLang: widget.onToggleLang),
      CulturePage(lang: widget.lang, onToggleLang: widget.onToggleLang),
      GuidePage(lang: widget.lang, onToggleLang: widget.onToggleLang),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        backgroundColor: Colors.white,
        indicatorColor: kPrimaryLight,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: tr(widget.lang, '首页', '홈'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.landscape_outlined),
            selectedIcon: const Icon(Icons.landscape),
            label: tr(widget.lang, '景点', '명소'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.restaurant_outlined),
            selectedIcon: const Icon(Icons.restaurant),
            label: tr(widget.lang, '美食', '음식'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.local_florist_outlined),
            selectedIcon: const Icon(Icons.local_florist),
            label: tr(widget.lang, '文化', '문화'),
          ),
          NavigationDestination(
            icon: const Icon(Icons.map_outlined),
            selectedIcon: const Icon(Icons.map),
            label: tr(widget.lang, '攻略', '코스'),
          ),
        ],
      ),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key, required this.lang, required this.onToggleLang});
  final AppLang lang;
  final VoidCallback onToggleLang;

  @override
  Widget build(BuildContext context) {
    return PageShell(
      lang: lang,
      onToggleLang: onToggleLang,
      title: tr(lang, '菏泽 · 中国牡丹之都', '허쩌 · 중국 모란의 도시'),
      subtitle: tr(lang, '山东西南部 · 曹州古韵 · 鲁西南风味', '산둥 서남부 · 조주 문화 · 루시난 미식'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeroBanner(lang: lang),
          const SizedBox(height: 18),
          StatsRow(lang: lang),
          const SizedBox(height: 22),
          SectionTitle(icon: Icons.location_on, title: tr(lang, '城市介绍', '도시 소개')),
          const SizedBox(height: 10),
          InfoCard(
            color: Colors.white,
            child: Text(
              tr(
                lang,
                '菏泽古称曹州，位于山东省西南部，是著名的“中国牡丹之都”。这里既有曹州牡丹园、老城曹州、菏泽市博物馆等城市景点，也有单县羊肉汤、郓城壮馍等鲁西南美食。春天看花，夜晚逛老城，一座城市可以同时感受到花香、历史和烟火气。',
                '허쩌는 옛 이름이 조주(曹州)이며 산둥성 서남부에 위치한 도시입니다. “중국 모란의 도시”로 유명하고, 조주모란원·조주 옛거리·허쩌시박물관 같은 명소와 산셴 양고기탕, 윈청 좡모 같은 루시난 음식을 함께 즐길 수 있습니다. 봄에는 꽃을 보고, 밤에는 옛거리를 걸으며 역사와 생활 분위기를 느끼기 좋습니다.',
              ),
              style: const TextStyle(fontSize: 15.5, height: 1.7, color: kInk),
            ),
          ),
          const SizedBox(height: 22),
          SectionTitle(icon: Icons.star_rounded, title: tr(lang, '旅行亮点', '여행 포인트')),
          const SizedBox(height: 12),
          FeatureGrid(
            items: [
              FeatureItem(Icons.local_florist, tr(lang, '牡丹花海', '모란 꽃바다'), tr(lang, '曹州牡丹园春季最出片', '봄철 조주모란원이 핵심 포인트'), const Color(0xffffeaf3)),
              FeatureItem(Icons.account_balance, tr(lang, '曹州古韵', '조주 옛 정취'), tr(lang, '老城曹州适合夜游漫步', '조주 옛거리는 야간 산책 추천'), const Color(0xffeef5ff)),
              FeatureItem(Icons.restaurant, tr(lang, '鲁西南味道', '루시난 음식'), tr(lang, '羊肉汤、壮馍、烧牛肉', '양고기탕·좡모·소고기 요리'), const Color(0xfffff3e0)),
              FeatureItem(Icons.museum, tr(lang, '博物馆文化', '박물관 문화'), tr(lang, '了解菏泽历史与牡丹文化', '허쩌 역사와 모란 문화를 이해'), const Color(0xfff0e9ff)),
            ],
          ),
          const SizedBox(height: 22),
          SectionTitle(icon: Icons.wb_sunny_rounded, title: tr(lang, '最佳旅游季节', '추천 여행 시기')),
          const SizedBox(height: 12),
          SeasonBanner(lang: lang),
        ],
      ),
    );
  }
}

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key, required this.lang});
  final AppLang lang;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        children: [
          NetImage(url: _imgPeony, height: 250, label: tr(lang, '曹州牡丹园', '조주모란원'), icon: Icons.local_florist),
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withAlpha(178), Colors.transparent, Colors.black.withAlpha(110)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            left: 22,
            right: 22,
            bottom: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr(lang, '菏泽 · Heze', '허쩌 · Heze'),
                  style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 8),
                Text(
                  tr(lang, '牡丹花开时，这座城市最浪漫。', '모란이 피는 계절, 이 도시는 가장 낭만적입니다.'),
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    HeroBadge(tr(lang, '🌸 牡丹之都', '🌸 모란의 도시')),
                    HeroBadge(tr(lang, '🏛️ 曹州古韵', '🏛️ 조주 문화')),
                    HeroBadge(tr(lang, '🍲 鲁西南美食', '🍲 루시난 미식')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeroBadge extends StatelessWidget {
  const HeroBadge(this.label, {super.key});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(60),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withAlpha(110)),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
    );
  }
}

class StatsRow extends StatelessWidget {
  const StatsRow({super.key, required this.lang});
  final AppLang lang;

  @override
  Widget build(BuildContext context) {
    final items = [
      ('1200+', tr(lang, '牡丹品种', '모란 품종')),
      ('4月', tr(lang, '最佳花期', '추천 꽃철')),
      ('鲁西南', tr(lang, '地域风味', '지역 풍미')),
      ('曹州', tr(lang, '历史名片', '역사 명칭')),
    ];
    return Row(
      children: List.generate(items.length, (i) {
        final item = items[i];
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(left: i == 0 ? 0 : 8),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                Text(item.$1, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: kPrimary)),
                const SizedBox(height: 4),
                Text(item.$2, style: const TextStyle(fontSize: 11.5, color: Colors.black54, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class PlacesPage extends StatelessWidget {
  const PlacesPage({super.key, required this.lang, required this.onToggleLang});
  final AppLang lang;
  final VoidCallback onToggleLang;

  @override
  Widget build(BuildContext context) {
    final places = [
      PlaceData(
        imageUrl: _imgPeony,
        title: tr(lang, '曹州牡丹园', '조주모란원'),
        tag: tr(lang, '必去', '필수'),
        rating: '4.8',
        distance: tr(lang, '市区北部', '시내 북부'),
        description: tr(lang,
            '菏泽最具代表性的牡丹观赏地，花季时颜色层次丰富，适合拍摄花海、人像和城市宣传画面。',
            '허쩌를 대표하는 모란 관람지입니다. 꽃철에는 색감이 풍부하여 꽃밭 사진과 인물 사진을 찍기 좋습니다.'),
        tips: tr(lang, '4月中上旬最适合观赏；上午光线柔和，拍照更好。', '4월 중상순이 가장 좋고, 오전의 부드러운 빛이 사진에 적합합니다.'),
        openTime: tr(lang, '花期 08:00–18:00', '꽃철 08:00–18:00'),
        ticket: tr(lang, '旺季约 ¥60–75', '성수기 약 60–75위안'),
        color: const Color(0xffffeaf3),
        tagColor: kPrimary,
      ),
      PlaceData(
        imageUrl: _imgOldCaozhou,
        title: tr(lang, '老城曹州', '조주 옛거리'),
        tag: tr(lang, '夜游', '야경'),
        rating: '4.7',
        distance: tr(lang, '市中心', '시내 중심'),
        description: tr(lang,
            '以青年湖、永安塔、1466街等街区为核心，适合傍晚后散步、看灯光、品尝小吃。',
            '청년호·영안탑·1466거리 등을 중심으로 조성된 옛거리로, 저녁 산책과 야경, 길거리 음식을 즐기기 좋습니다.'),
        tips: tr(lang, '建议傍晚 17:30 后前往，灯光亮起后氛围更好。', '17:30 이후 방문하면 조명이 켜져 분위기가 더 좋습니다.'),
        openTime: tr(lang, '街区全天', '거리 상시 개방'),
        ticket: tr(lang, '免费', '무료'),
        color: const Color(0xffeef5ff),
        tagColor: kAccentBlue,
      ),
      PlaceData(
        imageUrl: _imgTianxiang,
        title: tr(lang, '天香公园', '톈샹공원'),
        tag: tr(lang, '休闲', '휴식'),
        rating: '4.4',
        distance: tr(lang, '中华路附近', '중화로 부근'),
        description: tr(lang,
            '市区开放型公园，以牡丹和湖景为主要特色，适合短暂停留、休息和散步。',
            '도심의 개방형 공원으로 모란과 호수 풍경이 특징입니다. 짧게 쉬거나 산책하기 좋습니다.'),
        tips: tr(lang, '可作为一日游中间休息点，也适合带家人散步。', '하루 여행 중 쉬어 가는 지점으로 좋고 가족 산책에도 적합합니다.'),
        openTime: tr(lang, '06:00–21:00', '06:00–21:00'),
        ticket: tr(lang, '免费', '무료'),
        color: const Color(0xffecf8ef),
        tagColor: kAccentGreen,
      ),
      PlaceData(
        imageUrl: _imgMuseum,
        title: tr(lang, '菏泽市博物馆', '허쩌시박물관'),
        tag: tr(lang, '文化', '문화'),
        rating: '4.5',
        distance: tr(lang, '华英路', '화잉로'),
        description: tr(lang,
            '了解菏泽历史、人文和牡丹文化的室内场馆，适合下雨天或想补充历史背景时参观。',
            '허쩌의 역사·인문·모란 문화를 이해할 수 있는 실내 공간입니다. 비 오는 날이나 역사 배경을 알고 싶을 때 추천합니다.'),
        tips: tr(lang, '通常需要预约，周一可能闭馆，出发前建议确认开放信息。', '예약이 필요할 수 있고 월요일 휴관 가능성이 있어 방문 전 확인이 좋습니다.'),
        openTime: tr(lang, '09:00–17:00', '09:00–17:00'),
        ticket: tr(lang, '免费预约', '무료 예약'),
        color: const Color(0xfff1eaff),
        tagColor: const Color(0xff7b5ea7),
      ),
    ];

    return PageShell(
      lang: lang,
      onToggleLang: onToggleLang,
      title: tr(lang, '真实景点图片', '실제 명소 사진'),
      subtitle: tr(lang, '牡丹 · 老城 · 公园 · 博物馆', '모란 · 옛거리 · 공원 · 박물관'),
      child: Column(children: places.map((p) => PlaceCard(data: p)).toList()),
    );
  }
}

class FoodPage extends StatelessWidget {
  const FoodPage({super.key, required this.lang, required this.onToggleLang});
  final AppLang lang;
  final VoidCallback onToggleLang;

  @override
  Widget build(BuildContext context) {
    final foods = [
      FoodData(
        imageUrl: _imgSheepSoup,
        title: tr(lang, '单县羊肉汤', '산셴 양고기탕'),
        subtitle: tr(lang, '菏泽代表味道', '허쩌 대표 음식'),
        description: tr(lang,
            '汤色乳白、味道鲜香，是单县最有名的地方美食。适合早餐或午餐，搭配烧饼更有本地味。',
            '뽀얀 국물과 진한 향이 특징인 산셴의 대표 음식입니다. 아침이나 점심으로 좋고, 구운 빵과 함께 먹으면 더 현지 느낌이 납니다.'),
        tags: [tr(lang, '热汤', '따뜻한 국물'), tr(lang, '地方名吃', '지역 명물'), '¥15–30'],
        color: const Color(0xfffff3e0),
      ),
      FoodData(
        imageUrl: _imgZhuangmo,
        title: tr(lang, '郓城壮馍', '윈청 좡모'),
        subtitle: tr(lang, '外焦里嫩的面食', '겉바속촉 밀가루 음식'),
        description: tr(lang,
            '郓城传统小吃，外皮焦香、内馅扎实，分量大，很适合做午餐或旅途中补充体力。',
            '윈청의 전통 간식으로 겉은 바삭하고 속은 든든합니다. 양이 많아 점심이나 여행 중 간식으로 좋습니다.'),
        tags: [tr(lang, '面食', '밀가루 음식'), tr(lang, '郓城特色', '윈청 특색'), '¥8–15'],
        color: const Color(0xffeef5ff),
      ),
      FoodData(
        imageUrl: _imgBeef,
        title: tr(lang, '曹县烧牛肉', '차오현 구운 소고기'),
        subtitle: tr(lang, '鲁西南熟食名吃', '루시난 육류 별미'),
        description: tr(lang,
            '曹县烧牛肉色泽红亮、肉质紧实，是菏泽地区常见的熟食和伴手礼。冷切热吃都可以。',
            '차오현의 구운 소고기는 붉은 색감과 탄탄한 식감이 특징입니다. 허쩌 지역의 대표적인 숙식·선물용 음식입니다.'),
        tags: [tr(lang, '熟食', '조리육'), tr(lang, '伴手礼', '선물'), tr(lang, '曹县', '차오현')],
        color: const Color(0xffffeeee),
      ),
      FoodData(
        imageUrl: _imgPeony2,
        title: tr(lang, '牡丹主题糕点', '모란 테마 과자'),
        subtitle: tr(lang, '花城伴手礼', '꽃의 도시 기념품'),
        description: tr(lang,
            '以牡丹元素为主题的糕点和文创礼盒，适合作为旅游纪念或送朋友的小礼物。',
            '모란을 소재로 한 과자와 기념 선물 세트입니다. 여행 기념품이나 친구에게 줄 선물로 좋습니다.'),
        tags: [tr(lang, '伴手礼', '기념품'), tr(lang, '牡丹元素', '모란 디자인'), '¥30–80'],
        color: const Color(0xffffeaf3),
      ),
    ];

    return PageShell(
      lang: lang,
      onToggleLang: onToggleLang,
      title: tr(lang, '菏泽美食图片', '허쩌 음식 사진'),
      subtitle: tr(lang, '羊肉汤 · 壮馍 · 烧牛肉 · 牡丹礼盒', '양고기탕 · 좡모 · 소고기 · 모란 선물'),
      child: Column(children: foods.map((f) => FoodCard(data: f)).toList()),
    );
  }
}

class CulturePage extends StatelessWidget {
  const CulturePage({super.key, required this.lang, required this.onToggleLang});
  final AppLang lang;
  final VoidCallback onToggleLang;

  @override
  Widget build(BuildContext context) {
    return PageShell(
      lang: lang,
      onToggleLang: onToggleLang,
      title: tr(lang, '牡丹与曹州文化', '모란과 조주 문화'),
      subtitle: tr(lang, '花城记忆 · 城市符号 · 历史人文', '꽃의 도시 · 도시 상징 · 역사 인문'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CultureBanner(
            imageUrl: _imgPeony2,
            title: tr(lang, '牡丹文化', '모란 문화'),
            desc: tr(lang,
                '菏泽因牡丹闻名，牡丹既是城市景观，也被做成文创、食品和节庆活动的核心元素。',
                '허쩌는 모란으로 유명합니다. 모란은 도시 경관뿐 아니라 문创 상품, 음식, 축제의 핵심 요소로 활용됩니다.'),
          ),
          const SizedBox(height: 14),
          CultureBanner(
            imageUrl: _imgOldCaozhou,
            title: tr(lang, '曹州老城', '조주 옛거리'),
            desc: tr(lang,
                '老城曹州把传统街区、夜景灯光、地方小吃和非遗展示结合在一起，适合做城市文化展示页面。',
                '조주 옛거리는 전통 거리, 야경 조명, 지역 음식, 무형문화 전시가 어우러져 도시 문화 소개에 잘 어울립니다.'),
          ),
          const SizedBox(height: 14),
          CultureBanner(
            imageUrl: _imgMuseum,
            title: tr(lang, '博物馆记忆', '박물관의 기억'),
            desc: tr(lang,
                '博物馆适合补充历史脉络，让用户知道菏泽不仅有花，也有古曹州的城市底蕴。',
                '박물관은 허쩌의 역사적 흐름을 보완해 주며, 허쩌가 꽃뿐 아니라 옛 조주의 깊은 문화도 가진 도시임을 보여줍니다.'),
          ),
        ],
      ),
    );
  }
}

class GuidePage extends StatelessWidget {
  const GuidePage({super.key, required this.lang, required this.onToggleLang});
  final AppLang lang;
  final VoidCallback onToggleLang;

  @override
  Widget build(BuildContext context) {
    final route = [
      RouteItem('09:00', tr(lang, '曹州牡丹园', '조주모란원'), tr(lang, '上午赏花拍照，先完成最重要的花海打卡。', '오전에 꽃밭을 구경하고 사진 촬영을 먼저 합니다.'), Icons.local_florist),
      RouteItem('11:30', tr(lang, '单县羊肉汤', '산셴 양고기탕'), tr(lang, '午餐选择羊肉汤和烧饼，体验鲁西南热汤味道。', '점심은 양고기탕과 빵으로 루시난의 따뜻한 맛을 경험합니다.'), Icons.restaurant),
      RouteItem('13:30', tr(lang, '菏泽市博物馆', '허쩌시박물관'), tr(lang, '下午进入室内场馆，了解历史和牡丹文化。', '오후에는 실내 박물관에서 역사와 모란 문화를 알아봅니다.'), Icons.museum),
      RouteItem('17:30', tr(lang, '老城曹州', '조주 옛거리'), tr(lang, '傍晚开始逛老城，看夜景、吃小吃、买伴手礼。', '저녁에는 옛거리를 걸으며 야경, 간식, 기념품을 즐깁니다.'), Icons.account_balance),
    ];

    return PageShell(
      lang: lang,
      onToggleLang: onToggleLang,
      title: tr(lang, '一日游攻略', '하루 여행 코스'),
      subtitle: tr(lang, '赏花 · 美食 · 博物馆 · 夜游', '꽃구경 · 음식 · 박물관 · 야경'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(icon: Icons.route, title: tr(lang, '经典路线', '추천 코스')),
          const SizedBox(height: 12),
          ...route.asMap().entries.map((entry) => RouteStep(item: entry.value, isLast: entry.key == route.length - 1)),
          const SizedBox(height: 18),
          InfoCard(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tr(lang, '实用提示', '여행 팁'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                const SizedBox(height: 10),
                TipRow('🌸', tr(lang, '牡丹花期游客较多，酒店和门票建议提前安排。', '모란 꽃철에는 사람이 많아 숙소와 입장권을 미리 준비하는 것이 좋습니다.')),
                TipRow('📷', tr(lang, '花海拍照建议穿浅色衣服，上午或傍晚光线更柔和。', '꽃밭 사진은 밝은 색 옷이 잘 어울리고 오전 또는 해질 무렵 빛이 부드럽습니다.')),
                TipRow('🍲', tr(lang, '美食以热汤和面食为主，冬天体验感更强。', '음식은 따뜻한 국물과 밀가루 음식이 많아 겨울에도 좋습니다.')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageShell extends StatelessWidget {
  const PageShell({
    super.key,
    required this.lang,
    required this.onToggleLang,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final AppLang lang;
  final VoidCallback onToggleLang;
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: kBg,
            surfaceTintColor: kBg,
            expandedHeight: 110,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: OutlinedButton.icon(
                  onPressed: onToggleLang,
                  icon: const Icon(Icons.translate, size: 16),
                  label: Text(lang == AppLang.zh ? '中文 / 한' : '한국어 / 中'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: kPrimary,
                    side: BorderSide(color: kPrimary.withAlpha(90)),
                    backgroundColor: Colors.white,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.fromLTRB(18, 0, 130, 14),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: kInk)),
                  const SizedBox(height: 2),
                  Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 32),
            sliver: SliverToBoxAdapter(child: child),
          ),
        ],
      ),
    );
  }
}

class NetImage extends StatefulWidget {
  const NetImage({super.key, required this.url, required this.height, this.label = '菏泽图片', this.icon = Icons.image_outlined});
  final String url;
  final double height;
  final String label;
  final IconData icon;

  @override
  State<NetImage> createState() => _NetImageState();
}

class _NetImageState extends State<NetImage> {
  int _index = 0;

  List<String> get _urls => <String>[widget.url, ..._fallbackUrls(widget.url)].toSet().toList();

  void _next() {
    if (_index < _urls.length - 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() => _index++);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final url = _urls[_index];
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 260),
      child: Image.network(
        url,
        key: ValueKey(url),
        height: widget.height,
        width: double.infinity,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.medium,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          final value = progress.expectedTotalBytes == null ? null : progress.cumulativeBytesLoaded / progress.expectedTotalBytes!;
          return _ImageLoading(height: widget.height, value: value, label: widget.label);
        },
        errorBuilder: (context, error, stackTrace) {
          final hasMore = _index < _urls.length - 1;
          _next();
          if (hasMore) {
            return _ImageLoading(height: widget.height, value: null, label: widget.label);
          }
          return _ImageFallback(height: widget.height, label: widget.label, icon: widget.icon);
        },
      ),
    );
  }
}

List<String> _fallbackUrls(String url) {
  if (url == _imgPeony) return [_imgPeony2, 'https://images.unsplash.com/photo-1490750967868-88df5691cc34?w=1200&q=80'];
  if (url == _imgPeony2) return [_imgPeony, 'https://images.unsplash.com/photo-1525310072745-f49212b5ac6d?w=1200&q=80'];
  if (url == _imgOldCaozhou) return ['https://images.unsplash.com/photo-1508804185872-d7badad00f7d?w=1200&q=80', 'https://images.unsplash.com/photo-1523731407965-2430cd12f5e4?w=1200&q=80'];
  if (url == _imgTianxiang) return ['https://images.unsplash.com/photo-1501854140801-50d01698950b?w=1200&q=80', _imgPeony];
  if (url == _imgMuseum) return ['https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=1200&q=80', _imgPeony];
  if (url == _imgSheepSoup) return ['https://images.unsplash.com/photo-1547592180-85f173990554?w=1200&q=80', 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=1200&q=80'];
  if (url == _imgZhuangmo) return ['https://images.unsplash.com/photo-1509440159596-0249088772ff?w=1200&q=80', 'https://images.unsplash.com/photo-1601050690597-df0568f70950?w=1200&q=80'];
  if (url == _imgBeef) return ['https://images.unsplash.com/photo-1544025162-d76694265947?w=1200&q=80', 'https://images.unsplash.com/photo-1529692236671-f1f6cf9683ba?w=1200&q=80'];
  return const [];
}

class _ImageLoading extends StatelessWidget {
  const _ImageLoading({required this.height, required this.value, required this.label});
  final double height;
  final double? value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xffffeaf3), Color(0xfff7d6e5), Color(0xffe8f0fe)])),
      child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(width: 120, child: LinearProgressIndicator(value: value, color: kPrimary, backgroundColor: Colors.white54)),
        const SizedBox(height: 10),
        Text('正在加载 $label', style: const TextStyle(color: kPrimary, fontWeight: FontWeight.w800)),
      ])),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback({required this.height, required this.label, required this.icon});
  final double height;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xffffeaf3), Color(0xffffffff), Color(0xffe8f0fe)])),
      child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: kPrimary, size: 44),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: kInk, fontSize: 17, fontWeight: FontWeight.w900)),
        const SizedBox(height: 4),
        const Text('图片暂时无法连接，已保留正式展示位', style: TextStyle(color: Colors.black54, fontSize: 12.5)),
      ])),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(color: kPrimaryLight, borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: kPrimary, size: 19),
        ),
        const SizedBox(width: 10),
        Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: kInk)),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.color, required this.child});
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.black.withAlpha(16)),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(12), blurRadius: 18, offset: const Offset(0, 8))],
      ),
      child: child,
    );
  }
}

class FeatureItem {
  const FeatureItem(this.icon, this.title, this.detail, this.bgColor);
  final IconData icon;
  final String title;
  final String detail;
  final Color bgColor;
}

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key, required this.items});
  final List<FeatureItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.25, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: item.bgColor, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.black.withAlpha(13))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(item.icon, color: kPrimary, size: 28),
              const Spacer(),
              Text(item.title, style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w900, color: kInk)),
              const SizedBox(height: 4),
              Text(item.detail, style: const TextStyle(fontSize: 12.5, height: 1.35, color: Colors.black54)),
            ],
          ),
        );
      },
    );
  }
}

class SeasonBanner extends StatelessWidget {
  const SeasonBanner({super.key, required this.lang});
  final AppLang lang;

  @override
  Widget build(BuildContext context) {
    final seasons = [
      ('🌸', tr(lang, '春季 3–5月', '봄 3–5월'), tr(lang, '牡丹花会，最适合首次来菏泽', '모란 축제 시기로 첫 방문에 가장 좋음'), true, const Color(0xffffeaf3)),
      ('☀️', tr(lang, '夏季 6–8月', '여름 6–8월'), tr(lang, '公园湖景和夜游更舒服', '공원 호수와 야간 산책 추천'), false, const Color(0xffe8f6ef)),
      ('🍂', tr(lang, '秋季 9–11月', '가을 9–11월'), tr(lang, '老城漫步，气候舒适', '옛거리 산책과 쾌적한 날씨'), false, const Color(0xfffff3e0)),
    ];
    return Column(
      children: seasons.map((s) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: s.$5,
          borderRadius: BorderRadius.circular(18),
          border: s.$4 ? Border.all(color: kPrimary.withAlpha(90), width: 1.4) : Border.all(color: Colors.black.withAlpha(10)),
        ),
        child: Row(
          children: [
            Text(s.$1, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 14),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(s.$2, style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w900)),
                  if (s.$4) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(color: kPrimary, borderRadius: BorderRadius.circular(999)),
                      child: Text(tr(lang, '推荐', '추천'), style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                    ),
                  ],
                ]),
                const SizedBox(height: 3),
                Text(s.$3, style: const TextStyle(fontSize: 13.2, color: Colors.black54)),
              ],
            )),
          ],
        ),
      )).toList(),
    );
  }
}

class PlaceData {
  const PlaceData({required this.imageUrl, required this.title, required this.tag, required this.rating, required this.distance, required this.description, required this.tips, required this.openTime, required this.ticket, required this.color, required this.tagColor});
  final String imageUrl, title, tag, rating, distance, description, tips, openTime, ticket;
  final Color color, tagColor;
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({super.key, required this.data});
  final PlaceData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(color: data.color, borderRadius: BorderRadius.circular(22), border: Border.all(color: Colors.black.withAlpha(16))),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                NetImage(url: data.imageUrl, height: 190, label: data.title, icon: Icons.landscape),
                Positioned(top: 12, left: 12, child: ChipBadge(label: data.tag, color: data.tagColor)),
                Positioned(top: 12, right: 12, child: DarkBadge(icon: Icons.star_rounded, label: data.rating)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Expanded(child: Text(data.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: kInk))),
                    const Icon(Icons.place, size: 15, color: Colors.black45),
                    const SizedBox(width: 3),
                    Text(data.distance, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                  ]),
                  const SizedBox(height: 9),
                  Text(data.description, style: const TextStyle(fontSize: 14.5, height: 1.62, color: Colors.black87)),
                  const SizedBox(height: 12),
                  Wrap(spacing: 8, runSpacing: 8, children: [InfoChip(Icons.access_time, data.openTime), InfoChip(Icons.confirmation_number_outlined, data.ticket)]),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white.withAlpha(210), borderRadius: BorderRadius.circular(14)),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Icon(Icons.lightbulb_outline, color: Color(0xfff59e0b), size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(data.tips, style: const TextStyle(fontSize: 13.2, height: 1.45, fontWeight: FontWeight.w600))),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChipBadge extends StatelessWidget {
  const ChipBadge({super.key, required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(999)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800)),
    );
  }
}

class DarkBadge extends StatelessWidget {
  const DarkBadge({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: Colors.black.withAlpha(140), borderRadius: BorderRadius.circular(999)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 14, color: const Color(0xffffcc00)), const SizedBox(width: 4), Text(label, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800))]),
    );
  }
}

class InfoChip extends StatelessWidget {
  const InfoChip(this.icon, this.label, {super.key});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(color: Colors.white.withAlpha(220), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.black.withAlpha(12))),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 14, color: Colors.black54), const SizedBox(width: 5), Text(label, style: const TextStyle(fontSize: 11.5, color: Colors.black54, fontWeight: FontWeight.w600))]),
    );
  }
}

class FoodData {
  const FoodData({required this.imageUrl, required this.title, required this.subtitle, required this.description, required this.tags, required this.color});
  final String imageUrl, title, subtitle, description;
  final List<String> tags;
  final Color color;
}

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.data});
  final FoodData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(color: data.color, borderRadius: BorderRadius.circular(22), border: Border.all(color: Colors.black.withAlpha(16))),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetImage(url: data.imageUrl, height: 175, label: data.title, icon: Icons.restaurant),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: kInk)),
                  const SizedBox(height: 3),
                  Text(data.subtitle, style: const TextStyle(fontSize: 12.5, color: Colors.black54, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Text(data.description, style: const TextStyle(fontSize: 14.5, height: 1.62, color: Colors.black87)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: data.tags.map((t) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(color: Colors.white.withAlpha(220), borderRadius: BorderRadius.circular(999), border: Border.all(color: Colors.black.withAlpha(12))),
                      child: Text(t, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CultureBanner extends StatelessWidget {
  const CultureBanner({super.key, required this.imageUrl, required this.title, required this.desc});
  final String imageUrl, title, desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22), border: Border.all(color: Colors.black.withAlpha(14))),
      clipBehavior: Clip.antiAlias,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        NetImage(url: imageUrl, height: 160, label: title, icon: Icons.local_florist),
        Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: kInk)),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(fontSize: 14.5, height: 1.62, color: Colors.black87)),
        ])),
      ]),
    );
  }
}

class RouteItem {
  const RouteItem(this.time, this.title, this.detail, this.icon);
  final String time, title, detail;
  final IconData icon;
}

class RouteStep extends StatelessWidget {
  const RouteStep({super.key, required this.item, required this.isLast});
  final RouteItem item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(children: [
        Container(width: 44, height: 44, decoration: const BoxDecoration(color: kPrimary, shape: BoxShape.circle), child: Icon(item.icon, color: Colors.white, size: 22)),
        if (!isLast) Container(width: 2, height: 78, color: kPrimary.withAlpha(55)),
      ]),
      const SizedBox(width: 14),
      Expanded(child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.black.withAlpha(14))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(item.time, style: const TextStyle(color: kPrimary, fontWeight: FontWeight.w900, fontSize: 13)),
          const SizedBox(height: 5),
          Text(item.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: kInk)),
          const SizedBox(height: 4),
          Text(item.detail, style: const TextStyle(fontSize: 13.5, height: 1.48, color: Colors.black54)),
        ]),
      )),
    ]);
  }
}

class TipRow extends StatelessWidget {
  const TipRow(this.emoji, this.text, {super.key});
  final String emoji, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(emoji, style: const TextStyle(fontSize: 17)),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14, height: 1.5))),
      ]),
    );
  }
}
