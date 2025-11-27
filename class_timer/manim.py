from manim import *

DURATIONS=[2700, 600]
TITLES=["勉強の時間", "休憩の時間"]
SUBTITLES=["(45分)", "(10分)"]
COLORS=[RED, GREEN]

WIDTH=1080
HEIGHT=1920

config.pixel_width = WIDTH
config.pixel_height = HEIGHT

class GrowingRectWithTimer(Scene):
    def construct(self):
        def play_countdown(title, subtitle, duration, color, base_color):
            title_text = Text(title, font="IPAGothic", color=color, font_size=100).to_edge(UP)
            subtitle_text = Text(subtitle, font="IPAGothic", color=color, font_size=90).next_to(title_text, DOWN, buff=0.2)

            rect_base = Rectangle(
                color=base_color,
                fill_opacity=0.8,
                height=0.05,
                width=12  # 画面幅(約14.2)の大部分を占める長さ
            )

            rect_base.next_to(subtitle_text, DOWN, buff=0.5)
            rect_base.to_edge(RIGHT, buff=1.0)

            rect = Rectangle(
                color=color,
                fill_opacity=1.0,
                height=0.2,
                width=12
            )

            rect.move_to(rect_base)

            time_tracker = ValueTracker(duration)
            timer_text = always_redraw(lambda: Text(
                f"{int(time_tracker.get_value() // 60):02}:{int(time_tracker.get_value() % 60):02}", 
                font_size=150,
                color=color
            ).to_edge(DOWN, buff=0.5))

            self.add(title_text, subtitle_text, rect_base, rect, timer_text)
            self.add_sound("./src/chime.mp3")

            self.play(
                time_tracker.animate.set_value(0),
                rect.animate.stretch_to_fit_width(0, about_edge=RIGHT),
                run_time=duration,
                rate_func=linear
            )
            self.remove(title_text, subtitle_text, rect, rect_base, timer_text)

        play_countdown(TITLES[0], SUBTITLES[0], DURATIONS[0], COLORS[0], COLORS[1])
        play_countdown(TITLES[1], SUBTITLES[1], DURATIONS[1], COLORS[1], COLORS[0])

