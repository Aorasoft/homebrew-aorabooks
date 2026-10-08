cask "aorabooks-pos" do
  version "0.4.0"

  on_arm do
    sha256 "6a160301bc02f5e43b9d7a0d068c776136a7120d1d8d466e5bd148d2767a2325"
    url "https://github.com/Aorasoft/aorabooks-pos-release/releases/download/v0.4.0/Aorabooks.POS_0.4.0_aarch64.dmg"
  end
  on_intel do
    sha256 "dec4d4df210233d56cba749ee83e4a6de5553acc45e480a2ddb8830fd6ecb4fa"
    url "https://github.com/Aorasoft/aorabooks-pos-release/releases/download/v0.4.0/Aorabooks.POS_0.4.0_x64.dmg"
  end

  name "Aorabooks POS"
  desc "Point of sale for Aorabooks"
  homepage "https://aorabooks.com"

  auto_updates true

  app "Aorabooks POS.app"

  # The app is not Apple-notarized, so Gatekeeper would block the first open. This tap removes the download
  # quarantine flag after install. Remove this block once the app is notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Aorabooks POS.app"]
  end

  zap trash: "~/Library/Application Support/com.aorabooks.pos"
end
