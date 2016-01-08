---
date: 2014-12-11 14:26
layout: post
title: C#命名规则
category: coding
tags:
  - C#
  - 规范
---

#### 1. 用Pascal规则来命名方法和类。

    public class DataGrid 
    { 
      public void DataBind() 
      { 
      } 
    } 

#### 2. private、protected以及方法参数使用 Camel，public使用Pascal(变量尽量使用属性).

    public class Product 
    { 
      public string ProductUrl;
      private string _productId; 
      protected string _productName; 
      public void AddProduct(string productId,string productName) 
      { 
      } 
    } 
    
#### 3. 接口的名称加前缀 “I”。

    public interface IConvertible 
    { 
      byte ToByte(); 
    } 
    
#### 4. 方法注释///

    /// <summary>
    /// 
    /// </summary>

#### 5. 自定义的属性以“Attribute”结尾。

    public class TableAttribute:Attribute 
    { 
    } 
    
#### 6. 自定义的异常以Exception结尾。

    public class NullEmptyException:Exception 
    { 
    } 
    
#### 7. 方法的命名。一般将其命名为动宾短语。

    public class File 
    { 
      public void CreateFile(string filePath) 
      { 
      } 
      public void GetPath(string path) 
      { 
      } 
    } 
    
#### 8. 局部变量的名称要有意义。 不要用x，y，z等等，用For循环变量中可使用i, j, k, l, m, n。

    public class User 
    { 
      public void GetUser() 
      { 
        string[] userIds={"ziv","zorywa","zlh"}; 
        for(int i=0,k=userIds.Length;i<k;i++) 
        { 
        } 
      } 
    } 
    
#### 9. 所有的成员变量声明在类的顶端。

    public class Product 
    { 
      private string _productId; 
      private string _productName; 
      public void AddProduct(string productId,string productName) 
      { 
      } 
    } 
    
#### 10. 用有意义的名字命名namespace，如：公司名、产品名。

    namespace Zivsoft//公司命名 
    { 
    } 
    namespace ERP//产品命名 
    { 
    } 
    
#### 11． 建议局部变量在最接近使用它时再声明。

#### 12. 使用某个控件的值时，尽量命名局部变量。

    public string GetTitle() 
    { 
      string title=lbl_Title.Text; 
      return title; 
    } 
    
#### 14. 把引用的系统的namespace和自定义或第三方的用一个换行把它们分开。

    using System; 
    using System.Web.UI; 
    using System.Windows.Forms; 
    using CSharpCode; 
    using CSharpCode.Style; 
    
#### 15. 文件名要能反应类的内容，最好是和类同名，一个文件中一个类或一组关连类。

#### 16. 目录结构中要反应出namespace的层次。

#### 17. 大括号"{"要新起一行。

    public Sample() 
    { 
    // 
    // TODO: 在此处添加构造函数逻辑 
    // 
    }
    
    
#### 18. 代码块控制 \#region  \#endregion #### 
