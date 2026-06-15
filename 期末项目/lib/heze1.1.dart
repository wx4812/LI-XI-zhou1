import 'package:flutter/material.dart';

void main() {
  runApp(const HezeTravelApp());
}

class HezeTravelApp extends StatelessWidget {
  const HezeTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '菏泽旅行推荐',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffb83268),
          brightness: Brightness.light,
        ),
        fontFamily: 'sans',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = const [
    OverviewPage(),
    MapPage(),
    PlacesPage(),
    FoodPage(),
    CelebrityPage(),
    GuidePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: '首页',
          ),
          NavigationDestination(
            icon: Icon(Icons.temple_buddhist_outlined),
            selectedIcon: Icon(Icons.temple_buddhist),
            label: '地图',
          ),
          NavigationDestination(
            icon: Icon(Icons.ramen_dining_outlined),
            selectedIcon: Icon(Icons.ramen_dining),
            label: '景点',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: '美食',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined),
            selectedIcon: Icon(Icons.auto_awesome),
            label: '名人',
          ),
        ],
      ),
    );
  }
}

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: '旅游攻略',
      subtitle: '第一次来菏泽这样玩',
      child: Column(children: const [
        InfoCard(color: Color(0xffeef7ff), child: Text('一日游：牡丹园→羊肉汤→天香公园→曹州古城')),
        SizedBox(height: 12),
        InfoCard(color: Color(0xfffff4f8), child: Text('最佳时间：4月牡丹花会期间')),
      ]),
    );
  }
}

class CelebrityPage extends StatelessWidget {
  const CelebrityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: '历史名人',
      subtitle: '菏泽文化',
      child: Column(children: const [
        InfoCard(color: Color(0xfffff4f8), child: Text('孙膑：战国军事家，《孙膑兵法》作者。')),
        SizedBox(height: 12),
        InfoCard(color: Color(0xfffff4f8), child: Text('黄巢：中国历史著名农民起义领袖。')),
      ]),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: '旅游地图',
      subtitle: '热门景点位置',
      child: Column(children: const [
        InfoCard(color: Color(0xffd7ecff), child: Text('曹州牡丹园（距市中心8km）')),
        SizedBox(height: 12),
        InfoCard(color: Color(0xffd7ecff), child: Text('曹州古城（距市中心2km）')),
      ]),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: '菏泽，中国牡丹之都',
      subtitle: '山东西南部的花城、古城与美食小旅行',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeroPanel(),
          const SizedBox(height: 16),
          SectionTitle(icon: Icons.location_on, title: '家乡地区介绍'),
          const SizedBox(height: 10),
          const InfoCard(
            color: Color(0xfffff4f8),
            child: Text(
              '菏泽位于山东省西南部，古称曹州。这里以牡丹闻名，也有黄河文化、鲁西南民俗和丰富的小吃。春天看牡丹，平时可以逛古城、看湖景、吃羊肉汤，是适合周末旅行的城市。',
              style: TextStyle(fontSize: 16, height: 1.65),
            ),
          ),
          const SizedBox(height: 16),
          SectionTitle(icon: Icons.star, title: '旅行亮点'),
          const SizedBox(height: 10),
          const FeatureGrid(
            items: [
              FeatureItem(Icons.local_florist, '牡丹文化', '4月牡丹花会最有代表性'),
              FeatureItem(Icons.account_balance, '历史人文', '曹州古城、孙膑文化值得了解'),
              FeatureItem(Icons.restaurant, '鲁西南味道', '羊肉汤、烧饼、单县美食'),
              FeatureItem(Icons.photo_camera, '拍照友好', '花海、湖景、古风建筑都好出片'),
            ],
          ),
        ],
      ),
    );
  }
}

class PlacesPage extends StatelessWidget {
  const PlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: '菏泽代表旅游景点',
      subtitle: '牡丹、古城、湖景和传统文化',
      child: Column(
        children: const [
          PlaceCard(
            icon: Icons.local_florist,
            title: '曹州牡丹园',
            tag: '必去',
            description: '菏泽最有名的牡丹观赏地。每年4月前后花开时，园内颜色层次丰富，适合拍照和了解牡丹文化。',
            tips: '建议上午入园，光线柔和，人也相对少。',
            color: Color(0xfff7d7e4),
          ),
          PlaceCard(
            icon: Icons.account_balance,
            title: '曹州古城',
            tag: '城市漫步',
            description: '古城街区适合散步、拍古风照片，也能看到菏泽传统城市记忆。',
            tips: '傍晚去更有氛围，可以顺便吃晚饭。',
            color: Color(0xffd7ecff),
          ),
          PlaceCard(
            icon: Icons.water,
            title: '天香公园',
            tag: '休闲',
            description: '市区内比较轻松的公园，适合短暂停留、散步和拍城市风景。',
            tips: '适合放在一日游路线的中间休息点。',
            color: Color(0xffddf5e4),
          ),
        ],
      ),
    );
  }
}

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: '菏泽代表美食',
      subtitle: '热汤、面食和鲁西南家常味',
      child: Column(
        children: const [
          FoodTile(
            emoji: '汤',
            title: '单县羊肉汤',
            description: '汤色浓白，味道鲜香，是菏泽最有代表性的美食之一。冬天喝很暖，早饭或午饭都合适。',
            color: Color(0xffffefd2),
          ),
          FoodTile(
            emoji: '饼',
            title: '曹县烧饼',
            description: '外皮焦香，适合搭配汤类或小菜。它体现了鲁西南地区朴素又扎实的面食文化。',
            color: Color(0xffffe0cc),
          ),
          FoodTile(
            emoji: '面',
            title: '郓城壮馍',
            description: '个头大、馅料足，口感香脆。适合想体验地方小吃的游客尝试。',
            color: Color(0xffe2f2ff),
          ),
          FoodTile(
            emoji: '糕',
            title: '牡丹糕点',
            description: '以牡丹元素做成的伴手礼，适合送朋友，也能体现菏泽“牡丹之都”的城市名片。',
            color: Color(0xffffe6f1),
          ),
        ],
      ),
    );
  }
}

