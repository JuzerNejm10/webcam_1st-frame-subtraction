# webcam_1st-frame-subtraction
obtain real-time synthetic Schlieren images/footage using your webcam

For the sake of diversity there are two versions of the code. There's no need to use both of them. They produce the same result.
The very first frame of the stream is being continuously subtracted from all the subsequent frames. The grayscale images of that differences are blurred and then displayed on the screen as a real-time synthetic Schlieren video. The first frame should contain only a suitable background image (a mask), of course.

If you wish a colorful stream, press "G" on your keyboard to turn the grayscale filter OFF (or turn it back ON if the gray is what you want).
Blur (Gaussian) can be removed by pressing the "B" key.

Live filters can be computationally heavy so if you experience an unacceptable framerate stuttering, turn them off. It's easy to apply them in any video editor afterwards.

Recording is done by pressing the "R" key. The same key pauses the recording process and, pressed once more, continues it. ESC stops the recording and exits the sketch.
Saved videos are in mp4 format.
You can take a screenshot (png) by pressing "S".

Change framerate parameter to your liking.
If you experience any difficulties let me know.


