cask "cathode" do
  version "0.3.4"
  sha256 "6431c010310cebb2983f0ba2be9080fe15185497618066e54030cf92473ce0d1"

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
