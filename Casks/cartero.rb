cask "cartero" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.3"
  sha256 arm:   "c74386a05f3c742fd1a4b699493bfdc79043f1887b28e8e79425cce05c7beff6",
         intel: "45de50c4e9b35153759ca0c1a4516970e677fe64a20d080092e8397bd02212e4"
  
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