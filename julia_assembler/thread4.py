try:
    start_thread()
except (KeyboardInterrupt, SystemExit):
    cleanup_stop_thread()
    sys.exit()
