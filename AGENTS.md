# Agents Guidelines

## Strict Rules

- Prefer stateless widgets over functional widgets.
  - Do not use methods returning widgets (`Widget _buildXxx(...)`) inside widgets.
  - Use dedicated `StatelessWidget` subclasses for UI composition.
  - This improves readability, testability, and consistency across the design system.

## General

- Follow existing code conventions and patterns in the codebase.
- Keep changes minimal and focused.
