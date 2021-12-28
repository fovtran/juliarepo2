__precompile__()
module NumpyUnPickle
using PyCall
@pyimport numpy as np

const data = PyNULL()

    function __init__()
        py"""
        import time
        """
    end

    function loadz(filename)
        data = np.load(filename)
        return convert(PyDict, data)
    end
end
