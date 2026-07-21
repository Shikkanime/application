# Analytics & Logging Guide

## Goal

Use Firebase Analytics to track user journeys through the application. Every meaningful user action should be logged to enable behavior analysis and debugging.

## General Rules

- **Log every user action** that has business impact (login, sign-up, search, content click, share, etc.)
- **Log screen transitions** (`logScreenView`) for every main view
- **Never log personal data** (email, identifier, token, etc.) in event parameters

## Standard Events

| Event | When | Method |
|---|---|---|
| Login | User logs in | `logLogin()` |
| Sign-up | New user registers | `logSignUp()` |
| Screen change | Navigation to a view | `logScreenView(screenName)` |
| Search | User performs a search | `logSearch(term, parameters)` |
| Content selection | Click on an anime, episode, etc. | `logSelectContent(contentType, itemId)` |
| Share | User shares content | `logShare(contentType, itemId, method)` |
| Custom event | App-specific actions | `log(name, parameters)` |

## Usage in Code

### In ViewModels (injected via constructor)
```dart
class MyViewModel {
  MyViewModel({Analytics? analytics}) : _analytics = analytics ?? const Analytics();
  final Analytics _analytics;

  void onUserAction() {
    _analytics.logSelectContent('anime', uuid);
  }
}
```

### In Widgets (via Provider)
```dart
context.read<Analytics>().logSelectContent('anime', uuid);
```

### Best Practices

- **Named parameters**: Use named and typed parameters
- **No PII**: Never log emails, tokens, or personal identifiers
- **Consistency**: Use the same `contentType` everywhere (`'anime'`, `'episode'`, `'simulcast'`)
- **Testability**: Injecting `Analytics` allows mocking in tests

## What Not to Do

```dart
// ❌ PII in parameters
analytics.log('login', {'email': user.email});

// ❌ Inconsistent contentType
analytics.logSelectContent('animé', uuid); // 'animé' != 'anime'

// ❌ Global singleton
Analytics.instance.logLogin(); // No more singleton
```

```dart
// ✅ Correct
analytics.logSelectContent('anime', anime.uuid);
analytics.logSearch(query, {'filter': 'genre', 'page': 1});
```