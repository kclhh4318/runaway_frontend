import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  String _selectedPeriod = '전체';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPeriodTabs(),
        _buildTotalStats(),
        _buildStatsChart(),
        _buildRecentRuns(),
        _buildCourseStatistics(),
      ],
    );
  }

  Widget _buildPeriodTabs() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ['전체', '주간', '월간', '연간'].map((period) {
          return ElevatedButton(
            child: Text(period),
            onPressed: () => setState(() => _selectedPeriod = period),
            style: ElevatedButton.styleFrom(
              backgroundColor: _selectedPeriod == period ? Colors.blue : Colors.grey,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTotalStats() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem('총 킬로미터', '99,999 km'),
          _buildStatItem('총 시간', '999:99'),
          _buildStatItem('평균 페이스', '05:30'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildStatsChart() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(1, 1),
                FlSpot(2, 4),
                FlSpot(3, 2),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              dotData: FlDotData(show: false),
            ),
          ],
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }

  Widget _buildRecentRuns() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('최근 러닝', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                child: Text('더 보기'),
                onPressed: () {
                  // TODO: Navigate to all running records screen
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          // TODO: Replace with actual recent runs data
          _buildRecentRunItem('24.07.19', '8.11 km', '1:35:18', '05:30'),
          _buildRecentRunItem('24.07.18', '6.5 km', '1:15:30', '05:45'),
          _buildRecentRunItem('24.07.17', '10.2 km', '1:55:40', '05:20'),
        ],
      ),
    );
  }

  Widget _buildRecentRunItem(String date, String distance, String time, String pace) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(distance),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time),
              Text('평균 페이스 $pace'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCourseStatistics() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('코스 통계', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCourseStatItem('코스 그리기로 달린 횟수', '15'),
              _buildCourseStatItem('코스 추천으로 달린 횟수', '8'),
            ],
          ),
          SizedBox(height: 10),
          Text('내가 그린 코스', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          // TODO: Replace with actual user-drawn courses
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) => _buildCourseItem()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildCourseItem() {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Text('코스')),
    );
  }
}