(local repl (require "lib.stdio"))

(var color [0 0 0])

(set _G.color color) ; To access from REPL

(fn love.load []
  (repl.start))

(fn love.update []
  (let [time (love.timer.getTime)
        colorize (fn [t] (/ (+ (math.sin t) 1) 2))]
    (tset color 1 (colorize time))
    (tset color 2 (colorize (+ time (* math.pi 0.667))))
    (tset color 3 (colorize (+ time (* math.pi 1.333))))))

(fn love.draw []
  (love.graphics.setBackgroundColor color))
