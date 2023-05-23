import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: .7),
      itemBuilder: ((context, index) => GestureDetector(
            onTap: () {},
            child: Container(
              padding:
                  const EdgeInsetsDirectional.only(start: 9, top: 9, end: 9),
              margin: const EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      alignment: AlignmentDirectional.topEnd,
                      height: 117,
                      width: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/item.png'),
                            fit: BoxFit.fill),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 6),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadiusDirectional.only(
                                topStart: Radius.circular(0),
                                topEnd: Radius.circular(11),
                                bottomStart: Radius.circular(7))),
                        child: const Text(
                          '-45%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 1),
                    child: Text(
                      'طماطم',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.only(start: 1),
                    child: Text(
                      'السعر / 1كجم',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '45ر.س',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '56ر.س',
                        style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.lineThrough,
                            color: Theme.of(context).primaryColor),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Theme.of(context).primaryColor),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: const Color(0xff61B80C)),
                    child: const FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        'أضف للسلة',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,),textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
