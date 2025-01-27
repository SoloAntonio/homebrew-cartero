cask "cartero" do
  arch arm: "arm64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "b9f5f80d9d6381947139c697bb5a8f747a1d5c1fddaaf5101c3f23f28749a401",
         intel: "8346b4faf0d54ee7f3074b79c411ac100d75d12054edb64505f8fd09b2073025"

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
