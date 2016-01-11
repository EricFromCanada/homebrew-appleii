cask 'deja-iix' do
  version '2.0b (109)'
  sha256 'e6f16fade3e1af3ff484345acee25a05403e13b479e52c0818b833c42e3307be'

  url 'http://www.unmarked.com/labs/deja2/files/d2_latest.zip'
  name 'Deja IIx'
  # Deja IIx has no official home page
  homepage 'http://apple2history.org/history/ah19/'
  license :unknown

  app "Deja IIx.app"
end

