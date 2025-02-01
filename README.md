# Alpha-Nvim

Mi configuracion de neovim para este 2025

El objetivo de esta configuracion es obtener lo mejor del mundo de nix, pero pudiendo funcionar
completamente sin el.
Esto se logra al gran trabajo de [nixCats](https://github.com/BirdeeHub/nixCats-nvim) quienes armaron esta integracion.

Si usas nix ya contiene el flake que lo podes integrar directamente en tu configuracion, o correr directamente
como nix run.

Si no usas nix la podes clonar como cualquier configuracion, el wrapper de nixcats se asegura de que ambos enfoques
van a funcionar.

Para cuando iniciamos en un ambiente de nix los paquetes ya obtenidos por nix no van a ser descargados por lazy, pero incluso funciona
si no lo incluimos con nix lazy los va a descargar.
