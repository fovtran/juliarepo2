import threading
import time

def thread_function(name):
  while True:
    print("Thread %s: starting", name)
    time.sleep(2)

x = threading.Thread(target=thread_function, args=(1,))
x.start()
