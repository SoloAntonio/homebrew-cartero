cask "cartero" do
  version "25.0"

  on_arm do
          sha256 "e2e706a62821e699118a860a8248138f079bc4ca7e21b4512f8e1a89b73d8993"
    url "https://github.com/danirod/cartero/releases/download/v#{version}/Cartero-#{version}-macOS-arm64.dmg",
        verified: "github.com/danirod/cartero/"
  end

  on_intel do
          sha256 "5b27f4b2161f4f8a26a706941bfc612f6128f38cafcdc0dcafe407ed57582646"
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
