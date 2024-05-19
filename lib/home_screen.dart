import 'package:flutter/material.dart';
import 'package:newsapp/article_screen.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/widgets/bottom_nav_bar.dart';
import 'package:newsapp/widgets/custom_tag.dart';
import 'package:newsapp/widgets/image_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    Article article = Article.articles[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(index: 0),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          NewsOfTheDay(article: article),
          BreakingNews(articles: Article.articles),
        ],
      ),
    );
  }
}

class BreakingNews extends StatelessWidget {
  const BreakingNews({
    super.key,
    required this.articles,
  });
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'More',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
                itemCount: articles.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ArticleScreen.routeName,
                          arguments: articles[index],
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                            width: MediaQuery.of(context).size.width * 0.6,
                            imageUrl: articles[index].imageUrl,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            maxLines: 2,
                            articles[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold, height: 1.5),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              '${DateTime.now().difference(articles[index].createdAt).inHours} hour ago',
                              style: Theme.of(context).textTheme.bodySmall!),
                          SizedBox(
                            height: 5,
                          ),
                          Text('by ${articles[index].author}',
                              style: Theme.of(context).textTheme.bodySmall!),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////

class NewsOfTheDay extends StatelessWidget {
  const NewsOfTheDay({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: EdgeInsets.all(20.0),
      imageUrl: article.imageUrl,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                "News of the Day",
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
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                height: 1.25,
                fontSize: 23),
          ),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Row(
                children: [
                  Text(
                    'Learn More',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
