cask "cathode" do
  version "0.5.2"
  sha256 "f8088714386dc6d72093bc5929adbef29e3aeeb44dd38c8b60bf8292c3d884f4"

  url "https://github.com/andunieee/cathode/releases/download/v#{version}/cathode-macos-arm64-v#{version}.zip"
  name "Cathode"
  desc "YouTube client for the desktop"
  homepage "https://github.com/andunieee/cathode"

  depends_on arch: :arm64

  app "cathode.app"

  # the app is unsigned, so clear the quarantine flag instead of making users do it
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/cathode.app"]
  end

  zap trash: [
    "~/Library/Application Support/cathode",
    "~/Library/Caches/cathode",
  ]
end
