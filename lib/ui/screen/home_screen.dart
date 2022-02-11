import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/bloc/product_bloc.dart';
import 'package:flutter_ecom/ui/widget/appbar_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomeAppBar(),
        body: _bodyHome(),
      ),
    );
  }

  Widget _bodyHome() {
    print('hello horld 2');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  width: 300,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0.8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    // controller: 'textEditingController',
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: SvgPicture.asset('assets/icons/search.svg'),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(0.8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.open_with_outlined),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const TabBarControlleHome(),
        ],
      ),
    );
  }
}

class TabBarControlleHome extends StatefulWidget {
  const TabBarControlleHome({Key? key}) : super(key: key);

  @override
  _TabBarControlleHomeState createState() => _TabBarControlleHomeState();
}

class _TabBarControlleHomeState extends State<TabBarControlleHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    context.read<ProductBloc>().add(GetProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('hello horld 3');
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            tabs: const [
              Text('All', style: TextStyle(fontSize: 17)),
              Text('Chair', style: TextStyle(fontSize: 17)),
              Text('Table', style: TextStyle(fontSize: 17)),
              Text('lamp', style: TextStyle(fontSize: 17)),
              Text('Floor', style: TextStyle(fontSize: 17)),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProductError) {
                  return Column(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.refresh))
                    ],
                  );
                } else if (state is ProductLoaded) {
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: state.product.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            fit: StackFit.passthrough,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 30, 30, 20),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                state.product[index].image ??
                                                    '',
                                            height: 150,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 25),
                                          Text(
                                            state.product[index].title ?? '',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(height: 7),
                                          RichText(
                                            text: TextSpan(
                                              text: 'by ',
                                              style:
                                                  DefaultTextStyle.of(context)
                                                      .style,
                                              children: const <TextSpan>[
                                                TextSpan(
                                                    text: 'bold',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            state.product[index].deskripsi ??
                                                '',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                            maxLines: 5,
                                          ),
                                          const SizedBox(height: 25),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${state.product[index].price}',
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors.black,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          )),
                                                  onPressed: () {},
                                                  child: const Text('Buy'),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Positioned(
                                left: 0,
                                top: 30,
                                right: 80,
                                child: Icon(Icons.favorite),
                              )
                            ],
                          );
                        },
                      ),
                      const Center(
                          child: Text('Chair', style: TextStyle(fontSize: 20))),
                      const Center(
                          child: Text('Table', style: TextStyle(fontSize: 20))),
                      const Center(
                          child: Text('lamp', style: TextStyle(fontSize: 20))),
                      const Center(
                          child: Text('Floor', style: TextStyle(fontSize: 20))),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}
