# raptorjit.nix - compile RaptorJIT with reference toolchain

{ pkgs, source, version }:

with pkgs;
with stdenv;

mkDerivation rec {
  name = "raptorjit-${version}";
  inherit version;
  src = source;
  buildInputs = [ luajit ];  # LuaJIT to bootstrap DynASM
  dontStrip = true;
  installPhase = ''
    mkdir -p $out/bin
    cp src/raptorjit $out/bin/raptorjit
  '';

  enableParallelBuilding = true;  # Do 'make -j'
}

