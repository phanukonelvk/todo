import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_example/core/constants/category_contants.dart';
import 'package:todo_example/core/shared/catch_user_service/domain/provider/current_user_provider.dart';
import 'package:todo_example/product/presentation/provider/product_provider.dart';
import 'package:todo_example/product/presentation/provider/state/product_state.dart';
import 'package:todo_example/widgets/app_constant.dart';
import 'package:todo_example/widgets/app_textstyles.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  @override
  void initState() {
    Future(() {
      ref.read(productStateNotifier.notifier).fetchProducData();
      ref.read(productStateNotifier.notifier).fetchToken();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductState? state = ref.watch(productStateNotifier);
    final currentUser = ref.watch(currentUserProvider).asData?.value;
    return Scaffold(
      // appBar: AppBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await ref.read(userLocalRepositoryProvider).deleteUser();
      //   },
      // ),
      body: state!.isProduct == null
          ? const Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.square(
                      dimension: 15, child: CircularProgressIndicator()),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Loading....'),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.green.shade300,
                //     borderRadius: const BorderRadius.only(
                //         bottomLeft:
                //             Radius.circular(AppConstant.kBorderRadius12),
                //         bottomRight:
                //             Radius.circular(AppConstant.kBorderRadius12)),
                //   ),
                //   child: SafeArea(
                //     child: Container(
                //       margin: const EdgeInsets.symmetric(horizontal: 16),
                //       child: Column(
                //         mainAxisSize: MainAxisSize.min,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const SizedBox(
                //             height: 20,
                //           ),
                //           Row(
                //             children: [
                //               Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     "Wellcome ",
                //                     style: AppTextStyles.titleMedium!.copyWith(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.white),
                //                   ),
                //                   Text(
                //                     "AppZap Pos",
                //                     style: AppTextStyles.titleMedium!.copyWith(
                //                         fontWeight: FontWeight.bold,
                //                         color: Colors.white),
                //                   ),
                //                 ],
                //               ),
                //               const Spacer(),
                //               Container(
                //                 decoration: BoxDecoration(
                //                     color: Colors.blueAccent,
                //                     borderRadius: BorderRadius.circular(
                //                         AppConstant.kBorderRadius12)),
                //                 child: IconButton(
                //                     onPressed: () {},
                //                     icon: const Icon(
                //                       Icons.settings,
                //                       color: Colors.white,
                //                     )),
                //               ),
                //               const SizedBox(
                //                 width: 10,
                //               ),
                //               Container(
                //                 decoration: BoxDecoration(
                //                     color: Colors.blueAccent,
                //                     borderRadius: BorderRadius.circular(
                //                         AppConstant.kBorderRadius12)),
                //                 child: IconButton(
                //                     onPressed: () {},
                //                     icon: const Icon(
                //                       Icons.notifications,
                //                       color: Colors.white,
                //                     )),
                //               )
                //             ],
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Container(
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(
                //                 AppConstant.kBorderRadius12,
                //               ),
                //               color: Colors.grey[200],
                //             ),
                //             child: Row(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Expanded(
                //                   child: TextFormField(
                //                     // controller: passwordController,
                //                     decoration: InputDecoration(
                //                       hintStyle:
                //                           AppTextStyles.bodyLarge!.copyWith(
                //                               // fontWeight: FontWeight.bold,
                //                               // color: Colors.grey,
                //                               ),
                //                       hintText: 'Search for article...',
                //                       filled: true,
                //                       fillColor: Colors.grey[200],
                //                       contentPadding:
                //                           const EdgeInsets.symmetric(
                //                         horizontal: AppConstant.kBorderRadius16,
                //                       ),
                //                       border: OutlineInputBorder(
                //                         borderSide: BorderSide.none,
                //                         borderRadius: BorderRadius.circular(
                //                             AppConstant.kBorderRadius12),
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //                 Container(
                //                   decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(
                //                         AppConstant.kBorderRadius12,
                //                       ),
                //                       color: Colors.blueAccent),
                //                   child: IconButton(
                //                       onPressed: () {},
                //                       icon: SvgPicture.asset(
                //                           'assets/icons/Group.svg')),
                //                 )
                //               ],
                //             ),
                //           ),
                //           const SizedBox(
                //             height: 20,
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // SizedBox(
                //   height: 30,
                //   child: ListView(
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     children: category
                //         .map((e) => Container(
                //               decoration: BoxDecoration(
                //                   color: Colors.grey,
                //                   borderRadius: BorderRadius.circular(
                //                       AppConstant.kBorderRadius12)),
                //               margin: const EdgeInsets.only(
                //                   left: AppConstant.kBorderRadius16),
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: AppConstant.kBorderRadius12,
                //                   vertical: AppConstant.kPadding4),
                //               child: Text(
                //                 e['category'].toString(),
                //                 style: AppTextStyles.bodyMedium!.copyWith(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.bold),
                //               ),
                //             ))
                //         .toList(),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppConstant.kPadding16),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemCount: state.isProduct!.products.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    AppConstant.kBorderRadius12),
                              ),
                              height: 150,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl:
                                    state.isProduct!.products[index].thumbnail,
                                placeholder: (context, url) => const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox.square(
                                        dimension: 15,
                                        child: CircularProgressIndicator()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Loading....'),
                                  ],
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.broken_image),
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  state.isProduct!.products[index].title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(state.isProduct!.products[index].rating
                                  .toString())
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ))
              ],
            ),
    );
  }
}
