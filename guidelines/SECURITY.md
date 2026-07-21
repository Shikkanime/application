# Security Guide

## Data Handling

- **Validate all external input** before using it (API responses, user input, deep links, push notification payloads).
- **Treat all external data as untrusted by default.**
- **Never store sensitive data** in plain text in SharedPreferences or local storage. Use the system's secure keychain/keystore (e.g., `flutter_secure_storage`).
- **Never log secrets**, tokens, passwords, or personally identifiable information (PII).
- **Sanitize data** before displaying user-generated content to prevent XSS-like issues in WebViews.

## Network Security

- **Use HTTPS** for all API calls. Never send data over unencrypted HTTP.
- **Validate SSL certificates** — disable certificate pinning bypass only in debug builds.
- **Set reasonable timeouts** on all HTTP requests (default: 10 seconds).
- **Handle HTTP 401 (Unauthorized)** gracefully: redirect to login, clear stale tokens.

## API & Token Security

- **Never hardcode API keys or secrets** in the source code. Use environment variables or a secure config service.
- **Store auth tokens** in secure storage, not SharedPreferences.
- **Implement token refresh** logic — don't assume tokens are valid forever.
- **Do not expose internal details** (stack traces, database errors, internal URLs) in user-facing errors or API responses.

## Platform Security

- **Use `flutter_secure_storage`** for storing sensitive data (tokens, identifiers).
- **Enable code obfuscation** in release builds (`--obfuscate --split-debug-info`).
- **Keep dependencies updated** to avoid known vulnerabilities.
- **Minimize permissions** — only request the permissions your app actually needs.

## What NOT to Do

❌ Log tokens, passwords, or personal data.
❌ Store tokens in SharedPreferences or plain text files.
❌ Hardcode API keys or secrets.
❌ Expose internal error details to users.
❌ Trust external input without validation.
❌ Use HTTP instead of HTTPS.