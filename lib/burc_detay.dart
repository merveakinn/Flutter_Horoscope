import 'package:flutter/material.dart';
import 'model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;

  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {

  Color appbarRengi = Colors.transparent;
 late  PaletteGenerator _generator; //initialize et ya da başına late koy

  @override //1 kere çalışır
  void initState() {//değişkenlerin ilk atamalarını yaparken kullanılır örn.
    super.initState();
    appbarRenginiBul();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250, //ilk açıldığında tutacağı yer
            pinned: true,
            backgroundColor: appbarRengi,

            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                 'images/' + widget.secilenBurc.burcBuyukResim,
                    fit: BoxFit.cover,
                  ),

              ),
            ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.secilenBurc.burcDetayi,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appbarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/${widget.secilenBurc.burcBuyukResim}'));//secilenburc a erişmek için widget.
//async ve await yazmamızın sebebi app ilk açıldığında yoklar duruma göre değişiyorlar
  appbarRengi = _generator.dominantColor!.color;
//appbar rengim değişti ama flutterın daha haberi yok setState o yüzden
  setState(() {

  });
  }
}
