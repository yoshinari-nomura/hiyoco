git = File.expand_path('../.git', __FILE__)
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gc_watcher/version"

Gem::Specification.new do |spec|
  spec.name          = "gc_watcher"
  spec.version       = GcWatcher::VERSION
  spec.authors       = ["Nomura Laboratory, Hiromu, Ishikawa, Yoshinari Nonura"]
  spec.email         = ["nomura.laboratory@gmail.com"]

  spec.summary       = %q{Watch Google calenar and send events via gRPC to upstreams.}
  spec.description   = %q{Watch Google calenar and send events via gRPC to upstreams.}
  spec.homepage      = "https://github.com/nomlab/hiyoco"
  spec.license       = "MIT"

  spec.files         = if Dir.exist?(git)
                         `git ls-files -z`.split("\x0")
                       else
                         Dir['**/*']
                       end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # NOTE: "google-protobuf" gem would be installed as a dependency of "grpc" gem.
  spec.add_runtime_dependency "grpc"
  spec.add_runtime_dependency "google-protobuf"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "grpc-tools"
end