class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: '推荐旅行路线',
      subtitle: '1日轻旅行，适合第一次来菏泽',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RouteStep(
            time: '09:00',
            title: '曹州牡丹园',
            detail: '上午赏牡丹、拍照，了解菏泽牡丹文化。',
            icon: Icons.local_florist,
          ),
          const RouteStep(
            time: '12:00',
            title: '单县羊肉汤午餐',
            detail: '选择当地羊肉汤店，体验菏泽代表味道。',
            icon: Icons.restaurant,
          ),
          const RouteStep(
            time: '14:00',
            title: '天香公园',
            detail: '饭后休息散步，看湖景与城市生活。',
            icon: Icons.park,
          ),
          const RouteStep(
            time: '17:00',
            title: '曹州古城',
            detail: '傍晚逛古城，拍照、吃小吃，结束一天路线。',
            icon: Icons.account_balance,
          ),
          const SizedBox(height: 18),
          SectionTitle(icon: Icons.check_circle, title: '路线特点'),
          const SizedBox(height: 10),
          const InfoCard(
            color: Color(0xffeef7ff),
            child: Text(
              '这条路线把“花、食、景、城”连在一起，交通压力小，适合游客第一次认识菏泽。春季可把牡丹园停留时间加长，非花期可增加博物馆或古城体验。',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}

class AiPage extends StatelessWidget {
  const AiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      title: 'AI 使用内容',
      subtitle: '按作业要求说明 AI 如何辅助项目',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AiUseCard(
            icon: Icons.text_fields,
            title: '文案整理',
            detail: '使用 AI 帮助整理菏泽简介、景点介绍、美食介绍和路线说明，再由本人检查并改成适合 App 的简短中文。',
          ),
          AiUseCard(
            icon: Icons.palette,
            title: '页面设计',
            detail: '使用 AI 参考“牡丹、城市旅行、清爽卡片式页面”的方向，设计粉色、蓝色、绿色搭配的界面风格。',
          ),
          AiUseCard(
            icon: Icons.route,
            title: '路线规划',
            detail: '使用 AI 生成一日游路线草稿，然后根据菏泽特色调整为“牡丹园-美食-公园-古城”。',
          ),
          SizedBox(height: 12),
          InfoCard(
            color: Color(0xfffffbeb),
            child: Text(
              '项目执行心得：通过这个 App，我把自己的家乡菏泽整理成了适合游客阅读的旅行推荐页面，也练习了 Flutter 的底部导航、卡片布局、图标和响应式页面设计。',
              style: TextStyle(fontSize: 16, height: 1.6),
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
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            sliver: SliverToBoxAdapter(child: child),
          ),
        ],
      ),
    );
  }
}

class HeroPanel extends StatelessWidget {
  const HeroPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xffba2f6d), Color(0xfff59ab4), Color(0xff77c8d3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -18,
            bottom: -16,
            child: Icon(
              Icons.local_florist,
              size: 170,
              color: Colors.white.withOpacity(0.28),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.travel_explore, color: Colors.white, size: 38),
                SizedBox(height: 18),
                Text(
                  '菏泽 Heze',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  '牡丹花开的时候，这座城市最浪漫。',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: child,
    );
  }
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.25,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return InfoCard(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(item.icon, size: 32, color: Theme.of(context).colorScheme.primary),
              const Spacer(),
              Text(item.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              Text(item.detail, style: const TextStyle(height: 1.35)),
            ],
          ),
        );
      },
    );
  }
}

class FeatureItem {
  const FeatureItem(this.icon, this.title, this.detail);
  final IconData icon;
  final String title;
  final String detail;
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.tag,
    required this.description,
    required this.tips,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String tag;
  final String description;
  final String tips;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InfoCard(
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(icon, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
                  ),
                ),
                Chip(label: Text(tag)),
              ],
            ),
            const SizedBox(height: 12),
            Text(description, style: const TextStyle(fontSize: 16, height: 1.55)),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.lightbulb_outline, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text(tips, style: const TextStyle(fontWeight: FontWeight.w600))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.emoji,
    required this.title,
    required this.description,
    required this.color,
  });

  final String emoji;
  final String title;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InfoCard(
        color: color,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 58,
              height: 58,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Text(emoji, style: const TextStyle(fontWeight: FontWeight.w900)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(description, style: const TextStyle(fontSize: 15.5, height: 1.55)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RouteStep extends StatelessWidget {
  const RouteStep({
    super.key,
    required this.time,
    required this.title,
    required this.detail,
    required this.icon,
  });

  final String time;
  final String title;
  final String detail;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(icon, color: Colors.white),
            ),
            Container(width: 2, height: 62, color: Theme.of(context).colorScheme.primary.withOpacity(0.25)),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: InfoCard(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(time, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 4),
                  Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(detail, style: const TextStyle(height: 1.45)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AiUseCard extends StatelessWidget {
  const AiUseCard({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InfoCard(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 34, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(detail, style: const TextStyle(fontSize: 15.5, height: 1.55)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
