
![GitHub repo size](https://img.shields.io/github/repo-size/mg0x7BE/ilasm-project-template)
![GitHub License](https://img.shields.io/github/license/mg0x7BE/ilasm-project-template)
![GitHub Created At](https://img.shields.io/github/created-at/mg0x7BE/ilasm-project-template)
![GitHub forks](https://img.shields.io/github/forks/mg0x7BE/ilasm-project-template)
![GitHub Repo stars](https://img.shields.io/github/stars/mg0x7BE/ilasm-project-template)

# ilasm-project-template

This repository is a proof-of-concept and starter template. Its purpose is to demonstrate a minimal setup for compiling raw .NET IL (`.il`) code directly using `ilasm` (the .NET IL Assembler).

This project **bypasses the C# compiler (`csc`)** and relies solely on custom MSBuild targets to fetch `ilasm` and build the executable.

The `primespeed.il` file (a simple prime number finder) is included as an example.

## How to Use

1. [Download](https://dotnet.microsoft.com/en-us/download) and install .NET on Linux / macOS / Windows 
2. Run the following commands
```
git clone https://github.com/mg0x7BE/ilasm-project-template.git
cd ilasm-project-template
dotnet restore
dotnet build
```
3. Run the the program

The compiled executable will be in the `bin` directory (the exact path depends on .NET version).

```PowerShell
cd bin
cd net10.0
.\primespeed.exe
```
