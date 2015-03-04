
class Leon < Formula
  homepage "https://github.com/epfl-lara/leon"
  url "https://github.com/mantognini/leon/archive/31db59f96571f1a4d20fc21900c14055c6db42c1.zip"
  version "0.1"
  sha1 "1aa257360a558d986e471f009d7a6bc669f70c5a"

  depends_on "sbt"

  def install
    libexec.install Dir["*"]
    Dir.chdir(libexec) {
        system "sbt", "clean"
        system "sbt", "compile"
        system "sbt", "script"
        bin.install "leon"
    }
  end

  def caveats; <<-EOS.undent
      Add the following line to your ~/.bash_profile or ~/.zshrc file (and remember
      to source the file to update your current session):

          export DYLD_LIBRARY_PATH=#{libexec}/lib-leon
      EOS
  end

  test do
    puts "TODO"
  end
end
