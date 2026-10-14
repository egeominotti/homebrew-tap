# AgentVM Homebrew tap

Install [AgentVM](https://github.com/egeominotti/agentvm), a Mac app for running
coding agents in disposable Debian VMs:

```bash
brew install --cask egeominotti/tap/agentvm
```

Requires Apple Silicon and macOS 14 or newer. Homebrew installs the published
native DMG into Applications and verifies its SHA-256 checksum.

Open **agentvm Native** from Applications. If the VM image is missing, use
**Settings → VM image → Rebuild image** once. Connect an account or API provider,
then choose **New VM**. See the [Quickstart](https://github.com/egeominotti/agentvm#quickstart).

Release builds are ad-hoc signed and are not notarized with an Apple Developer
certificate. This tap preserves macOS's normal security checks. See
[native app operations](https://github.com/egeominotti/agentvm/blob/main/macos/OPERATIONS.md).
If macOS blocks the first launch, follow
[Apple's app approval steps](https://support.apple.com/en-us/102445) in
**System Settings → Privacy & Security → Open Anyway**.

## Update

```bash
brew update
brew upgrade --cask egeominotti/tap/agentvm
```

## Maintain the cask

Update `version` and `sha256` in `Casks/agentvm.rb` after publishing a verified
AgentVM release. Use the DMG checksum from that release's `SHA256SUMS`.
The livecheck follows the latest stable GitHub release.

```bash
brew trust --cask egeominotti/tap/agentvm
brew style Casks/agentvm.rb
brew audit --cask --strict egeominotti/tap/agentvm
brew livecheck --cask egeominotti/tap/agentvm
```

CI installs the actual DMG into a temporary application directory and verifies
the bundle signature, metadata and packaged executables. It does not launch the
app: the current release needs macOS approval on first launch. Uninstalling the
cask removes the app; it leaves `~/AgentVMs` and running VMs alone.
