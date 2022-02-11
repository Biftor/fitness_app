import 'package:fitness_app/constants.dart';
import 'package:fitness_app/model/days.dart';
import 'package:fitness_app/size_config.dart';
import 'package:fitness_app/widget/activity_pie_chart_widget.dart';
import 'package:fitness_app/widget/heading_widget.dart';
import 'package:fitness_app/widget/hourly_bar_chart_widget.dart';
import 'package:fitness_app/widget/weekly_bar_chart_widget.dart';
import 'package:flutter/material.dart';

class MetricScreen extends StatelessWidget {

  String text = '''بر اساس تحقیقات دانشمندان دانشگاه دوک آمریکا، سرعت راه رفتن افراد در سن 45 سالگی شاخص مناسبی برای ارزیابی پیری مغز و بدن آن ها محسوب می شود. به عبارت دیگر این دانشمندان دریافته اند که میانگین سرعت راه رفتن یک شخص در یک بازه زمانی مشخص با میزان سن فیژیولوژیک بدن ارتباط مستقیم دارد و از این طریق می توان میزان پیری زودرس و همچنین احتمال ابتلا به بیماری آلزایمر را در شخص اندازه گیری کرد.
اپلیکیشن به زی با بهره مند از زبان قدرتمند دارت و فریمورک فلاتر، سعی دارد با اندازه گیری میانگین سرعت راه رفتن فرد در یک بازه زمانی مشخص، سن فیژیولوژیک بدن را محاسبه کند تا بتواند پیش بینی مناسبی از میزان ابتلا به انواع بیماری های ناشی از پیری زودرس داشته باشد.
لازم به ذکر است امکاناتی از قبیل میزان مسافت طی شده، اندازه گیری کالری سوزانده شده، تعیین نبض و ضربان قلب و همچنین میزان ابتلا به آلزایمر از قابلیت های دیگر اپلیکیشن به زی است که در آینده بر روی اپلیکیشن پیاده سازی خواهد شد.
سلامتی شما آروزی قلبی ماست...''';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(50),
                        bottomStart: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(0, 0),
                            blurRadius: 20)
                      ],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/darbare.jpg'),
                      ),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                            child: Text(
                             text,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            )));
  }
}
