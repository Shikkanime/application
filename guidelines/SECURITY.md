# Security Guide

## Treat external data as untrusted

- **All external input is untrusted**: API responses, query parameters, and user-entered data.
- Validate and sanitize incoming data before use. Do not blindly trust field types, lengths, or content from the API.
- Guard against malformed responses (wrong types, nulls, missing fields) so a bad payload fails safely instead of crashing or being rendered raw.

## Do not expose or log sensitive information

- **Never log secrets**, tokens, cookies, or personal identifiers.
- `debugPrint` is acceptable for local debugging, but must never print credentials, auth tokens, or user-private data (see the [Performance Guide](PERFORMANCE.md) for logging status).
- Do not include API keys or secrets in application source. Environment-driven values (e.g. `API_BASE_URL`) are injected via `--dart-define` / `String.fromEnvironment` (`EnvConfig`), never hardcoded.

## Configuration security

- Keep configuration in `lib/core/config/` (e.g. `EnvConfig`) and inject secrets at build time. Never commit real credentials.

## Error handling

- Fail safely on `ApiFailure`: handle success and failure branches on the sealed `ApiResult` exhaustively; do not silently ignore errors or leak raw stack traces to the UI.
- Keep user-facing errors generic; surface the actionable message without internal implementation details.

## Think about impact

- Any change that processes external data, renders remote content, or interacts with platform channels must be reviewed with these rules in mind.