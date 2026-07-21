# Analytics & Logging Guide

## Objectif

Utiliser Firebase Analytics pour tracer le parcours utilisateur dans l'application. Chaque action significative doit être loggée pour permettre l'analyse du comportement utilisateur et le débogage.

## Règles générales

- **Logger toute action utilisateur** qui a un impact métier (connexion, inscription, recherche, clic sur contenu, partage, etc.)
- **Logger les transitions d'écran** (`logScreenView`) pour chaque vue principale
- **Ne jamais logger de données personnelles** (email, identifiant, token, etc.) dans les paramètres d'événements

## Événements standard

| Événement | Quand | Méthode |
|---|---|---|
| Connexion | Utilisateur se connecte | `logLogin()` |
| Inscription | Nouvel utilisateur s'inscrit | `logSignUp()` |
| Changement d'écran | Navigation vers une vue | `logScreenView(screenName)` |
| Recherche | Utilisateur effectue une recherche | `logSearch(term, parameters)` |
| Sélection de contenu | Clic sur un anime, épisode, etc. | `logSelectContent(contentType, itemId)` |
| Partage | Utilisateur partage un contenu | `logShare(contentType, itemId, method)` |
| Événement personnalisé | Actions spécifiques à l'app | `log(name, parameters)` |

## Utilisation dans le code

### Dans les ViewModels (injecté via constructeur)
```dart
class MonViewModel {
  MonViewModel({Analytics? analytics}) : _analytics = analytics ?? const Analytics();
  final Analytics _analytics;

  void onUserAction() {
    _analytics.logSelectContent('anime', uuid);
  }
}
```

### Dans les widgets (via Provider)
```dart
context.read<Analytics>().logSelectContent('anime', uuid);
```

### Bonnes pratiques

- **Paramètres nommés** : Utiliser des paramètres nommés et typés
- **Pas de PII** : Ne jamais logger d'email, token, ou identifiant personnel
- **Consistance** : Utiliser les mêmes `contentType` partout (`'anime'`, `'episode'`, `'simulcast'`)
- **Testabilité** : L'injection de `Analytics` permet de mocker dans les tests

## À ne pas faire

```dart
// ❌ PII dans les paramètres
analytics.log('login', {'email': user.email});

// ❌ contentType incohérent
analytics.logSelectContent('animé', uuid); // 'animé' != 'anime'

// ❌ Singleton global
Analytics.instance.logLogin(); // Plus de singleton
```

```dart
// ✅ Correct
analytics.logSelectContent('anime', anime.uuid);
analytics.logSearch(query, {'filter': 'genre', 'page': 1});
```