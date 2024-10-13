cask "cartero" do
  version "0.1.2"
  sha256 "b98319e9a1e030c4a4426f6d7d84b5fc1a27859c2cabd6ad98fd38d40b362ae6"

  url "https://github.com/danirod/cartero/releases/download/v0.1.2/Cartero-#{version}-macOS-ARM64.dmg"
  name "Cartero"
  desc "Make HTTP requests and test APIs"

  homepage "https://cartero.danirod.es"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">=:mojave"
  app "Cartero.app"

  zap trash: ""
end
