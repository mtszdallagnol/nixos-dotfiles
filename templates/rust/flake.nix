{
  inputs = {
		nixpkgs.url = "nixpkgs/nixos-26.05";
  };

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    packages."x86_64-linux".default = pkgs.rustPlatform.buildRustPackage {
      name = "";#change name
      src = ./.;
      buildInputs = with pkgs; [  ];
      nativeBuildInputs = [ pkgs.pkg-config ];
      cargoLock.lockFile = ./Cargo.lock;
    };

    devShells."x86_64-linux".default = pkgs.mkShell {
      buildInputs = with pkgs; [
        cargo rustc rustfmt clippy rust-analyzer
      ];

      nativeBuildInputs = [ pkgs.pkg-config ];

      env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

      shellHook = ''
        export CARGO_HOME="$PWD"/.cargo
      '';
    };
  };
}
