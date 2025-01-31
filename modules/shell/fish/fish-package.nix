{pkgs ? import <nixpkgs> {}}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "fish-shell";
  version = "4.0b1";
  cargoLock = {
    lockFile = "${src}/Cargo.lock";
    outputHashes = {
      "pcre2-0.2.9" = "sha256-uYJgQuAKYaOdaMkI9MHf2viHT1BkFAaaG6v/vN3hElY";
    };
  };
  FISH_BUILD_VERSION = version;
  src = pkgs.fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = version;
    sha256 = "sha256-O5xZHXNrJMpjTA2mrTqzMtU/55UArwoc2adc0R6pVl0";
  };

  buildInputs = with pkgs; [
    cmake
    python313
    python313Packages.pexpect
    tmux
    pcre2
    sphinx
  ];
  checkFlags = [
    "--skip=tests::highlight::test_highlighting"
    "--skip=tests::highlight::test_is_potential_path stdout"
    "--skip=builtins::tests::test_tests::test_test_builtin"
  ];
}
