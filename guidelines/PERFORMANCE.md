# Performance Guide

## General Principles

- **Avoid external API calls** when valid cached data is available.
- **Deduplicate input** before starting expensive work.
- **Limit network round trips** — batch requests where possible.
- **Keep critical paths simple and predictable.**
- **Keep retry mechanisms bounded and measurable** (max 3 retries, exponential backoff).

## Flutter-Specific Performance

### Widgets & Build

- **Use `const` constructors** wherever possible (this is enforced by lint rules).
- **Avoid unnecessary rebuilds** — use `RepaintBoundary`, `const` widgets, and `ValueListenableBuilder` / `Selector` wisely.
- **Use `ListView.builder`** (or `GridView.builder`) instead of creating all children upfront.
- **Avoid `Opacity` and `Clip`** widgets in animations — they trigger save-layers.
- **Prefer `AnimatedBuilder`** over `setState` for continuous animations.

### Images

- **Use cached network images** (`cached_network_image` or `flutter_cache_manager`).
- **Resize images** to the display size before showing them.
- **Use `ImageCache`** effectively — the default cache is 1000 images (100MB).

### State Management

- **Keep ViewModel logic lean** — heavy computation should be in Repositories or Use-cases.
- **Avoid storing large lists** in widget state — keep them in the ViewModel/Repository.
- **Use `ChangeNotifier` efficiently** — notify listeners only when state actually changes.

### Startup

- **Lazy-load** non-critical features — don't initialize everything in `main()`.
- **Defer heavy work** — use `Future.delayed` or `WidgetsBinding.instance.addPostFrameCallback` for non-critical initialization.
- **Keep the first frame fast** — minimize work in `build()`.

## Measuring Performance

- Use **Flutter DevTools** for profiling:
  - Frame rendering budget: **target 60fps** (16ms per frame), or 120fps on high-refresh devices.
  - Watch for "jank" (frames > 16ms).
  - Monitor widget rebuild counts.
- Use **`debugPrint`** sparingly — it can mask performance issues in debug mode.
- Profile on **real devices**, not just simulators.