cask "cartero" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "3c6e7c1397e4d3479323b9776fb8a139d1709f2eb21680ab9e852ca244552feb",
         intel: "47cb60f3bde2839ccfc27b51e5c8d147602035297d3a63c1cb808bb85dfe96df"

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
