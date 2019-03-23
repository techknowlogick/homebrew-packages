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

  head do
    url "https://github.com/techknowlogick/shiori.git", :branch => "master"
    depends_on "go" => :build
    depends_on "node" => :build
  end

  def install
    case
    when build.head?
      ENV["GO111MODULE"]="on"
      system "make dep"
      system "make build"
      bin.install "#{buildpath}/shiori" => "shiori"
    else
      bin.install "#{buildpath}/shiori-darwin-10.6-amd64" => "shiori"
    end
  end
end

