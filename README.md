```sh
sudo apt install -y libcairo2-dev pkg-config python3-dev libsdl-pango-dev
pip install -r requirements.txt
```
日本語(IPAGothic)が必要なら
```sh
sudo apt install fonts-ipafont
```

REPOSITORY_ROOT/src/chime.mp3にチャイム音の音声ファイルが必要。  
(ライセンスの関係でリポジトリに入れていないので各自入手されたし。)  
[OtoLogic](https://otologic.jp/free/se/school_bell01.html)とかおすすめ。  

以下のコマンドで生成
```sh
manim manim.py -qm GrowingRectWithTimer
```
