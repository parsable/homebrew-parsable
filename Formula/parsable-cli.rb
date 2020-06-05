# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ParsableCli < Formula
  desc "Everything you need to get started with Parsable"
  homepage ""
  url "https://parsable-cli.s3-us-west-2.amazonaws.com/parsable-cli-v0.0.0/parsable-cli-v0.0.0.tar.gz"
  sha256 ""

  def install
    inreplace "bin/parsable-cli", /^CLIENT_HOME=/, "export PARSABLECLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    bin.install "bin/parsable-cli"
  end

  test do
    system bin/"parsable", "version"
  end
end
