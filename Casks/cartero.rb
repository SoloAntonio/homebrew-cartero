cask "cartero" do
  version :latest
  sha256 :no_check # No need to check the SHA256 when using :latest

  url "https://github.com/danirod/cartero/releases/latest/download/Cartero-macOS-ARM64.dmg"
  name "Cartero"
  desc "Make HTTP requests and test APIs"
  homepage "https://cartero.danirod.es"

  livecheck do
    url "https://github.com/danirod/cartero/releases"
    strategy :github_latest
  end

  depends_on macos: ">= :mojave"

  app "Cartero.app"

  zap trash: [
    "~/Library/Application Support/Cartero",
    "~/Library/Preferences/com.danirod.cartero.plist"
  ]
end