import Pkg;
import FileWatching: watch_file

while true
  event = watch_file("src")
  if event.changed
     try
         Pkg.pkg"test"
     catch err
         @warn("Error during testing:\n$err")
     end
  end
end
