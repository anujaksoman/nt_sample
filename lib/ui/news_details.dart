import 'package:flutter/material.dart';
import 'package:nt_sample/data/model/nt_new_model.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key, required this.data}) : super(key: key);
  final Result data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Column(
          children: [
            Text(
              "News Details",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Row(
              children: [
                Text(
                  "Title : ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  width: 260,
                  child: Text(
                    "${data.title}",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                    maxLines: 5,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Section : ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Text(
                  "${data.section}",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Text(
                  "Abstract : ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  width: 240,
                  child: Text(
                    "${data.resultAbstract}",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16,),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Published Date : ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Text(
                  "${data.publishedDate}",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Update Date : ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Text(
                  "${data.updated}",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
