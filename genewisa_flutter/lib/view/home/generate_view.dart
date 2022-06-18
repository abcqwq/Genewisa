import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../view/home/generate_result_view.dart';
import '../../theme/genewisa_text_theme.dart';
import '../../theme/genewisa_theme.dart';
import '../../view/widget/budget_text_field.dart';

class GenerateView extends StatefulWidget {
  GenerateView({Key? key}) : super(key: key);

  @override
  State<GenerateView> createState() => _GenerateViewState();
}

class _GenerateViewState extends State<GenerateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Generate Tempat Wisata',
              style: GenewisaTextTheme.textTheme.headline2,
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Budget',
                      style: GenewisaTextTheme.textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 60,
                      child: BudgetTextField(
                        label: 'Dari',
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 22),
                Column(
                  children: const <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '-',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(width: 22),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width / 2) - 60,
                      child: BudgetTextField(
                        label: 'Sampai',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Lokasi',
                  style: GenewisaTextTheme.textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: GenewisaTextTheme.textTheme.bodyText1,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          '/location_icon.svg',
                        ),
                      ),
                      hintText: 'Masukkan Lokasi',
                      hintStyle: GenewisaTextTheme.textTheme.bodyText1,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              decoration: GenewisaTheme.buttonContainer(),
              child: ElevatedButton(
                style: GenewisaTheme.geneButton(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GenerateResultView()));
                },
                child: Text(
                  'Generate',
                  style: GenewisaTextTheme.textTheme.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
