# AC/DC Weather App
Weather app for AC/DC's world tour. In it you will find the cities where the shows will be, and the weather forecast for them.

## Technology

The technology chosen for the development of this project was `Flutter`. Find out more at: [flutter.dev](https://flutter.dev/)

### Required Versions
- **Dart**: [![Dart][dart_img]][dart_ln] [Official Dart Documentation](https://dart.dev)

- **Flutter**: [![Flutter][flutter_img]][flutter_ln] [Official Flutter Documentation](https://docs.flutter.dev/get-started/install)

### Monorepository
We work in a [monorepo](https://adityadroid.medium.com/flutter-at-scale-code-sharing-using-a-monorepo-a7a46c427141) structure, in which we have all our apps and packages that support the applications in a single repository.

**Structure**
- App
- Design System
 
### Main Packages Used

- [Auto Injector](https://pub.dev/packages/auto_injector): Dependency injection in the app


## Internal Packages

### Design System
**Packages Name**: back in black.  
  
**Description**:  
The design system is an internal lib that will have all graphical components and themes for the products.  
  
**What will you find inside it?**  
- Theme adjustments.
- Graphic components, such as Buttons and Cards.

## Project's Guide Lines

### Nomenclature
- **Variables, functions e methods:** `camelCase`
  - Keep the name declarative without abbreviation (regardless of its length), which reflects its action or usability. 
- **Classes:** `PascalCase`
  - **Interfaces:** main name, e.g. Controller
  - **Implementation:** end with a `Impl`, e.g. Controller`Impl`
- **Folders and Files:** `snake_case`
  - **Sufix:** what it is, e.g. home`_page`/home`_module`

**Suffix Summary**
- `_exception.dart`: Referring to error classes.
- `_impl.dart`: Referring to implementation of an abstract class.
- `_module.dart`: Rreferring to the module configuration structure.
- `_page.dart`: Referring to pages.
- `_widget.dart`: Referring to specific components of a page.


### Folder Apps Structure
Inside the lib there are two main folders: app and core.

- **app folder**: Stores files relating to the application itself. Which is separated through:
  - **features**: File that implements the business rule.
  - **modules**: File containing the presenter structure.
  - **widget**: Structural designer system components.

- **core folder**: Stores system foundation files. Inside it, the base structures that help maintain the architecture.

### Theme and Design System
The design system has an exclusive internal package, which contains all graphic components and theme adjustments. This makes it possible to have more than one version of the design system. Therefore, if this is the case, make sure you are using the version you want at this time.

**Let's look at some basics**

- All colors can be accessed using the code:
```dart
final colors = SinaxysColors.of(context);
```

- Text styles can be accessed through:
```dart
final textTheme = Theme.of(context).textTheme;

//Example
Text(
  "title",
  style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
),
```

- Icons/Images/Logos can also be accessed in a practical way.
```dart
Column(
    children: [
      BackIcons.weatherClear(),
      BackImages.wind(),
      BackLogos.logo(),
    ],
  ),
```
- All components are within the `components` directory, and they will be divided into directories, for example:

> Inside of `components/text_fields/` all our types of text fields, following the same logic for all component creation.

### Dependency Inversion Principle (DIP)
The Dependency Inversion Principle (DIP) is one of the SOLID principles of object-oriented design. According to DIP, high-level modules should not depend on low-level modules, but both should depend on abstractions. In other words, the principle suggests that the direction of dependency should be towards abstractions, rather than concrete implementations. [Go deep](https://medium.com/@flutterdynasty/mastering-dependency-inversion-principle-in-flutter-e1748fe9e006)

- To apply DIP to a project, you need to follow some practices:
 - **Definir abstrações claras**: Identifique as interfaces ou classes abstratas que descrevem os comportamentos que os módulos de alto nível precisam. Essas abstrações devem ser independentes de qualquer implementação concreta.
 - **Inject dependencies**: Instead of instantiating objects directly inside other objects, inject dependencies through constructors, methods, or properties. This allows concrete implementations to be replaced with other compatible implementations without changing the code of high-level modules.
 - **Follow the Inversion of Control (IoC) Principle**: In DIP, control is inverted so that concrete implementations depend on abstractions. This is often achieved through a dependency injection container that manages the creation and resolution of dependencies.
 - **Test isolated units**: By using abstractions and injecting dependencies, you can write unit tests more easily by replacing real implementations with mocks or stubs during testing.

By following these practices, you can create more flexible, modular, and maintainable code that aligns with DIP principles.
```dart
class GetShowUseCaseImpl extends GetShowUseCase {
  final ShowRepository showRepository;

GetShowUseCaseImpl({
    required this.showRepository,
  });
}
```

### Error and Results Handling
In operations that may return results or errors, we can use the typedef `Output<T>` to represent the output of these operations. This typedef allows us to encapsulate both success and failure in a single type using `Either`.

- Operation can return a success (T) or an error `(BaseException)`.
- This typedef is parameterized with a generic type T, which represents the type of data returned in case of success.
```dart
typedef Output<T> = Either<BaseException, T>;
```
**Usage example**: `Output<UserEntity>` represents the output of an operation that returns an object of type UserEntity in case of success, or an exception of type `BaseException` in case of error.

```dart
abstract class ShowRepository {
  Future<Output<ShowEntity>> getUser(ShowEntity show);
}
```
  
**Creating Exception Classes**  
  
Creating exception classes to handle specific errors is possible by extending the **BaseException** class. Use the `DefaultException` structure as a basis:

```dart
class DefaultException extends BaseException {
  const DefaultException({
    required super.message,
    super.stackTracing,
  });
}
```

Some main exceptions are already available by the core, these are:

- ValidationException.
```dart
class ValidationException extends BaseException {
  const ValidationException({
    required super.message,
    super.stackTracing,
  });
}
```

- HttpException
```dart
class HttpException extends BaseException {
  final int statusCode;
  const HttpException({
    required this.statusCode,
    required super.message,
    super.stackTracing,
  });
}
```

- DefaultException
```dart
class DefaultException extends BaseException {
  const DefaultException({
    required super.message,
    super.stackTracing,
  });
}
```

### State Pattern
The Pattern used in this project is structured with native tools of the framework. Which, through an abstract class called `BaseController`, which was designed to manage and notify state changes using the `ValueNotifier` class. This class can use builder like [ValueListenableBuilder], [ListenableBuilder] or [AnimatedBuilder].

**How to use?**  
An extended `BaseController` class controls a single page. Additionally, you can also create specific state classes for it.

```dart
class HomeController extends BaseController<BaseState> {
  HomeController() : super(HomeInitial());
  }
```

```dart
final class HomeSuccess extends SuccessState<List<ShowWeatherEntity>> {
  const HomeSuccess({required super.data});
}
```
In the controlling class body, events are inserted through functions of the `Future<void> event()` type. During your process it is possible to issue states through `update(State())`.  
e.g:

```dart
class HomeController extends BaseController<BaseState> {
  HomeController() : super(HomeInitial());

  Future<void> initEvent() async {
    update(HomeLoading());
    ..
    ..
    ..
    update(HomeSuccess(date: _));
    }
  }
```

### Dependency Injection (Auto Injector)
We consider coupling to be the dependency between classes when one class "calls" another to execute something or search for some data/value, at any point, we can say that there is a coupling there, as it depends on something that the other class that is being called does or owns.  
To break a class's bond with its dependency, we generally prefer to "inject" the dependency instances through a constructor, setters, or methods. That's what we call "Dependency Injection". We show an example that follows this concept when we talk about [DIP](#dependency-inversion-principle-dip).

The Auto Injector strategy for building an instance with its dependencies comprise register all objects in a module and manufactures them on demand or in single-instance form(singleton). All instance registration process is managed by auto_injector.  

There are a few ways to build a Bind to register object instances:

- injector.add: Build an instance on demand (Factory).
- injector.addSingleton: Build an instance only once when the module starts.
- injector.addLazySingleton: Build an instance only once when prompted.
- injector.addInstance: Adds an existing instance.

```dart
final injector = AutoInjector(on: (injector) {
  injector.addInjector(coreModule);
  injector.addInjector(showScheduleModule);
  injector.addInjector(weatherForecastModule);

  injector.addLazySingleton<HomeController>(HomeController.new);

  injector.commit();
});
```
The dependencies of these instances will be resolved automatically using the auto_injector mechanisms.

To get a resolved instance use `autoInjector.get`:
```dart
final client = autoInjector.get<Client>();

// or set a default value
final client = autoInjector.get<Client>(defaultValue: Client());

// or use tryGet
Client client = autoInjector.autoInjector<Client>() ?? Client();

// or get with key
Client client = autoInjector.get(key: 'OtherCLient');
```

### Architecture Layers
Robert C. Martin concludes in the book “Clean architecture a craftsman's guide to software structure and design”. that an architecture must contain at least 4 main and independent layers to be considered “clean”, they are:

- Corporate Business Rules
- Application Business Rules
- Interface Adapters
- Frameworks & Drivers (External)

However, this suggested structure has some difficulties when applying to dart/flutter. Therefore, some adaptations to this methodology can be made to facilitate its implementation, with the main focus on the Application Domain, a layer that hosts the 2 main Business Rules. We are talking about Entities and Use Cases.

- **Presenter**: We will host the Widgets, Pages and also State Management.
- **Domain**: Hosts the Cooperative(Entity) and Application(Usecase) Business Rules.
- **Infrastructure (Infra)**: This layer supports the Domain layer by implementing its interfaces. To do this, it adapts external data so that it can comply with domain contracts.
- **External**: This layer must contain everything that has a high chance of being changed without the programmer being able to intervene directly in the project.


## Standard Model
### Interface
```dart
//good
abstract interface class User {}

//bad
abstract interface class InterfaceUser {}
```
### Interface Implementation
```dart
//good
class UserImpl implements User {}

//bad
class UserImplements implements User {}
```
### Entity
```dart
 //good
class UserEntity implements Entity {}

//bad
class User {}
```

### Parameters
```dart
 //good
class AuthParam implements Parameters {}

//bad
class AuthParameters {}
```




## Convenção de Commits
The Conventional Commits specification is a lightweight convention on top of commit messages. It provides an easy set of rules for creating an explicit commit history; which makes it easier to write automated tools on top of.  See the all [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).  


### Naming convention for Commits
- prefixes used:
  - `fix`: Resolve a bug.
  - `feat`: Starts the implementation of a feature.
  - `cry`: Work in progress on a feature.
  - `refactor`: Adjustment without changing logic - refactoring.
  - `test`: Implement automated tests.
  - `style`: Code formatting changes - lint.
  - `perf`: Performance adjustments.
  - `docs`: insert documentary.
  - `ci`: adjust the CI settings.
  - `build`: Adjustment of build configurations.

Example:
`:alembic: feat: allow provided config object to extend other configs`  
  
A scope may be provided to a commit’s type, to provide additional contextual information and is contained within parenthesis, e.g., `feat(parser): add ability to parse arrays.`



<!-- Links úteis: -->
[dart_img]: https://img.shields.io/static/v1?label=Dart&message=3.4.3&color=blue&logo=dart
[dart_ln]: https://dart.dev/ "https://dart.dev/"
[flutter_img]: https://img.shields.io/static/v1?label=Flutter&message=3.22.2&color=blue&logo=flutter
[flutter_ln]: https://docs.flutter.dev/get-started/install "https://docs.flutter.dev/get-started/install"
