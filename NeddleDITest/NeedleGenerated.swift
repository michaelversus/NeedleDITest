

import FourSquareClient
import NeedleFoundation
import SimpleNetworking

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->TutorialComponent->HomeComponent") { component in
        return HomeDependency2a4eb76995aae72c3da2Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->HomeComponent") { component in
        return HomeDependencycad225e9266b3c9a56ddProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoginComponent->HomeComponent") { component in
        return HomeDependency4a9921148535292cc850Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->TutorialComponent") { component in
        return TutorialDependency19c753ad7652771a25b7Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->LoginComponent") { component in
        return LoginDependency006c7d880fec28863ecaProvider(component: component)
    }
    
}

// MARK: - Providers

private class HomeDependency2a4eb76995aae72c3da2BaseProvider: HomeDependency {
    var accountProvider: UserAccountProviderProtocol {
        return rootComponent.accountProvider
    }
    var foursquareAPI: FoursquareAPIProtocol.Type {
        return rootComponent.foursquareAPI
    }
    var urlSession: URLSessionProtocol {
        return rootComponent.urlSession
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->TutorialComponent->HomeComponent
private class HomeDependency2a4eb76995aae72c3da2Provider: HomeDependency2a4eb76995aae72c3da2BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent.parent as! RootComponent)
    }
}
/// ^->RootComponent->HomeComponent
private class HomeDependencycad225e9266b3c9a56ddProvider: HomeDependency2a4eb76995aae72c3da2BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
/// ^->RootComponent->LoginComponent->HomeComponent
private class HomeDependency4a9921148535292cc850Provider: HomeDependency2a4eb76995aae72c3da2BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent.parent as! RootComponent)
    }
}
private class TutorialDependency19c753ad7652771a25b7BaseProvider: TutorialDependency {
    var accountProvider: UserAccountProviderProtocol {
        return rootComponent.accountProvider
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->TutorialComponent
private class TutorialDependency19c753ad7652771a25b7Provider: TutorialDependency19c753ad7652771a25b7BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
private class LoginDependency006c7d880fec28863ecaBaseProvider: LoginDependency {
    var accountProvider: UserAccountProviderProtocol {
        return rootComponent.accountProvider
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->LoginComponent
private class LoginDependency006c7d880fec28863ecaProvider: LoginDependency006c7d880fec28863ecaBaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
