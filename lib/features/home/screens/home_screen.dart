import 'package:flutter/material.dart';
import 'package:runaway/features/courses/screens/course_drawing_screen.dart';
import 'package:runaway/features/running/screens/running_session_screen.dart';
import 'package:runaway/features/stats/screens/stats_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showButtons = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 100 && _showButtons) {
      setState(() => _showButtons = false);
    } else if (_scrollController.offset <= 100 && !_showButtons) {
      setState(() => _showButtons = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(child: _buildTotalStats()),
            SliverToBoxAdapter(child: _buildRecentRunningStats()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: AnimatedOpacity(
                opacity: _showButtons ? 1.0 : 0.0,
                duration: Duration(milliseconds: 200),
                child: _buildRunningButtons(context),
              ),
            ),
            SliverToBoxAdapter(child: StatsScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalStats() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '총 킬로미터',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            '99,999 km',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            '총 시간',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            '999:99',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentRunningStats() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('최근 러닝', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem('평균 페이스', '05:30'),
              _buildStatItem('평균 거리', '05 km'),
              _buildStatItem('총 횟수', '999'),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            color: Colors.grey[200],
            child: Center(child: Text('러닝 통계 그래프 영역')),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 14)),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildRunningButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(
          icon: Icon(Icons.edit),
          label: Text('코스 그리기'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CourseDrawingScreen()),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.directions_run),
          label: Text('러닝 시작'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RunningSessionScreen()),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}