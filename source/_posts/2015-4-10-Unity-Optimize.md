---
date: 2015-4-10 10:20
layout: post
title: Unity项目优化
category: unity
tags:
  - Unity
---

#### 1. 如果没必要每帧都处理的话，可以隔几帧再处理

    void Update()
    {
        if(Time.frameCount%6==0)
        {
            DoSomething();
        }
    }

#### 2. 定时重复调用可以使用InvokeRepeating函数实现，比如，启动0.5秒后每隔1秒执行一次 DoSomeThing 函数

    void Start()
    {
        InvokeRepeating("DoSomeThing", 0.5f, 1.0f);
    }

#### 3. 少使用临时变量，特别是在Update OnGUI等实时调用的函数中

#### 4. 主动进行垃圾回收

#### 5. 优化数学运算，尽量避免使用float，而使用int，特别是在Update函数中，尽量少用复杂的数学函数，比如sin,cos等函数。改除法为乘法

#### 6. 压缩 Mesh

导入 3D 模型之后，在不影响显示效果的前提下，最好打开 Mesh Compression。  Off, Low, Medium, High 这几个选项，可酌情选取。对于单个Mesh最好使用一个材质。

#### 7. 运行时尽量减少 Tris 和 Draw Calls

预览的时候，可点开 Stats，查看图形渲染的开销情况。特别注意 Tris 和 Draw Calls 这两个参数。  一般来说，要做到：  Tris 保持在 7.5k 以下  ，Draw Calls 保持在 35 以下。

#### 8. 避免大量使用 Unity 自带的 Sphere 等内建 Mesh

Unity 内建的 Mesh，多边形的数量比较大，如果物体不要求特别圆滑，可导入其他的简单3D模型代替。

#### 9. 不要使用SendMessage之类的方法，他比直接调用方法慢了100倍，你可以直接调用或通过C#的委托来实现

#### 10. 使用javascript或Boo语言时，你最好确定变量的类型，不要使用动态类型，这样会降低效率，你可以在脚本开头使用#pragmastrict 来检查，这样当你编译你的游戏时就不会出现莫名其妙的错误了

#### 11. 协同是一个好方法。可以使用协同程序来代替不必每帧都执行的方法。（还有InvokeRepeating方法也是一个好的取代Update的方法）

#### 12. 引用一个游戏对象的组件

有人可能会这样写someGameObject.transform，gameObject.rigidbody.transform.gameObject.rigidbody.transform，但是这样做了一些不必要的工作，你可以在最开始的地方引用它，像这样：
        
    private Transform myTrans;
    void Start()
    {
        myTrans=someGameObject.transform;
    }
    
#### 13. 关掉不必要的脚本

如果可能，将GameObject上不必要的脚本disable掉。如果你有一个大的场景在你的游戏中，并且敌方的位置在数千米意外，这是你可以disable你的敌方AI脚本直到它们接近摄像机为止。一个好的途径来开启或关闭GameObject是使用SetActiveRecursively(false），并且球形或盒型碰撞器设为trigger

#### 14. 删除空的Update方法。当通过Assets目录创建新的脚本时，脚本里会包括一个Update方法，当你不使用时删除它


#### - Unity3d的一些小窍门

防止黑屏
In script change iPhoneSettings.screenCanDarken to false. This basically does the same as:
//Objective-C call [UIApplication sharedApplication].idleTimerDisabled = YES;
It prevents the auto lock on iPhone to kick-in.
参考：

1.http://www.cnblogs.com/veboys/p/4091527.html

2.http://forum.china.unity3d.com/thread-570-1-1.html
