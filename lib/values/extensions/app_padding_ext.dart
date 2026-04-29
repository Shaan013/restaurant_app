import 'package:flutter/cupertino.dart';
import '../theme/app_edge_insets.dart';

extension PaddingHelper on Widget {
  // ================= ALL SIDES =================
  // Using getters allows you to call .pAllM instead of .pAllM()
  Widget get pAllXXS => Padding(padding: AppEdgeInsets.allXXS, child: this);
  Widget get pAllXS  => Padding(padding: AppEdgeInsets.allXS, child: this);
  Widget get pAllS   => Padding(padding: AppEdgeInsets.allS, child: this);
  Widget get pAllM   => Padding(padding: AppEdgeInsets.allM, child: this);
  Widget get pAllL   => Padding(padding: AppEdgeInsets.allL, child: this);
  Widget get pAllXL  => Padding(padding: AppEdgeInsets.allXL, child: this);

  // ================= SYMMETRIC =================
  Widget get phS => Padding(padding: AppEdgeInsets.hS, child: this);
  Widget get phM => Padding(padding: AppEdgeInsets.hM, child: this);
  Widget get phL => Padding(padding: AppEdgeInsets.hL, child: this);

  Widget get pvS => Padding(padding: AppEdgeInsets.vS, child: this);
  Widget get pvM => Padding(padding: AppEdgeInsets.vM, child: this);
  Widget get pvL => Padding(padding: AppEdgeInsets.vL, child: this);

  // ================= DIRECTIONAL (Missing Feature) =================
  // Frequently needed for fine-tuning layouts
  Widget pt(double t) => Padding(padding: EdgeInsets.only(top: t), child: this);
  Widget pb(double b) => Padding(padding: EdgeInsets.only(bottom: b), child: this);
  Widget pl(double l) => Padding(padding: EdgeInsets.only(left: l), child: this);
  Widget pr(double r) => Padding(padding: EdgeInsets.only(right: r), child: this);

  // ================= PAGE & SPECIAL =================
  Widget get phvM => Padding(padding: AppEdgeInsets.hvM, child: this);
  Widget get phvS => Padding(padding: AppEdgeInsets.hvS, child: this);

  /// Standard screen padding
  Widget get pPage => Padding(padding: AppEdgeInsets.pagePadding, child: this);

  // ================= FUNCTIONAL HELPERS =================

  /// Quickly wrap with custom symmetric values if theme constants don't fit
  Widget pSymmetric({double h = 0, double v = 0}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: h, vertical: v), child: this);

  /// Pass a raw EdgeInsets if needed
  Widget p(EdgeInsets padding) => Padding(padding: padding, child: this);

  /// Sliver Padding: Essential if you use CustomScrollView
  Widget sliverP(EdgeInsets padding) => SliverPadding(padding: padding, sliver: this);
}