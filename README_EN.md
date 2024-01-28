# **fas-rs extension template**

- [简体中文](README.md)

## **Introduction**

- This repository is a template repository for the extension system of the project [`fas-rs`](https://github.com/shadow3aaa/fas-rs).
- This repository is also a template repository for the `magisk/ksu` module, because the `fas-rs` extension is recommended to exist as a stand-alone module

## **Use**

- The standard of the `magisk/ksu` module can refer to the [Magisk Official Description](https://magisk.readthedocs.io/en/latest/developers/guides.html), the module template of this repository is ready to use out of the box, if there is no special need to modify the module name and [callbacks.lua](callbacks.lua).
- The code that the extension is actually called by fas-rs should be all written in [callbacks.lua](callbacks.lua).
- [callbacks.lua](callbacks.lua) is self-documented and contains instructions on how to write extension scripts
- Remember to change module/module.prop to change the module name > module id
- Run bash ./package.sh to package the module, which is located in the output folder after packaging
- ps: You can check the output of```getprop fas-rs-installed```to confirm if the user has installed `fas-rs`

## **FAQ**

- Why is it recommended to develop extensions in the form of `magisk/ksu` module?
  - There are the following reasons:
  - The ID of the module is unique, so conflicts caused by duplicate names of extensions are avoided
  - Convenient for users to manage extensions
  - Easy to do dependency checking, e.g. templates refuse to install/automatically uninstall themselves when `fas-rs` is not installed

- Is it possible to create a extension in other ways/What is the most basic way to register a extension?
  - Copy the lua script with the suffix `.lua` to the `/dev/fas_rs/extensions` folder (when it appears) with the same requirements as the documentation and [callbacks.lua](callbacks.lua).
  - When deleting/creating/modifying a lua script under `/dev/fas_rs/extensions`, `fas-rs` will re-read all extension scripts, which means that the extension can be updated instantly.
