import 'package:flutter/material.dart';
import 'package:horoscope/burc_detay.dart';

import 'model/burc.dart';

class BurcItem extends StatelessWidget {

  final Burc listelenenBurc;

  const BurcItem({required this.listelenenBurc, super.key});


  @override
  Widget build(BuildContext context) {

    var myTextStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shadowColor: Colors.indigoAccent,
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context)=>BurcDetay(secilenBurc: listelenenBurc),
              ),
              );
            },
            leading: Image.asset("images/"+ listelenenBurc.burcKucukResim
            ),
            title: Text(listelenenBurc.burcAdi,style: myTextStyle.headlineSmall,),
            subtitle: Text(listelenenBurc.burcTarihi, style: myTextStyle.bodySmall),
            trailing: Icon(Icons.arrow_forward_ios,color: Colors.pink)//sağdaki resim için
          ),
        ),
      ),
    );
  }
}
