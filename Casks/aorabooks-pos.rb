cask "aorabooks-pos" do
  version "0.5.0"

  on_arm do
    sha256 "c9e40a9609120727db98984e3f0926a3c2bfb6c1e560f2ad51535987b2af5e81"
    url "https://github.com/Aorasoft/aorabooks-pos-release/releases/download/v0.5.0/Aorabooks.POS_0.5.0_aarch64.dmg"
  end
  on_intel do
    sha256 "aba8b31f220e8eac8cbc21d4ee5795524bc410839a109cc6524d979ae93f6c1a"
    url "https://github.com/Aorasoft/aorabooks-pos-release/releases/download/v0.5.0/Aorabooks.POS_0.5.0_x64.dmg"
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
