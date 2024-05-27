# Project 1 Setup
## 1. Installing required tools 

### Project 1 will require the following tools: 
+ ExpansionHunter
+ REViewer
+ samtools 

Below shows how to install each of these and test that it is working on your datahub account. You’ll also need to update your PATH variable: 

```
export PATH=$PATH:$HOME/bin
```

## 2. ExpansionHunter 
+ Download the tarball with the precompiled binary:
```
wget https://github.com/Illumina/ExpansionHunter/releases/download/v5.0.0/ExpansionHunter-v5.0
```

+ Unzip:
```
tar -xzvf ExpansionHunter-v5.0.0-linux_x86_64.tar.gz
```

+ Check that it works
```
ExpansionHunter-v5.0.0-linux_x86_64/bin/ExpansionHunter --help
```

+ Optionally, copy to a place on your PATH
```
mkdir ~/bin 
cp ExpansionHunter-v5.0.0-linux_x86_64/bin/ExpansionHunter ~/bin/ 
ExpansionHunter --help
```

## 3. REViewer 
+ Download and unzip the release
```
wget https://github.com/Illumina/REViewer/releases/download/v0.2.7/REViewer-v0.2.7-linux_x86_6bgzip -d REViewer-v0.2.7-linux_x86_64.gz 
```

+ Make executable 
```
chmod +x REViewer-v0.2.7-linux_x86_64 
```

+ Test it works 
```
./REViewer-v0.2.7-linux_x86_64 
```

+ Optionally add to your PATH 
```
cp REViewer-v0.2.7-linux_x86_64 ~/bin/REViewer 
REViewer
```

## 4. Samtools 
+ Download samtools release 
```
wget https://github.com/samtools/samtools/releases/download/1.20/samtools-1.20.tar.bz2
tar -xjf samtools-1.20.tar.bz2
cd samtools-1.20 
```

+ Configure and compile 
```
./configure --prefix=$HOME 
make -j 
make install
```
