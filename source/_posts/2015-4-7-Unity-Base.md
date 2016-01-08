---
date: 2015-4-7 15:20
layout: post
title: Unity中基础知识
category: unity
tags:
  - Unity
---

#### 1. QWER(LOL)

 - Q（手性工具）1.拖拽场景 2.按住alt，旋转场景 3.鼠标滚轮缩放场景

 - W（平移工具）蓝色Z轴   绿色Y轴   红色X轴

 - E（旋转工具） 红绿蓝分别沿XYZ轴旋转

 - R（缩放工具） 红绿蓝分别缩放某一轴，黄色小方块缩放整体

#### 2. 光源

 - 点光源：照亮某一区域，有层次感

 - 方向光：照亮整体区域 ，无层次感

 - 聚光灯：凸显某块区域 ，范围较小

#### 3. 预设（prefab）

具有相同属性的物体抽象出来的一个模板，可以用面向对象中的基类来解释，把重复使用的物体作为预制件大大方便了以后的改动。
拖动物体到空预设即可创建预设

    GameObject thePrefab;
    public void Start()
    {
       GameObject instance = Instantiate(thePrefab,transform,position,transform,rotation);
    }

#### 4. 重力=添加刚体组件

#### 5. 简单计时器

    private Single myTimer = 5.0f;
    public void Update()
    {
        myTimer -= Time.deltaTime;//上一帧的延时
        if (myTimer <= 0)
            Debug.log("game over！");
    }


#### 6. 材质

工程面板创建一个material原件，将图片资源拖到此组件上，生成材质原件，将材质拖动到需要改变材质的物体上（其实可以直接拖图片到物体上，但是这样就无法设置平铺参数）

#### 7. 移动物体

朝Y方向运动

    Single speed = 1.0f;
    public void Update()
    {
        transform.Translate(new Vector3(0, 0, speed) * Time.deltaTime);
    }

#### 8. 输入检测

Update函数中输入

    if(Input.GetButtonUp("Jump"))
    {
        Debug.log("Space is hit");
    }

#### 9. 销毁物体

载入3秒后销毁名为box的物体，如果销毁自己则为Destroy(gameObject,3)即可

    Destroy(gameObject.find('box'),3);

#### 10. 施加外力(若要恒力，也可以写在update 或者按键响应中)

    public Single power = 50.0f;
    private Rigidbody rb;

    public void Start()
    {
        rb = gameObject.GetComponent<Rigidbody>();
        //载入时施加一次
        rb.AddForce(Vector3(0,0,power));
    }

参考：

1.http://blog.csdn.net/zx84289061/article/details/19127119
