cask "cartero" do
  version "0.2.3"

  on_arm do
        sha256 "1fd6022ad5984866c7adb398d0437f366004c08e8b146b4e3eb8a4f242e8ce6b"
    url "https://github.com/danirod/cartero/releases/download/v#{version}/Cartero-#{version}-macOS-arm64.dmg",
        verified: "github.com/danirod/cartero/"
  end

  on_intel do
        sha256 "989eaba213d459416d1ac3d32859b80f476d8292a294cf64a93437f5137f95ae"
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
