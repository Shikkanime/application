# Performance Guide

## Widgets

- **Use `const` constructors** for any widget subtree that does not depend on mutable state. This lets Flutter skip rebuilds entirely.
- **Avoid work in `build`**: do not perform HTTP calls, heavy computation, or object allocation in `build()`. All data work belongs in ViewModels/Repositories.
- **Keep builds cheap and focused**: prefer small, single-purpose widgets; avoid rebuilding an entire page when only one region changed.
- **Use `context.watch<T>()` at the narrowest scope**: watch where the value is read so only that widget rebuilds.

## Data & state

- **Avoid re-fetching when valid data is cached**: ViewModels use a `bypass` flag so `init(bypass: false)` returns early if data is already loaded. Do not unconditionally reload on every rebuild.
- **Bound pagination**: paginate long lists (`_limit = 15`) and stop when `_canLoadMore` is false or the end of data is reached. Do not load everything eagerly.
- **Deduplicate input**: guard against redundant concurrent fetches (e.g. skip while `_loading`).
- **Avoid janky scroll work**: keep scroll listeners light and guarded (`hasClients`, `maxScrollExtent` checks); schedule UI updates with `addPostFrameCallback` when needed.

## Rendering

- Use **skeleton placeholders** while loading (e.g. `AnimeSkeletonCard`) instead of spinners where it improves perceived performance and layout stability.
- **Reuse built-in widgets** (`MasonryGridView.builder` with `itemBuilder`) for virtualized, lazy lists instead of building all children eagerly.
- **Keep layout logical**: make responsive layout decisions in hit-tested leaf widgets, and avoid expensive layout passes in hot paths.

## Logging

- Use `debugPrint` for local debugging only. It is **not** stripped from release builds by default — guard any sensitive or verbose production logging behind `kReleaseMode`, and do **not** build production logging around requests unless explicitly required. Do not log sensitive data (see [Security Guide](SECURITY.md)).