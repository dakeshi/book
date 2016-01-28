Application implemented using Reactive Programming
==================================================

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