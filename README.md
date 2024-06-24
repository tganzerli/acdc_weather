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
  - **Interfaces:** begin with a `I`, e.g. `I`Controller
  - **Implementation:** end with a `Impl`, e.g. Controller`Impl`
- **Folders and Files:** `snake_case`
  - **Sufix:** what it is, e.g. home`_page`/home`_module`

**Suffix Summary**
- `_exception.dart`: Referring to error classes.
- `_module.dart`: Rreferring to the module configuration structure.
- `_page.dart`: Referring to pages.
- `_widget.dart`: Referring to specific components of a page.

### Folder Apps Structure


### Theme and Design System


### Dependency Inversion Principle (DIP)

### Error and Results Handling


### State Pattern

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
