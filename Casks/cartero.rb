cask "cartero" do
  version "0.2.4"

  on_arm do
          sha256 "cc1c843a096820d95d194252741f0044fc988b09378f42df3212d4cefcaba07e"
    url "https://github.com/danirod/cartero/releases/download/v#{version}/Cartero-#{version}-macOS-arm64.dmg",
        verified: "github.com/danirod/cartero/"
  end

  on_intel do
          sha256 "3479f567f1e5f9f83a0b8f978ad2f6fc59f623d201afbe0d6ec3ba4ad15a052d"
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
