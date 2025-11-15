
![GitHub repo size](https://img.shields.io/github/repo-size/mg0x7BE/ilasm-project-template)
![GitHub License](https://img.shields.io/github/license/mg0x7BE/ilasm-project-template)
![GitHub Created At](https://img.shields.io/github/created-at/mg0x7BE/ilasm-project-template)
![GitHub forks](https://img.shields.io/github/forks/mg0x7BE/ilasm-project-template)
![GitHub Repo stars](https://img.shields.io/github/stars/mg0x7BE/ilasm-project-template)

# About

This repository is a proof-of-concept and starter template. Its purpose is to demonstrate a minimal setup for compiling raw .NET IL (`.il`) code.

The `primespeed.il` file (a simple prime number finder) is included as an example.

## How to use

1. [Download](https://dotnet.microsoft.com/en-us/download) and install .NET on Linux / macOS / Windows 
2. Clone this repository
```
git clone https://github.com/mg0x7BE/ilasm-project-template.git

cd ilasm-project-template
```
3. Run `dotnet build` or `dotnet publish`
4. Locate the executable file and run it
```
cd bin/Release/net10.0/osx-arm64/publish/

./primespeed
```
<img width="886" height="608" alt="image" src="https://github.com/user-attachments/assets/b6a25989-7927-41f4-ba88-6769a8931be0" />

