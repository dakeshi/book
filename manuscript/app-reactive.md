# Application implemented using Reactive Programming
## Introduction

Initially the book was thought to explain all the concepts in a single section but we figured out that can be overwhelming for developers giving their firs steps in Reactive Programming. In this new version we'll introduce the conceps using an example app with the basic elements of any iOS app:

- Interaction with databases and API REST.
- Business logic applied to the received data.
- Login and session persistence. 
- User interaction with the app.

The app is an iOS client for [SoundCloud](https://soundcloud.con) with a navigation based on a tabbar with 4 main views:

- **Search**: This view will present search results from the API. Results can be tracks or playlists. It contains an `UISearchBar` and we'll see with component the concept of throttling applied to Reactive observables.
- **Favorites**: It lists the favorite tracks from the user account. Moreover the information will be persisted in a local database implemented with Realm. We'll see how to wrap database interactions converting them into Observables.
- **Playlists**: Similar to the previous one, it shows the list of user playlists. A tap on a playlist opens a new view with all the tracks that the playlist contains.
- **Me**: We'll present in this view the user information, followers, followings, playlists, ... and also the logout button that allows the user logging out and cleaning all the persisted information in `Realm` and `Keychain`.

When the user taps on a track it opens a new view, the **Player**. We'll use in this case `AVFoundation` and implement a Reactive interface for `AVPlayer`. 

All of the views above need core components to interact with data sources:

| Data Source            | Interaction                                                                                                                                                                                        |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| HTTP Rest API          | Retrieving data from the user account on SoundCloud. In some views like Search we will present the data without any previous persistence but in some others, the data will be persisted.           |
| Realm (Local Database) | Fetching and saving data from the user profile like favourites or playlists. Thanks to local persistence the user can navigate through the app and have content pre-loaded.                        |
| Keychain               | Storing the user session needed in every request sent to the API. The session is persisted once the user logs in, and cleaned when the user logouts. The session is persisted across app launches. |


### Notes

- The app is implemented using [RxSwift](https://github.com/reactivex/rxswift) but it is also explained how the features could be implemented using [ReactiveCocoa](https://github.com/reactivecocoa/reactivecocoa) in case you decide using ReactiveCocoa instead of RxSwift.
- The API reference is available [here](https://developers.soundcloud.com/docs/api/reference). Only the required endpoints are implemented in the API client but you can extend the same building logic to add new endpoints or models.
- External dependencies of the project are resolved using [CocoaPods](https://cocoapods.org) but all of them offer support for [Carthage](https://github.com/carthage/carthage) as well.
- The architecture followed by the app is **VIPER** where views are pure passive components. Presenters are responsible of briging the data and formatting it to be presented. The data us fetched using interactors that applythe business logic to the data that is fetched from repositories.
where views will behaves as passive components, and the presenters will format the data for its presentation.
- Layouts are built by code using [SnapKit](https://github.com/SnapKit/SnapKit) to simplify autolayouts.

If you haven't setup the project yet, do it! It's easier going through the book having a look to the project in Xcode. Remember that the project is available on this repository.

## Core Components

### Keychain

The first component we're going to implement using Reactive is going to be the accessor to the Keychain in order to persist the user session.

