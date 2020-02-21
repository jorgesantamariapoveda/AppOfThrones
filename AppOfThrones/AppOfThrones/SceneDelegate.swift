//
//  SceneDelegate.swift
//  AppOfThrones
//
//  Created by Jorge on 21/02/2020.
//  Copyright © 2020 Jorge. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // ViewControllers de la app
        let episodeViewController = EpisodeViewController()
        let castViewController = CastViewController()
        let housesViewController = HouseViewController()
        let favoritesViewController = FavoritesViewController()
        let settingsViewController = SettingsViewController()

        episodeViewController.tabBarItem = UITabBarItem(title: "Seasons", image: UIImage(systemName: "film.fill"), tag: 1)
        castViewController.tabBarItem = UITabBarItem(title: "Cast", image: UIImage(systemName: "person.3.fill"), tag: 2)
        housesViewController.tabBarItem = UITabBarItem(title: "Houses", image: UIImage(systemName: "shield.lefthalf.fill"), tag: 3)
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.fill"), tag: 4)
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 5)

        let navigationEpisodeController = UINavigationController(rootViewController: episodeViewController)
        let navigationCastController = UINavigationController(rootViewController: castViewController)
        let navigationHouseController = UINavigationController(rootViewController: housesViewController)
        let navigationFavoritesController = UINavigationController(rootViewController: favoritesViewController)
        let navigationSettingsController = UINavigationController(rootViewController: settingsViewController)

        // Configuración navegación
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
                                        navigationEpisodeController,
                                        navigationCastController,
                                        navigationHouseController,
                                        navigationFavoritesController,
                                        navigationSettingsController
        ]
        tabBarController.tabBar.barStyle = UIBarStyle.black
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.tintColor = UIColor(displayP3Red: 235/255.0, green: 172/255.0, blue: 38/255.0, alpha: 1.0)

        // Configuración NavigationBar
        UINavigationBar.appearance().overrideUserInterfaceStyle = .dark
        UINavigationBar.appearance().tintColor = UIColor(displayP3Red: 235/255.0, green: 172/255.0, blue: 38/255.0, alpha: 1.0)

        let rootViewController = tabBarController

        // Se configura window
        window = UIWindow.init(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

