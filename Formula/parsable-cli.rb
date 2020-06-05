# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class ParsableCliV < Formula
  desc "Everything you need to get started with Parsable"
  homepage "https://www.parsable.com/"
  url "https://parsable-cli.s3-us-west-2.amazonaws.com/parsable-cli-v0.0.0/parsable-cli-v0.0.0.tar.gz"
  sha256 "538e887d173cd3bf5ebeb017c8d9e295d28966a3511ab436c0f2192f189e46c6"

  # depends_on "cmake" => :build

  def install
    inreplace "bin/parsable-cli", /^CLIENT_HOME=/, "export PARSABLECLI_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test parsable-cli`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
