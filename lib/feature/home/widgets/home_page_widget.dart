import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:restaurant_app/data/models/responses/Home_model.dart';
import 'package:restaurant_app/data/store/home_store.dart';
import 'package:restaurant_app/feature/home/widgets/home_observer.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../values/extensions/app_padding_ext.dart';
import '../../../values/theme/app_border_radius.dart';
import '../../../values/theme/app_colors.dart';
import '../../../values/theme/app_edge_insets.dart';
import '../../../values/theme/app_input_decoration.dart';
import '../../../widgets/app_overlay_loader.dart';
import '../../../widgets/recommended_widget.dart';
import 'category_list_view.dart';
import 'home_page_divider.dart';
import 'near_hotels_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final HomeStore homeStore = HomeStore();
  // late ReactionDisposer _disposer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeStore.featchHomeInfo();
    // _disposer = reaction((_) => homeStore.isLoading, (isLoading) {
    //   if (isLoading) {
    //     AppOverlayLoader.show(context, message: "featching Data");
    //   } else {
    //     AppOverlayLoader.hide();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return HomeObserver(homeStore: homeStore, showData: buildHomeUI);
  }

  Widget buildHomeUI(HomeModel homeInfo) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          animateColor: false,
          leading: SvgPicture.asset(Assets.svgs.location.path).pAllM,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  homeInfo.location ??S.current.lblUnknow,
                  style: TextTheme.of(context).headlineSmall,
                ),
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .center,
              children: [
                buildsearchBar().phM,
                CategoryListView(categoryList: homeInfo.categories ?? []),
                homePageDivider(context),
                NearHotelsWidget(hotels: homeInfo.nearbyHotels ?? []),
                homePageDivider(context),
                RecommendedWidget(recList: homeInfo.recommended ?? []),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextField buildsearchBar() {
    return TextField(
      decoration: AppInputDecoration.auth(
        prefixText: S.of(context).hadingFoodGroceriesDrink,
        prefixIcon: Icon(Icons.search_rounded),
        suffix: Container(
          padding: AppEdgeInsets.allS,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.m,
          ),
          child: SvgPicture.asset(Assets.svgs.filter.path),
        ).pAllS,
      ),
    );
  }
}
