cask "cartero" do
  version "0.2.2"

  on_arm do
    sha256 "fae6e3f90b85be2ef83206bca381d0f885f2b862340d7784ff3084ee407d0726"
    url "https://github.com/danirod/cartero/releases/download/v#{version}/Cartero-#{version}-macOS-arm64.dmg",
        verified: "github.com/danirod/cartero/"
  end

  on_intel do
    sha256 "a61c87828d1786b928ee0148a3a2d2b188c8cc9202d4745f475e437452a4b45f"
    url "https://github.com/danirod/cartero/releases/download/v#{version}/Cartero-#{version}-macOS-x64.dmg",
        verified: "github.com/danirod/cartero/"
  end

  name "Cartero"
  desc "Make HTTP requests and test APIs"
  homepage "https://cartero.danirod.es/"

  livecheck do
    url "https://github.com/danirod/cartero"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Cartero.app"

  zap trash: [
    "~/Library/Application Support/Cartero",
    "~/Library/Preferences/com.danirod.cartero.plist",
  ]
end
