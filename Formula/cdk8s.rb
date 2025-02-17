require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.151.tgz"
  sha256 "77ce1b4ce4d48db07ad756c17cd32aac0c457fd4bd211cc662953d368c234752"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "16a49d34b249315612924890f31c0ef9715c83987211ea8c9f6ee3b0720a8ec8"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
