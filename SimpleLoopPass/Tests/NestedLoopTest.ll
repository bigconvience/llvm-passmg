; ModuleID = './Tests/NestedLoopTest.c'
source_filename = "./Tests/NestedLoopTest.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = dso_local global [1024 x [1024 x i32]] zeroinitializer, align 16
@b = dso_local global [1024 x [1024 x i32]] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @NestedLoopTest() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  br label %3

3:                                                ; preds = %28, %0
  %4 = load i32, i32* %1, align 4
  %5 = icmp slt i32 %4, 100
  br i1 %5, label %6, label %31

6:                                                ; preds = %3
  store i32 0, i32* %2, align 4
  br label %7

7:                                                ; preds = %24, %6
  %8 = load i32, i32* %2, align 4
  %9 = icmp slt i32 %8, 100
  br i1 %9, label %10, label %27

10:                                               ; preds = %7
  %11 = load i32, i32* %1, align 4
  %12 = sub nsw i32 %11, 3
  %13 = load i32, i32* %1, align 4
  %14 = add nsw i32 %13, 3
  %15 = mul nsw i32 %12, %14
  %16 = load i32, i32* %1, align 4
  %17 = srem i32 %15, %16
  %18 = load i32, i32* %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [1024 x [1024 x i32]], [1024 x [1024 x i32]]* @a, i64 0, i64 %19
  %21 = load i32, i32* %2, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [1024 x i32], [1024 x i32]* %20, i64 0, i64 %22
  store i32 %17, i32* %23, align 4
  br label %24

24:                                               ; preds = %10
  %25 = load i32, i32* %2, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %2, align 4
  br label %7, !llvm.loop !6

27:                                               ; preds = %7
  br label %28

28:                                               ; preds = %27
  %29 = load i32, i32* %1, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %1, align 4
  br label %3, !llvm.loop !8

31:                                               ; preds = %3
  ret void
}

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
