{
  stdenv,
  fetchFromGitHub,
  odin,
  lib,
  makeBinaryWrapper,
  unstableGitUpdater,
}:
stdenv.mkDerivation {
  pname = "ols";
  version = "nightly";

  src = fetchFromGitHub {
    owner = "DanielGavin";
    repo = "ols";
    rev = "nightly";
    sha256 = "sha256-aUQKbZOrxDdUGORY2Rr2Drfxi0Q+dZZQSBCkJ+XQhcE=";
  };
  postPatch = ''
    substituteInPlace build.sh \
      --replace-fail "-microarch:native" ""
    patchShebangs build.sh odinfmt.sh
  '';

  nativeBuildInputs = [makeBinaryWrapper];

  buildInputs = [odin];

  buildPhase = ''
    runHook preBuild

    ./build.sh && ./odinfmt.sh

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    install -Dm755 ols odinfmt -t $out/bin/
    wrapProgram $out/bin/ols --set-default ODIN_ROOT ${odin}/share

    runHook postInstall
  '';

  passthru.updateScript = unstableGitUpdater {hardcodeZeroVersion = true;};
}
