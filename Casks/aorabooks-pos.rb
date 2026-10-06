cask "aorabooks-pos" do
  version "0.3.1"

  on_arm do
    sha256 "242b0335ed07a1161b242b5ec148a2e5b3337425a1b652f7fc47fce3ea2c47bc"
    url "https://github.com/Aorasoft/aorabooks-pos-release/releases/download/v0.3.1/Aorabooks.POS_0.3.1_aarch64.dmg"
  end
  on_intel do
    sha256 "f86236854d5a5f05ddf2ebfd3757490394ac48edf4ce7a47b5f39747cf7c904b"
    url "https://github.com/Aorasoft/aorabooks-pos-release/releases/download/v0.3.1/Aorabooks.POS_0.3.1_x64.dmg"
  end

  name "Aorabooks POS"
  desc "Point of sale for Aorabooks"
  homepage "https://aorabooks.com"

  auto_updates true

  app "Aorabooks POS.app"

  zap trash: "~/Library/Application Support/com.aorabooks.pos"
end
