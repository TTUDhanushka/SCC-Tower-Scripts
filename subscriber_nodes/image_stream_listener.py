import cv2
import ffmpeg

    # cap = cv2.VideoCapture('rstp://admin:Admin123@192.168.1.209:554/11')

video_format = "flv"
server_url = 'rtsp://admin:Admin123@192.168.1.209:554/path'

def start_streaming(height, width, fps):
    process = (
        ffmpeg
        .input(
            'pipe:', 
            format='rawvideo', 
            codec = "rawvideo", 
            pix_fmt='bgr24', 
            s='{}x{}'.format(width, height))
        .output(
            server_url,
            listen= 1,
            pix_fmt="yuv420p",
            preset="ultrafast",
            f=video_format)
        .overwrite_output()
        .run_async(pipe_stdin=True)
    )
    return process

def init_capture():
    # cap = cv2.VideoCapture(0)
    cap = cv2.VideoCapture(server_url, cv2.CAP_FFMPEG)
    height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
    width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
    return cap, height, width

def main():
    cap, height, width = init_capture()

    while(cap.isOpened):
        print(f'Cap running')

        fps = cap.get(cv2.CAP_PROP_FPS)
        # streaming_process = start_streaming(height, width, fps)
        ret, frame = cap.read()

        # h, w, c = frame.shape
        h = 10
        w = 10
        if (h > 0) and (w > 0):
            cv2.imshow('frame', frame)
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
        else:
            print("Image size invalid")
            break

    cap.release()
    cv2.destroyAllWindows()

if __name__=="__main__":
    main()
