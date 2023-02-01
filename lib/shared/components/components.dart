import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webView/webViewScreen.dart';
Widget defaultButton({
   double width = double.infinity,
  double height = 40,
  required Function onpress,
  required String text,
   Color background = Colors.blue,
})=>Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color:  background,
  ),
  child:MaterialButton(
    onPressed: onpress(),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,

      ),
    ),
  ),
);

Widget defaultFormField({
  Function? onchange,
  Function? onSubmit,
  Function? validator,
  required TextInputType? type,
  bool isPassword = false,
  required TextEditingController  controller,
  required String text,
  required IconData prefix,
   IconData? suffix,
  Function? suffixPress,
  Function? onTap,

})=>
TextFormField(
  controller: controller,
  onChanged: (s){onchange!();},
  onFieldSubmitted: (s){onSubmit!();},
  onTap: (){onTap!();},
  keyboardType: type,
  obscureText: isPassword,
  validator: (value){
    validator!();
    return null;
  },
  decoration: InputDecoration(
  prefixIcon: Icon(prefix),
  labelText: text,
      border: const OutlineInputBorder(),
    suffix: suffix != null? IconButton(
        icon: Icon(suffix),
        onPressed: (){
          suffixPress!();
        },

    ):null,

),
);

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey,
);

Widget buildArticlesItem(articles, context) =>  InkWell(
  onTap: (){
    navigateTo(context,WebViewScreen(url: articles['url']) );
  },
  child:   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage('${articles['urlToImage']}'),
                fit: BoxFit.cover,
              )
          ),
        ),
        SizedBox(width: 10.0,),
        Expanded(
          child: Container(
            height: 120,
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Text('${articles['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.fade,
                    )),
                SizedBox(height: 10,),

                Text('${articles['publishedAt']}')
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget articleBuilder(list,context) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    separatorBuilder: (context, index) => SizedBox(height: 5.0,) ,
    itemBuilder: (context, index) => buildArticlesItem(list[index], context),
    itemCount: 15,
  ),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);

void navigateTo(context, Widget) => Navigator.push(
    context ,
    MaterialPageRoute(builder: (context) => Widget,) );

void navigatorAndEnd(context, Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context)=>Widget),
        (route) => false);
