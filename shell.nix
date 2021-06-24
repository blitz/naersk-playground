{ sources ? import ./nix/sources.nix
, nixpkgs ? sources.nixpkgs
, pkgs ? import sources.nixpkgs {
    overlays = [
      (import sources.rust-overlay)
    ];
  }
}:
pkgs.mkShell {
  nativeBuildInputs = [
    pkgs.niv
    pkgs.rust-bin.nightly.latest.default
  ];
}
