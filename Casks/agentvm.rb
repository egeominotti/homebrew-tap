cask "agentvm" do
  version "0.2.2"
  sha256 "95f32b57c3bdac75857faffc4c912d7b95b42311a52c176a5a936fe9f0effede"

  url "https://github.com/egeominotti/agentvm/releases/download/v#{version}/agentvm-native-v#{version}-macos-arm64.dmg"
  name "agentvm Native"
  desc "Run coding agents in disposable Debian virtual machines"
  homepage "https://github.com/egeominotti/agentvm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "agentvm Native.app"
end
