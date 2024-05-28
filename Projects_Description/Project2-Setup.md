# Project 2 - Installing required tools

## Project 2 will require the following tools:
+ HipSTR
+ TRTools

Below is how to install each of these and test that it is working on your DataHub account.

### HipSTR
+ Download the GitHub repository
```
git clone https://github.com/HipSTR-Tool/HipSTR
```
```
cd HipSTR
```
+ Compile
```
make
```
```
./HipSTR --help
```
+ You can also add HipSTR to your path:
```
export PATH=$PATH:$HOME/bin
```
```
cp HipSTR ~/bin
```

### TRTools
+ Update pip
```
pip install --upgrade pip
```
+ Install TRTools using pip
```
pip install trtools
```
+ Add source files to the PATH
```
export PATH="$HOME/.local/bin:$PATH"
```
```
dumpSTR -h
```
