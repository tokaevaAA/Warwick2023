<!DOCTYPE html>
<html id="ng-app" ng-strict-di lang="en" ng-controller="ApplicationCtrl">
  <head>
  <!-- Google Tag Manager -->
    <!-- End Google Tag Manager -->

    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">

    <title ng-bind="windowTitle">Summon 2.0</title>

    <!-- Standard favicon -->
    <link rel="shortcut icon" type="image/icon" href="//assets-cdn.summon.serialssolutions.com/62976332ddf25a71c49fbf52">
    <!-- Apple device icons -->
    <link rel="apple-touch-icon" sizes="32x32" href="/favicon-32x32.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <!-- Chrome for Android icon -->
    <link rel="icon" type="image/png" href="/android-chrome-196x196.png" sizes="196x196">
    <!-- For Android home screens -->
    <link rel="manifest" href="/manifest.json">

    <link ng-href="{{rssLink()}}" ng-if="view == 'search' && enableRssLink() && viewState.currentView != 'detailsPage'" rel="alternate" type="application/rss+xml" title="RSS" />

    <link rel="stylesheet" href="//static-cdn.summon.serialssolutions.com/assets/application-969301717281d02b5ba888a9b43a5d6d.css">
    <link rel="stylesheet" href="//static-cdn.summon.serialssolutions.com/assets/uxf-icons-16f99c5493f80bd66a9149a38f0f98c5.css">
    <link rel="stylesheet" href="//static-cdn.summon.serialssolutions.com/assets/postload-styles-7e2346f196cb20ea01f1f9122576b313.css">
    <style type="text/css">
        :root {
            --primary-link-color: #2c615e;
            --primary-link-visited-color: #2c615e;
            --primary-link-hover-color: #3F4246;
            --secondary-link-color: #333333;
            --secondary-link-visited-color: #333333;
            --secondary-link-hover-color: #333333;
            --header-icon-color: #FFFFFF;
            --header-background-color: #3F4246;
            --auth-banner-link-color: #e6e6e6;
            --auth-banner-background-color: #337370;
            --quick-look-button-color: #337370;
            --quick-look-button-text-color: #FFF;
            --quick-look-button-hover-color: #182a39;
            --header-link-color: #2659ab;
            --header-link-visited-color: #172e5a;
            --publi-date-btn-selected-and-custom-date-svg-color: #337370;
            --primary-btn-on-white-background-color: #325676;
            --primary-btn-text-on-white-background-color: #fff;
        }

      .customPrimaryLink,.customPrimaryLinkContainer a, .customPrimaryLinkContainer button:not(.request){
          color:#2c615e!important
      }
      .customPrimaryLink:visited,.customPrimaryLinkContainer a:visited,.customPrimaryLinkContainer button:visited:not(.request){
          color:#2c615e!important
      }
      .customPrimaryLink:hover,.customPrimaryLink:active,.customPrimaryLinkContainer a:hover,.customPrimaryLinkContainer a:active,.customPrimaryLinkContainer button:hover:not(.request),.customPrimaryLinkContainer button:active:not(.request){
          color:#3F4246!important
      }
      .customPrimaryLink svg{
          fill:#2c615e!important
      }
      .customPrimaryLink:visited svg{
          fill:#2c615e!important
      }
      .customPrimaryLink:active svg,.customPrimaryLink:hover svg{
          fill:#3F4246!important
      }
      .browzine a{
          color:#2c615e!important
      }
      .request {
          background-color: #2c615e !important;
      }
      .request:hover, .request:active{
          background-color: #3F4246 !important;
      }
      .customSecondaryLink{
          color:#333333!important
      }
      .customSecondaryLink:visited{
          color:#333333!important
      }
      .customSecondaryLink:hover,.customSecondaryLink:active{
          color:#333333!important
      }
      .record-actions .actionBtn{
          color:#337370!important
      }
      .record-actions .actionBtn svg{
          fill:#337370!important
      }
      .customColorsToggleButton a{
          color:#2c615e!important
      }
      .customColorsToggleButton a:visited{
          color:#2c615e!important
      }
      .customColorsToggleButton a:hover,.customColorsToggleButton a:active{
          color:#3F4246!important
      }
      .customColorsToggleButton::after{
          border-top-color:#2c615e!important
      }
      .customColorsToggleButton.active::after{
          border-bottom-color:#2c615e!important
      }
      .recommenderLink a{
          color:#2c615e!important
      }
      .recommenderLink:after{
          border-left-color:#2c615e!important
      }
      .recommenderLink.active a{
          color:white!important
      }
      .recommenderLink.active:after{
          border-left-color:white!important
      }
      .permalinkContainer .permalinkColor{
          color:#333333!important
      }
      .permalinkContainer .permalinkColor:hover,.permalinkContainer .permalinkColor:active{
          color:#333333!important
      }
      .clearRefinementsContainer{
          background-color:#a0a2a3!important;
      }
      .summonCheckboxContainer .checkmark,.summonCheckboxContainer input:focus:not(:disabled)~.checkmark,.summonCheckboxContainer input:hover:not(:disabled)~.checkmark{
          border:solid 1px #337370!important
      }
      .summonCheckboxContainer input:checked:not(:disabled)~.checkmark{
          background-color:#337370!important
      }
      .Filter:focus:not(.disabledFacet),.Filter:focus-within:not(.disabledFacet),.Filter:hover:not(.disabledFacet){
          background-color:#e7ecf6!important
      }
      .badges .bg-applied{
          background-color:#2859ab!important
      }
      .badges .bg-negated{
          background-color:#c22e0e!important
      }
      .clearRefinementsContainer .clearRefinementsContainerHeader .summonBtn{
          background-color:#337370!important
      }
      .customAuthBanner{
          background-color:#337370!important
      }
      .customAuthBanner a,.customAuthBanner .btn-link{
          color:#e6e6e6!important
      }
      .customAuthBanner a:visited,.customAuthBanner .btn-link:visited{
          color:#e6e6e6!important
      }
      .customAuthBanner a:hover,.customAuthBanner a:active,.customAuthBanner .btn-link:hover,.customAuthBanner .btn-link:active{
          color:#e6e6e6!important
      }
      .clearRefinementsContainer .clearRefinementsContainerHeader{
          color:#FFF!important
      }
      .clearRefinementsContainer .clearRefinementsContainerHeader .summonBtn span{
          color:#fff!important
      }
      .clearRefinementsContainer .clearRefinementsContainerHeader .summonBtn {
          background-color:#337370!important
      }
      .summon-modal-header .clear-all-btn {
          background-color:#337370!important;
          color:#fff!important
      }
      .modal-footer .submit-btn {
        background-color:#325676!important;
        color:#fff!important
      }
      .backToTopBtn{
          background-color:#337370!important;
      }
      .customHeaderButtonBackground{
          background-color:#337370!important;
      }
      .customHeader{
          background:#3F4246!important
      }
      .addBorderIfNoContrast {
        border:2px solid #fff!important;
      }
      .advancedSearchBtns .btn-link,.siteLink,.siteLinks .customColorsSiteLink,.siteLinks div>a,.siteLinks div .btn,.siteLinks button{
          color:#2659ab!important
      }
      .siteLinks div>a.help:after{
          background:#2659ab!important;
          color:#ffffff!important
      }
      .siteLinks button b{
          border-top:4px solid #2659ab
      }
      .siteLinks div>a:visited{
          color:#172e5a!important
      }
      .siteLinks div>a.help:visited:after{
          background:#172e5a!important;
          color:#ffffff!important
      }
      .advancedSearchBtns .btn-link:hover,.siteLink:hover,.siteLinks .customColorsSiteLink:hover,.siteLinks .customColorsSiteLink:active,.siteLinks div>a:hover,.siteLinks div>a:active,.siteLinks div .btn:hover,.siteLinks button:hover{
          color:#004792!important
      }
      .siteLinks div>a.help:hover:after,.siteLinks div>a.help:active:after{
          background:#004792!important;
          color:#ffffff!important
      }
      .siteLinks button:hover b{
          border-top:4px solid #004792
      }
      .date-preset-link{
          border-color:#bbd6ff!important
      }
      .date-preset-link.date-selected,.date-preset-link.date-selected:hover{
          background-color:#337370!important
      }
      .custom-date-selector i,.custom-date-selector svg{
          color:#337370!important
      }
      .custom-date-selector.open{
          background-color:#e7ecf6!important;
          border-bottom-color:#337370!important
      }
      .custom-date-selector.open:hover{
          border-color:#e7ecf6 #e7ecf6 #337370 #e7ecf6!important
      }
      .publication-date-selector .custom-date-selector:hover,.publication-date-selector .date-preset-link:hover{
          background-color:#e7ecf6!important;
          border-color:#337370!important
      }
      body .refinePane{
          background:#FFF !important;
      }
      .uxf-icon.navHamburger,.uxf-icon.navChatIcon, .uxf-icon.navSave,.uxf-icon.navLibraryCard, .uxf-icon.navLanguageSwitcher, .languageMenuButton .languageText, .logged-in {
          color:#FFFFFF!important
      }
      svg.navSave {
          fill: #FFFFFF !important;
      }
      .headerButton:hover {
          border-bottom-color: #FFFFFF !important;
      }
      .search .siteHeader .btn-link, .search .siteHeader .toggleSavedSearches{
          color:#FFFFFF!important;
      }
      .search .siteHeader .btn-link:after{
          border-top-color:#FFFFFF!important;
      }
      .search .siteHeader .btn-link.active:after{
          border-bottom-color:#FFFFFF!important;
      }
      .search .savedSearchContainer .summonBtn {
          color:#FFFFFF;
          border-color: #FFFFFF;
      }
      .summon-modal-header, .floatingPanelHeader, .floatingPanelHeader .btn-link, .floatingPanelHeader .btn-link:focus {
          background-color:#a0a2a3!important;
          color: #FFF!important;
      }
    </style>

    
    <script src="//static-cdn.summon.serialssolutions.com/assets/runtime.9ad6748cdd3001b8303a.js?1699640344"></script>
    <script src="//static-cdn.summon.serialssolutions.com/assets/jquery.2f263a64dbf50ab41801.js?1699640344"></script>
    <script src="//static-cdn.summon.serialssolutions.com/assets/angular.6b021a1b034b2bfe06e8.js?1699640344"></script>
    <script src="//static-cdn.summon.serialssolutions.com/assets/angularPlugins.e8b2168adcc9c60ef03b.js?1699640344"></script>
    <script src="//static-cdn.summon.serialssolutions.com/assets/plugins.83b7175cd1479dce7fe0.js?1699640344"></script>
    <script src="//static-cdn.summon.serialssolutions.com/assets/application.f695b87bf3260c387ded.js?1699640344"></script>
    <script src="/config" ></script>
    <script src="//static-cdn.summon.serialssolutions.com/assets/templates-0eaef71b6ee3712a430a2a50de67497c.js"></script>
    <script src='/localization/en-GB' charset="UTF-8"></script>
    <script src="//static-cdn.summon.serialssolutions.com/assets/postLoadPlugins.5be16b58e3fc6a819f24.js?1699640344"></script>
    <script async defer src="https://apis.google.com/js/client.js" ></script>
    <script async defer src="https://www.recaptcha.net/recaptcha/api.js?render=explicit" ></script>
      <script src='//d1bxh8uas1mnw7.cloudfront.net/assets/embed.js' defer> </script>
      <script src='//ltfl.librarything.com/syndeticsunbound/connector/initiator.php?a_id=71' defer> </script>

    <script async >
      var __refererURL = "";

      (function runLoader(self){
        var
          regex = /.*(?=\/assets\/.*)/,
          appBooted = false,
          widgetBoxJS = '//static-cdn.summon.serialssolutions.com/assets/boxWidget.fa8d8ea85f988e7dc1fd.js?1699640344',
          widgetSearchJS = '//static-cdn.summon.serialssolutions.com/assets/searchWidget.7cfa9a937f4b5a3ef34f.js?1699640344'
        ;

        function appBootstrap(){
          var head = angular.element('head');
          if(!appBooted){
            angular.bootstrap(document, ['summonApp']);
            appBooted = true;
          }
        }

        function loadScripts(){
          const bootstrapAppWhenDocReady = function () {
            angular.element(document).ready(appBootstrap);
          }
            bootstrapAppWhenDocReady();
        }

        function loadCssFromFalback() {
          var
            applicationCss = ['//static-cdn.summon.serialssolutions.com/assets/application-969301717281d02b5ba888a9b43a5d6d.css', '//static-cdn.summon.serialssolutions.com/assets/uxf-icons-16f99c5493f80bd66a9149a38f0f98c5.css', '//static-cdn.summon.serialssolutions.com/assets/postload-styles-7e2346f196cb20ea01f1f9122576b313.css']
          ;

          // adds tags for all dependent css files
          applicationCss.forEach(function(cssPath) {
            var stylesheetTag = document.createElement('link');

            stylesheetTag.setAttribute('rel', 'stylesheet');
            stylesheetTag.setAttribute('href', cssPath.replace(regex, ''));
            document.getElementsByTagName('head')[0].appendChild(stylesheetTag);
          });
        }

        function loadJSFromFallback() {
          var applicationJs = [
            '//static-cdn.summon.serialssolutions.com/assets/runtime.9ad6748cdd3001b8303a.js?1699640344',
            '//static-cdn.summon.serialssolutions.com/assets/angular.6b021a1b034b2bfe06e8.js?1699640344',
            '//static-cdn.summon.serialssolutions.com/assets/jquery.2f263a64dbf50ab41801.js?1699640344',
            '//static-cdn.summon.serialssolutions.com/assets/angularPlugins.e8b2168adcc9c60ef03b.js?1699640344',
            '//static-cdn.summon.serialssolutions.com/assets/plugins.83b7175cd1479dce7fe0.js?1699640344',
            '//static-cdn.summon.serialssolutions.com/assets/postLoadPlugins.5be16b58e3fc6a819f24.js?1699640344',
            '//static-cdn.summon.serialssolutions.com/assets/templates-0eaef71b6ee3712a430a2a50de67497c.js',
            '//static-cdn.summon.serialssolutions.com/assets/application.f695b87bf3260c387ded.js?1699640344'
          ];

          // adds tags for all dependent js files
          applicationJs.forEach(function(jsPath) {
            var jsTag = document.createElement('script');
            jsTag.setAttribute('src', jsPath.replace(regex, ''));
            document.getElementsByTagName('head')[0].appendChild(jsTag);
          });
        }

        self.searchWidgetScriptSrc = widgetSearchJS;
        
        self.boxWidgetScriptSrc = widgetBoxJS

        // fall back to Summon servers on CDN failure
        if (!window.$) {
          jqueryScript = '//static-cdn.summon.serialssolutions.com/assets/jquery.2f263a64dbf50ab41801.js?1699640344'
          console.error("The following javascript dependency failed to load: " + jqueryScript);
          console.log("- probably because the CDN is not loading. Check this domain: " + jqueryScript.replace(/(.*)\/(assets.*)/, '$1'));
          console.log("- retrying by loading things locally")
          loadCssFromFalback();
          loadJSFromFallback();
          setTimeout(loadScripts, 3000); // wait 3 seconds
        }
        else {
          loadScripts();
        }
      })(this);
    </script>
  </head>
  <body
    dir="{{ ::textDirection }}"
    when-scrolled
    idle-timer
    layout
    key-events
    class="vpnBannerAdjust">
      <div ng-cloak class="splash">
        <img src="/images/spinner.gif" alt="{{ ::i18n.translations.APP_IS_LOADING }}" />
      </div>
      <div ng-cloak role="alert" aria-live="assertive" class="offscreen">
        <span
          ng-if="loadingNewSearchIndicator || loadingSearchIndicator || feed.loading"
          ng-bind="::i18n.translations.LOADING_RESULTS">
        </span>
        <span
          ng-if="!loadingNewSearchIndicator && !loadingSearchIndicator && !feed.loading"
          ng-bind="::i18n.translations.DONE_LOADING_RESULTS">
        </span>

        <span ng-if="loadingFacetIndicator" ng-bind="::i18n.translations.LOADING_MORE_FACETS"></span>
        <span ng-if="!loadingFacetIndicator" ng-bind="::i18n.translations.DONE_LOADING_MORE_FACETS"></span>
      </div>

      <div
        id="skipnav"
        class="skipnav offscreen"
        ng-cloak
        tabindex="-1"
        focus-me="!layout.virgin">
          <ul class="list-unstyled" aria-label="{{ ::i18n.translations.ACCESSIBLE_MENU }}">
            <li class="offscreen" ng-if="view =='search'">
              <a
                role="button"
                go-to="#results"
                tabindex="0"
                ng-bind="::i18n.translations.SKIP_TO_CONTENT">
              </a>
            </li>
          </ul>
      </div>

      <h1 class="offscreen" ng-bind="windowTitle">Summon 2.0</h1>

      <div
        ng-cloak
        id="content"
        class="screen-media-wrapper">
          <div home-view ng-show="view == 'home'"></div>
          <div search-view ng-show="view == 'search'"></div>
          <div embedded-widgets-view ng-if="view == 'widgets'"></div>
          <div course-reserves ng-if="courseReservesHasRendered" ng-show="view == 'course_reserves'"></div>
          <div library-card ng-if="libraryCardHasRendered" ng-show="view == 'library_card'"></div>
          <div class="footer">
            <div chat-widget ng-if="chat.enabled"></div>
          </div>
          <div back-to-top ng-show="view == 'search'"></div>
      </div>

      <div class="print-media-wrapper" style="display:none"></div>
      <toast></toast>

      <div ng-view></div>

      <div click-track-link-form></div>

      <div ng-if="isPreviewEnv && showPreviewBanner" class="preview-env"></div>


  </body>
</html>
