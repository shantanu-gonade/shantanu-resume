import 'package:devfolio/components/app_button.dart';
import 'package:devfolio/constants/theme.dart';
import 'package:devfolio/models/about.dart';
import 'package:devfolio/models/basic.dart';
import 'package:devfolio/utils/assets.dart';
import 'package:jaspr/jaspr.dart';

@client
class AboutMeSection extends StatelessComponent {
  final About about;
  final Basic basic;
  const AboutMeSection({
    super.key,
    required this.about,
    required this.basic,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(classes: 'about-me-section', [
      span(classes: 'title', id: 'about', [
        text('About Me'),
      ]),
      span(classes: 'subtitle', [
        text('Get to know me :)'),
      ]),
      div(classes: 'about-section-body', [
        div(classes: 'profile-picture', [
          img(
            src: StaticAssets.coloredImage,
            classes: 'profile-image desktop-image',
          ),
          img(
            src: StaticAssets.mobileImage,
            classes: 'profile-image mobile-image',
          ),
        ]),
        div(classes: 'about-details', [
          span(
              classes: 'intro-label',
              styles: Styles.text(color: themePrimaryColor),
              [
                text('Who am I?'),
              ]),
          span(classes: 'intro-heading', [
            text(about.heading),
          ]),
          span(
              classes: 'intro-details',
              styles: Styles.text(
                color: Colors.lightGrey,
              ),
              [
                text(about.description),
              ]),
          div(classes: 'divider', []),
          span(
              classes: 'tech-label',
              styles: Styles.text(color: themePrimaryColor),
              [
                text('Technologies I have worked with:'),
              ]),
          div(classes: 'tech-stack', [
            for (final t in about.tech)
              span([
                i(classes: 'fa-solid fa-play play-icon', []),
                span(classes: 'tech-item', [
                  text(t),
                ]),
              ]),
          ]),
          div(classes: 'divider', []),
          div(classes: 'personal-row', [
            div([
              span(classes: 'personal-label', [
                text('Name: '),
              ]),
              span(classes: 'personal-value', [
                text('${basic.firstName} ${basic.lastName}'),
              ]),
            ]),
            div([
              span(classes: 'personal-label', [
                text('Email: '),
              ]),
              span(classes: 'personal-value', [
                text(basic.email),
              ]),
            ])
          ]),
          div(styles: Styles.box(height: 15.px), []),
          div(classes: 'personal-row', [
            div([
              span(classes: 'personal-label', [
                text('Age: '),
              ]),
              span(classes: 'personal-value', [
                text(basic.age.toString()),
              ]),
            ]),
            div([
              span(classes: 'personal-label', [
                text('From: '),
              ]),
              span(classes: 'personal-value', [
                text(basic.address),
              ]),
            ])
          ]),
          div(styles: Styles.box(height: 25.px), []),
          div(classes: 'work-row', [
            AppButton(
              label: 'RESUME',
              href: basic.resume,
            ),
            div(classes: 'divider', styles: Styles.box(width: 80.px), []),
            for (final work in about.works)
              a(classes: 'work-item', href: work.url, target: Target.blank, [
                img(
                  src: work.image,
                  height: work.height,
                ),
              ]),
          ])
        ]),
      ])
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('.about-me-section')
        .flexbox(
          direction: FlexDirection.column,
          alignItems: AlignItems.start,
          justifyContent: JustifyContent.start,
        )
        .box(
          width: 100.percent,
          padding: EdgeInsets.only(top: 5.vh, bottom: 5.vh, left: 10.percent),
        ),
    css('.play-icon').text(color: themePrimaryColor),
    css('.title').text(
      fontFamily: FontFamily('Montserrat'),
      fontWeight: FontWeight.w100,
      fontSize: 40.px,
    ),
    css('.about-section-body')
        .flexbox(
          direction: FlexDirection.row,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.start,
        )
        .box(
          margin: EdgeInsets.only(top: 50.px),
          width: 100.percent,
        ),
    css('.profile-picture').box(
      margin: EdgeInsets.only(right: 30.px),
    ),
    css('.profile-image').box(
      height: 400.px,
      width: 400.px,
      minWidth: 350.px,
      maxWidth: 35.percent,
    ),
    css('.mobile-image').box(
      display: Display.none,
    ),
    css('.about-details')
        .flexbox(
          direction: FlexDirection.column,
          alignItems: AlignItems.start,
          justifyContent: JustifyContent.center,
        )
        .box(
          width: 50.percent,
        ),
    css('.intro-label').text(fontSize: 18.px),
    css('.intro-heading')
        .box(
          margin: EdgeInsets.symmetric(vertical: 15.px),
        )
        .text(fontSize: 20.px),
    css('.intro-details').text(
      lineHeight: 1.6.em,
      wordSpacing: 1.5.px,
      color: Colors.lightGrey,
    ),
    css('.divider')
        .box(
          height: 1.px,
          width: 100.percent,
          margin: EdgeInsets.symmetric(vertical: 15.px),
        )
        .background(color: Colors.lightGrey),
    css('.tech-label').text(fontSize: 12.px),
    css('.tech-stack')
        .flexbox(
          direction: FlexDirection.row,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.start,
          wrap: FlexWrap.wrap,
        )
        .box(
          margin: EdgeInsets.only(top: 15.px),
        ),
    css('.tech-item')
        .box(margin: EdgeInsets.only(right: 12.px, left: 5.px))
        .text(fontSize: 14.px),
    css('.personal-label').text(
      fontWeight: FontWeight.bold,
      fontSize: 12.px,
    ),
    css('.personal-value').text(
      fontSize: 12.px,
    ),
    css('.personal-row').box(width: 100.percent).flexbox(
          direction: FlexDirection.row,
          justifyContent: JustifyContent.spaceBetween,
        ),
    css('.work-row').box(width: 100.percent).flexbox(
          direction: FlexDirection.row,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.spaceBetween,
        ),

    /// MEDIA QUERIES
    /// For larger screens
    css.media(MediaQuery.screen(minWidth: 1350.px), [
      css('.about-me-section').box(
        padding: EdgeInsets.only(top: 5.vh, bottom: 5.vh, left: 8.percent),
      ),
      css('.profile-image').box(
        width: 450.px,
        height: 450.px,
        minWidth: 400.px,
      ),
    ]),

    /// For medium screens
    css.media(MediaQuery.screen(maxWidth: 1350.px), [
      css('.about-me-section').box(
        padding: EdgeInsets.only(top: 5.vh, bottom: 5.vh, left: 6.percent),
      ),
      css('.profile-picture').box(
        margin: EdgeInsets.only(right: 25.px),
      ),
      css('.profile-image').box(
        width: 400.px,
        height: 400.px,
        minWidth: 380.px,
      ),
      css('.about-details').box(width: 45.percent),
    ]),

    /// For smaller screens
    css.media(MediaQuery.screen(maxWidth: 1100.px), [
      css('.about-me-section').box(
        padding: EdgeInsets.only(top: 5.vh, bottom: 5.vh, left: 4.percent),
      ),
      css('.profile-picture').box(
        margin: EdgeInsets.only(right: 20.px),
      ),
      css('.profile-image').box(
        width: 380.px,
        height: 380.px,
        minWidth: 350.px,
      ),
      css('.about-details').box(width: 45.percent),
    ]),

    /// For tablet screens
    css.media(MediaQuery.screen(maxWidth: 900.px), [
      css('.about-me-section').box(
        padding: EdgeInsets.only(top: 5.vh, bottom: 5.vh, left: 3.percent),
      ),
      css('.about-section-body').flexbox(
        direction: FlexDirection.column,
        alignItems: AlignItems.start,
        justifyContent: JustifyContent.start,
      ),
      css('.profile-picture').box(
        margin: EdgeInsets.only(bottom: 40.px),
      ),
      css('.profile-image').box(
        width: 350.px,
        height: 350.px,
        minWidth: 320.px,
      ),
      css('.about-details').box(
        width: 90.percent,
      ),
    ]),

    /// For mobile screens
    css.media(MediaQuery.screen(maxWidth: 600.px), [
      css('.about-me-section').box(
        padding: EdgeInsets.only(top: 5.vh, bottom: 5.vh, left: 2.percent),
      ),
      css('.profile-image').box(
        width: 300.px,
        height: 300.px,
        minWidth: 280.px,
      ),
      css('.desktop-image').box(
        display: Display.none,
      ),
      css('.mobile-image').box(
        display: Display.block,
      ),
      css('.about-details').box(
        width: 95.percent,
      ),
      css('.title').text(fontSize: 32.px),
      css('.intro-heading').text(fontSize: 18.px),
      css('.intro-details').text(fontSize: 14.px),
    ]),

    /// For very small screens
    css.media(MediaQuery.screen(maxWidth: 400.px), [
      css('.profile-image').box(
        width: 250.px,
        height: 250.px,
        minWidth: 230.px,
      ),
    ]),
  ];
}
