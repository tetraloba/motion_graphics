from manim import *

class LinearRectangleExtension(Scene):
    def construct(self):
        # 1. オブジェクトの生成
        # 視認性を高めるため、塗りつぶし(fill_opacity)を設定します。
        # 伸びる前の初期状態として幅(width)を小さく設定しています。
        rect = Rectangle(
            color=BLUE,
            fill_opacity=0.8,
            height=2.0,
            width=0.5
        )

        # 初期位置を画面中央に設定
        rect.move_to(ORIGIN)

        # 画面に追加
        self.add(rect)

        # 2. アニメーションの定義
        # stretch_to_fit_width: 高さを維持したまま幅だけを変更します。
        # run_time=10: 10秒かけて実行します。
        # rate_func=linear: デフォルトのイージング(smooth)を無効化し、等速にします。
        self.play(
            rect.animate.stretch_to_fit_width(13.0),
            run_time=10,
            rate_func=linear
        )
        
        # アニメーション終了後に少し待機
        self.wait(1)