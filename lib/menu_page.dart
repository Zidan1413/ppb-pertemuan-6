import 'package:flutter/material.dart';
import 'menu.dart';
import 'pesan_page.dart';

//ignore: must_be_immutable
class MenuPage extends StatelessWidget {
  MenuPage({super.key});
  List<Menu> listMenu = [];
  void dummyMenu() {
    listMenu.add(Menu(
        nama: 'Kebab Daging',
        deskripsi: "Menggunakan Daging Sapi",
        harga: 15000,
        gambar: 'kebab.jpg'));
    listMenu.add(Menu(
        nama: "Burger Ayam",
        deskripsi: "Burger Yang Menggunakan Daging Ayam",
        harga: 15000,
        gambar: 'burger_ayam.jpg'));
    listMenu.add(Menu(
        nama: "Fried Chicken",
        deskripsi: "Ayam Krispi Semarang",
        harga: 18000,
        gambar: 'fried_chicken.jpg'));
    listMenu.add(Menu(
        nama: "Kulit Krispi",
        deskripsi: "Dari Kulit Ayam",
        harga: 10000,
        gambar: 'kulit_krispi.jpg'));
    listMenu.add(Menu(
        nama: "Es Teh Nyuaks",
        deskripsi: "Es Teh Nyuaks tidak menyegarkan #nyuakss",
        harga: 3000,
        gambar: 'es_teh_nyuaks.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    dummyMenu();
    return Scaffold(
      appBar: AppBar(title: Text('Aplikasi Menu Makanan')),
      body: Column(children: [
        const SizedBox(
          width: double.infinity,
          child: Text("Pilih Menu"),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: listMenu.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading:
                      Image.asset('assets/images/${listMenu[index].gambar}'),
                  title: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(listMenu[index].nama)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listMenu[index].deskripsi),
                      Text("Rp. ${listMenu[index].harga}")
                    ],
                  ),
                  trailing: ElevatedButton(
                    child: const Text("Pesan"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PesanPage(pesananMenu: listMenu[index])));
                    },
                  ),
                );
              }),
        )
      ]),
    );
  }
}
