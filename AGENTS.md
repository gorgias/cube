# Additional Conventions Beyond the Built-in Functions

As this project's AI coding tool, you must follow the additional conventions below, in addition to the built-in functions.

# Repository operating guide

## Purpose and scope

- This is Gorgias' minimal Cube fork for building a custom Cube Store image.
- Gorgias-specific work is limited to `rust/cubestore/`, its Docker image, and the
  release workflow. Avoid restoring upstream packages or documentation that the
  fork intentionally removes.
- Keep changes easy to replay when the fork is updated to a newer upstream Cube
  release.

## Repository map

- `rust/cubestore/` contains the retained Rust workspace and
  `gorgias.Dockerfile`.
- `.github/workflows/image-build.yaml` builds the image and pushes it only from
  the `gorgias` branch.
- `README.md` documents the image tags and the fork-upgrade procedure.

## Common commands

- Build the Gorgias image:
  `docker build -f rust/cubestore/gorgias.Dockerfile rust/cubestore`.
- Format Rust: `cargo fmt --manifest-path rust/cubestore/Cargo.toml --all`.
- Check Rust: `cargo check --manifest-path rust/cubestore/Cargo.toml --workspace`.
- Run Rust tests:
  `cargo test --manifest-path rust/cubestore/Cargo.toml --workspace`.
- Regenerate agent files after editing `.rulesync/`:
  `./scripts/generate-rulesync.sh`.
- Verify generated files are current: `./scripts/check-rulesync-drift.sh`.

## Change policy

- Preserve the upstream Cube Store layout unless a Gorgias patch requires a
  focused change.
- When upgrading Cube Store, synchronize `gorgias.Dockerfile` with the upstream
  Dockerfile, then retain only the intentional Gorgias final-image differences.
- Update the workflow `TAG` and every documented registry tag together.
- Do not push images, change production tags, or modify registry credentials
  without explicit approval.
- Never commit secrets, service-account keys, or local registry credentials.

## Validation

- Run formatting and the narrowest relevant Cargo checks for Rust changes.
- Build the Docker image when changing either Dockerfile or its build context.
- Run the RuleSync drift check for any agent-configuration change.
