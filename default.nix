{ sources ? import ./nix/sources.nix
, nixpkgs ? sources.nixpkgs
, pkgs ? import sources.nixpkgs {
    overlays = [
      (import sources.rust-overlay)
      (self: super:
        {
          rustc = pkgs.rust-bin.nightly.latest.default;
          cargo = pkgs.rust-bin.nightly.latest.default;
        }
      )
    ];
  }
}:
let
  naersk = pkgs.callPackage sources.naersk { };
in
naersk.buildPackage {
  src = ./test-crate;
}
