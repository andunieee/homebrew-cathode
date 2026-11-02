cask "cathode" do
  version "0.5.0"
  sha256 "c8d337bc14a19a9953216a88e70ea520420fe2c92f81df99e464c74c764ec091"

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
