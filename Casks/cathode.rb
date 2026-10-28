cask "cathode" do
  version "0.4.0"
  sha256 "19bc11098a0f26dd3b302c7981b762151e096940aa2c442b68499b382c0d31d8"

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
