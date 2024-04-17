# **fas-rs extension template**

- [简体中文](README.md)

## **Introduction**

- This repository is a template repository for the extension system of the project [`fas-rs`](https://github.com/shadow3aaa/fas-rs).
- This repository is also a template repository for the `magisk/ksu` module, because the `fas-rs` extension is recommended to exist as a stand-alone module.

## **API**

- The extension script is self-documenting, check the corresponding version of `main.lua` for API description
- `fas-rs` is committed to maintain backwards compatibility. That is, even if the extension API is updated in newer `fas-rs`, the old extension can still work normally.

| extension api | Minimum fas-rs version |
| --- | --- |
| v0 (default when no api version is declared) | v2.3.0 |

## **Use**

- The standard of the `magisk/ksu` module can refer to the [Magisk Official Description](https://magisk.readthedocs.io/en/latest/developers/guides.html), the module template of this repository is ready to use out of the box, if there is no special need to modify the module name and [main.lua](main.lua).
- The code that the extension is actually called by fas-rs should be all written in [main.lua](main.lua).
- [main.lua](main.lua) is self-documented and contains instructions on how to write extension scripts.
- Remember to change module/module.prop to change the module name > module id
- Run bash ./package.sh to package the module, which is located in the output folder after packaging.
- ps: You can check the output of```getprop fas-rs-installed```to confirm if the user has installed `fas-rs`.

## **FAQ**

- Why is it recommended to develop extensions in the form of `magisk/ksu` module?
  - There are the following reasons:
  - The ID of the module is unique, so conflicts caused by duplicate names of extensions are avoided.
  - Convenient for users to manage extensions.
  - Easy to do dependency checking, e.g. templates refuse to be installed.

- Is it possible to create a extension in other ways/What is the most basic way to register a extension?
  - Copy the lua script with the suffix `.lua` to the `/dev/fas_rs/extensions` folder (when it appears) with the same requirements as the documentation and [main.lua](main.lua).
  - When deleting/creating/modifying a lua script under `/dev/fas_rs/extensions`, `fas-rs` will re-read all extension scripts, which means that the extension can be updated instantly.
