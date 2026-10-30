cask "cathode" do
  version "0.4.1"
  sha256 "12712fb2f0a239f527c7c912083c3dcce77c7f08bd31ea1255464c8c51025e40"

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
