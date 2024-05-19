import 'package:flutter/material.dart';
import 'package:newsapp/widgets/custom_tag.dart';
import 'package:newsapp/widgets/image_container.dart';

import 'model/article_model.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  static const routeName = '/article';
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return ImageContainer(
      width: double.infinity,
      imageUrl: article.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            NewsHeadline(
              article: article,
            ),
            NewsBody(article: article)
          ],
        ),
      ),
    );
  }
}

class NewsBody extends StatelessWidget {
  const NewsBody({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomTag(
                backgroundColor: Colors.black,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                      article.authorImageUrl,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    article.author,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                      '${DateTime.now().difference(article.createdAt).inHours}h',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${article.views}',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            article.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            article.body,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  height: 1.5,
                ),
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.25),
            itemBuilder: (context, index) {
              return ImageContainer(
                width: MediaQuery.of(context).size.width * 0.42,
                imageUrl: article.imageUrl,
                margin: EdgeInsets.only(right: 6.0, bottom: 5.0),
              );
            },
          )
        ],
      ),
    );
  }
}

class NewsHeadline extends StatelessWidget {
  const NewsHeadline({
    super.key,
    required this.article,
  });
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                article.category,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            article.subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
