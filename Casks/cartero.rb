cask "cartero" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "07617e7a52064275f249fa8e8962bf2e72ea871e60575311d068025c564be076",
         intel: "6ec00b867a07aeb9c5f1f89992ea028c2eaedb1f3971d9e5c16378dd690f6642"

  url "https://github.com/danirod/cartero/releases/download/v#{version}/Cartero-#{version}-macOS-#{arch}.dmg"
  name "Cartero"
  desc "Make HTTP requests and test APIs"
  homepage "https://cartero.danirod.es"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on macos: ">= :mojave"

  app "Cartero.app"

  zap trash: [
    "~/Library/Application Support/Cartero",
    "~/Library/Preferences/com.danirod.cartero.plist"
  ]
end
