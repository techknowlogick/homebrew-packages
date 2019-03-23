require "formula"

class Shiori < Formula
  homepage "https://github.com/techknowlogick/shiori"
  head "https://github.com/techknowlogick/shiori.git"

  stable do
    version "0.7.0"
    url "https://dl.techknowlogick.com/shiori/#{version}/shiori-darwin-10.6-amd64"
    sha256 `curl -s https://dl.techknowlogick.com/shiori/#{version}/shiori-darwin-10.6-amd64.sha256`.split(" ").first
  end

  devel do
    version "nightly"
    url "https://dl.techknowlogick.com/shiori/#{version}/shiori-darwin-10.6-amd64"
    sha256 `curl -s https://dl.techknowlogick.com/shiori/#{version}/shiori-darwin-10.6-amd64.sha256`.split(" ").first
  end

  def install
    bin.install "#{buildpath}/shiori-darwin-10.6-amd64" => "shiori"
  end
end

