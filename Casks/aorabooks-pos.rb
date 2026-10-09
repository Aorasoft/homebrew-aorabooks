cask "aorabooks-pos" do
  version "0.4.1"

  on_arm do
    sha256 "9594c9a50be392688a9e71c6a269f99e6c461e02a943aa7053b5481342c9bb9a"
    url "https://github.com/Aorasoft/aorabooks-pos-release/releases/download/v0.4.1/Aorabooks.POS_0.4.1_aarch64.dmg"
  end
  on_intel do
    sha256 "7dd35ee60bf79feaa10e4566b534c643880ca3a985dad6861f70dc5c081d2717"
    url "https://github.com/Aorasoft/aorabooks-pos-release/releases/download/v0.4.1/Aorabooks.POS_0.4.1_x64.dmg"
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
