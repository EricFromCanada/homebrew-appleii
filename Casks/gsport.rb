cask 'gsport' do
  version '0.31'
  sha256 '00d5df71ff0ee6932ece28b248e100fdb378d05d958374223c15962b2529b913'

  url "https://github.com/david-schmidt/gsport/releases/download/#{version}/gsport_#{version}.dmg"
  appcast 'https://github.com/david-schmidt/gsport/releases.atom'
  name 'GSPort'
  name 'Portable Apple IIGS emulator'
  homepage 'https://david-schmidt.github.io/gsport/'

  app 'GSPort/GSPort.app'

  caveats do
    "A ROM file should be put in #{staged_path}/GSport."
  end
end
