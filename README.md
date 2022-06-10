# xenShop

xenShop is an E-Commerce iOS Application with basic functionality as described below:

1. Customers should be able to view the list of the products based on the product categories
2. Customers should be able to add the products to the shopping cart
3. Customers should be able to view the products listed on the shopping cart
4. Customers should be able to remove the products listed on the shopping cart
5. Customers should be able to checkout shopping cart and continue their transaction to payment page

## Technology Stack

xenShop iOS application is build using SwiftUI and Combine targetting iOS 15.0 and above.

Below is the major application components.

1. AppState (ObservedObject): Complete App Data state. As SwiftUI views as just representation of State, this State drives all the views.
2. Views
   1. ProductView: Product List view
   2. ProductRowView: Item in product list
   3. ProductDetailView: Product details view
   4. CartView: Cart List view
   5. CartItemView: Cart Item in cart list
   6. TabbarView: Home Tabbar view
   7. SplashView: Application Start splash screen
   8. OrderView: Success/Failure order view

    Other helper views

   1. StarsView: Star rating view (https://swiftuirecipes.com/blog/star-rating-view-in-swiftui)
   2. ActivityIndicatorView: Loading Indicator view
   3. LineView: Simple line view
   4. XenImageView: Async Image loading view from remote url
   5. OverlayView: Show overlay banner view (https://prafullkumar77.medium.com/swiftui-how-to-make-toast-and-notification-banners-bc8aae313b33)
3. NetworkManager: Networking is done using Moya + Combine library (https://github.com/Moya/Moya)
   1. XenShopAPI: Enum listing all possible APIs
   Cart API not working as of now, so didn't integrate those.
   2. XenShopError: Error parsing from API
   3. Fake APIs used from https://fakestoreapi.com
4. Model:
   1. Product: Product Details like (title, description, price, etc.)
   2. Cart: Cart details like (cardId, userId, products in cart with quantity)
5. Constant:
   1. XenColor: Color pallet for app
   2. Constant.XenString: String constant for app

## Design

Design (UI/UX) inspiration is coming from free template available on Figma.

## Running the application

To run the application locally, please used Xcode 13.4+ and make sure all command line tools are installed.

1. Open xenShop.xcodeproj file using Xcode
2. Resolve SPM dependencies: Xcode -> File -> Packages -> Resolve package dependencies
3. Run application target `xenShop` to iOS Simulator.

## NOTE

There seems to be an issue with running the XCTest for iOS target of this project. Most probably due to M1 mac. Not much time to dig deep and resolve issue.

