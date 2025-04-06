import 'package:devfolio/components/app_button.dart';
import 'package:devfolio/constants/theme.dart';
import 'package:jaspr/jaspr.dart';

@client
class NavBar extends StatefulComponent {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

  @css
  static final List<StyleRule> styles = [
    // Navbar container
    css('.navbar')
        .box(
          padding: EdgeInsets.all(25.px),
        )
        .background(
          color: Colors.black,
        ),

    // Navbar content wrapper
    css('.navbar-content').flexbox(
      direction: FlexDirection.row,
      justifyContent: JustifyContent.spaceBetween,
      alignItems: AlignItems.center,
    ),

    // Brand text
    css('.brand').text(
      fontFamily: FontFamily('Agustina'),
      fontSize: 24.px,
    ),

    // Navigation links
    css('.navbar-label')
        .box(
          padding: EdgeInsets.only(right: 35.px),
        )
        .text(
          fontSize: 12.px,
          decoration: TextDecoration.none,
        ),

    // Hover effect for navigation links
    css('.navbar-label:hover')
        .text(
          color: themePrimaryColor,
        )
        .box(
          transition: Transition('color', duration: 500),
        ),

    // Navigation links container
    css('.nav-links').flexbox(
      direction: FlexDirection.row,
      justifyContent: JustifyContent.end,
      alignItems: AlignItems.center,
    ),

    // Mobile menu toggle button
    css('.menu-toggle')
        .box(
          display: Display.none,
          border: Border.all(BorderSide(width: 0.px)),
          padding: EdgeInsets.all(10.px),
          cursor: Cursor.pointer,
        )
        .background(color: Colors.transparent)
        .text(
          color: Colors.white,
          fontSize: 20.px,
          decoration: TextDecoration.none,
        ),

    // Mobile menu
    css('.mobile-menu')
        .box(
          display: Display.none,
          padding: EdgeInsets.symmetric(vertical: 20.px),
        )
        .background(color: Colors.black),

    // Mobile menu links
    css('.mobile-menu-link')
        .box(
          padding: EdgeInsets.symmetric(vertical: 10.px),
          width: 100.percent,
        )
        .text(
          fontSize: 12.px,
          decoration: TextDecoration.none,
        ),

    // Media query for tablets and small screens
    css.media(MediaQuery.screen(maxWidth: 768.px), [
      // Hide desktop nav links
      css('.nav-links').box(
        display: Display.none,
      ),

      // Show menu toggle button
      css('.menu-toggle').box(
        display: Display.block,
      ),

      // Show mobile menu when open
      css('.mobile-menu.open').box(
        display: Display.block,
      ),

      // Mobile menu links container
      css('.mobile-menu-links').flexbox(
        direction: FlexDirection.column,
        alignItems: AlignItems.center,
      ),

      // Add margin to the app button on mobile
      css('.mobile-app-button').box(
        margin: EdgeInsets.only(top: 10.px),
      ),
    ]),

    // Media query for mobile screens
    css.media(MediaQuery.screen(maxWidth: 480.px), [
      // Adjust padding for navbar on mobile
      css('.navbar').box(
        padding: EdgeInsets.symmetric(vertical: 20.px, horizontal: 15.px),
      ),

      // Reduce font size for brand on mobile
      css('.brand').text(
        fontSize: 20.px,
      ),
    ]),
  ];
}

class _NavBarState extends State<NavBar> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(classes: 'navbar', [
      div(classes: 'navbar-content', [
        // Brand
        div([
          span([text('< ')]),
          span(classes: 'brand', [text('Gonade')]),
          span([text(' />')]),
        ]),

        // Desktop Navigation Links
        div(classes: 'nav-links', [
          a(classes: 'navbar-label', href: '#', [text('HOME')]),
          a(href: '#about', classes: 'navbar-label', [text('ABOUT')]),
          a(href: '#services', classes: 'navbar-label', [text('SERVICES')]),
          a(href: '#projects', classes: 'navbar-label', [text('PROJECTS')]),
          a(href: '#contact', classes: 'navbar-label', [text('CONTACT')]),
          AppButton(
            label: 'RESUME',
            href:
                "https://drive.google.com/file/d/1WSc64pmx8zey5qfYzqqCF_XbB77JE17l/view?usp=drive_link",
          ),
        ]),

        // Mobile Menu Toggle
        a(
          classes: 'menu-toggle',
          href: '#',
          events: {
            'click': (e) {
              e.preventDefault();
              _toggleMenu();
            },
          },
          [
            i(classes: 'fas fa-${_isMenuOpen ? 'times' : 'bars'}', []),
          ],
        ),
      ]),

      // Mobile Menu
      div(classes: 'mobile-menu ${_isMenuOpen ? 'open' : ''}', [
        div(classes: 'mobile-menu-links', [
          a(classes: 'mobile-menu-link', href: '#', [text('HOME')]),
          a(href: '#about', classes: 'mobile-menu-link', [text('ABOUT')]),
          a(href: '#services', classes: 'mobile-menu-link', [text('SERVICES')]),
          a(href: '#projects', classes: 'mobile-menu-link', [text('PROJECTS')]),
          a(href: '#contact', classes: 'mobile-menu-link', [text('CONTACT')]),
          div(classes: 'mobile-app-button', [
            AppButton(
              label: 'RESUME',
              href:
                  "https://drive.google.com/file/d/1WSc64pmx8zey5qfYzqqCF_XbB77JE17l/view?usp=drive_link",
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
