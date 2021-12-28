; ModuleID = '/tmp/vincent/spirBinaryTempFile.tmp'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024"
target triple = "spir-unknown-unknown"

define spir_kernel void @sum(i32 %size, float addrspace(1)* %vec1, float addrspace(1)* %vec2) nounwind {
  %1 = alloca i32, align 4
  %2 = alloca float addrspace(1)*, align 4
  %3 = alloca float addrspace(1)*, align 4
  %ii = alloca i32, align 4
  store i32 %size, i32* %1, align 4
  store float addrspace(1)* %vec1, float addrspace(1)** %2, align 4
  store float addrspace(1)* %vec2, float addrspace(1)** %3, align 4
  %4 = call spir_func i64 @_Z13get_global_idj(i32 0) nounwind readnone
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %ii, align 4
  %6 = load i32* %ii, align 4
  %7 = load i32* %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %19

; <label>:9                                       ; preds = %0
  %10 = load i32* %ii, align 4
  %11 = load float addrspace(1)** %2, align 4
  %12 = getelementptr inbounds float addrspace(1)* %11, i32 %10
  %13 = load float addrspace(1)* %12, align 4
  %14 = load i32* %ii, align 4
  %15 = load float addrspace(1)** %3, align 4
  %16 = getelementptr inbounds float addrspace(1)* %15, i32 %14
  %17 = load float addrspace(1)* %16, align 4
  %18 = fadd float %17, %13
  store float %18, float addrspace(1)* %16, align 4
  br label %19

; <label>:19                                      ; preds = %9, %0
  ret void
}

declare spir_func i64 @_Z13get_global_idj(i32) nounwind readnone

!opencl.kernels = !{!0}
!opencl.enable.FP_CONTRACT = !{}
!opencl.spir.version = !{!6}
!opencl.ocl.version = !{!7}
!opencl.used.extensions = !{!8}
!opencl.used.optional.core.features = !{!8}
!opencl.compiler.options = !{!8}

!0 = metadata !{void (i32, float addrspace(1)*, float addrspace(1)*)* @sum, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"float*", metadata !"float*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !"const", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"size", metadata !"vec1", metadata !"vec2"}
!6 = metadata !{i32 1, i32 0}
!7 = metadata !{i32 0, i32 0}
!8 = metadata !{}

