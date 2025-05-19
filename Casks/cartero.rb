cask "cartero" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
    sha256 arm:   "13200b4569e9e953436c46f6b4015dbee382b20b4d944d26d831a42df6188f79",n         intel: "2ea892d30c66a0ef5e0d190b048ca91c3a5b1abce9773ed1bc926bbe57f736ce"
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
