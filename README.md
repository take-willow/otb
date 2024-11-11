1.概要
2次元の系において、装置外縁に取り付けられた磁石の作る磁場を計算するプログラム

2.使用方法
ルートディレクトリのおいてmakeコマンドを実行することで実行ファイルotb.exeが生成されます。
実行後にはresultフォルダ内に結果が出力され、./visualise.shを用いることで結果を画像化することができます。

3.注釈
・PICで用いる際にはスケーリングや磁場の規格化等を追加で考慮する必要があります。
・電流素片を壁と同一のx座標にした場合近隣グリッドにおいて磁場が大きくなりすぎるため、
電流素片のx座標を壁からdx/2だけずらしています。
