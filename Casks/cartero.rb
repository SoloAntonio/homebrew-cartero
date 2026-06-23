cask "cartero" do
  version "26.0"

  on_arm do
            sha256 "e13b6e09ccf66578099925ede11f784dc5836f069dd6eba0560c1bc3a7eafb2f"
    url "https://github.com/danirod/cartero/releases/download/v#{version}/Cartero-#{version}-macOS-arm64.dmg",
        verified: "github.com/danirod/cartero/"
  end

  on_intel do
            sha256 "90cb35be256bf2bdf7f9ccd7a7e5856de5125f1606d24732d612e3b9f4ef242c"
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
  depends_on macos: :big_sur

  app "Cartero.app"

  zap trash: [
    "~/Library/Application Support/Cartero",
    "~/Library/Preferences/com.danirod.cartero.plist",
  ]
end
