{ pkgs, inputs }:

pkgs.php.buildComposerProject (finalAttrs: {
  pname = "phpactor";
  version = "master";
  src = inputs.phpactor-laravel;
  vendorHash = "sha256-9re+qnjcu9kqbwlxFnTtkL+wZHs+OxEax6Jl5T3c5s0=";
  buildInputs = [ pkgs.php84 ];
})

