cask "cartero" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "fae6e3f90b85be2ef83206bca385d0f885f2b862340d7784ff3084ee407d0726",
         intel: "a61c87828d1786b928ee0148a3a7d2b188c8cc9202d4745f475e437452a4b45f"

  url "https://github.com/danirod/cartero/releases/download/v#{version}/Cartero-#{version}-macOS-#{arch}.dmg",
        verified: "github.com/danirod/cartero/"
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