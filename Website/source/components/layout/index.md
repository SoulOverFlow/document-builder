# Layout组件-`<Layout/>`
该组件用来作为整个页面其他元素的容器，可以自动适应不同的浏览器、 屏幕尺寸和设备。

## 描述
Layout组件可以根据用户窗口大小的改变来实时调整布局的大小，组件的设计参考了行（row）和列（col）的概念来定义信息区块的框架，以保证页面的每个区域能够稳健地排布起来，同时便于用户理解。使用时有几点需要注意：

- 组件定义的行（Row）和列（Column）可以相互嵌套,同时列（Column）也可以作为嵌套首层。
- 行（Row）可以定义属性*height*，列（Column）可以定义属性*width*，属性值可以为百分比或是像素值，注意属性值类型要保证上下文的统一（两种类型择其一）。
- 行（Row）的和列（Column）都可以定义*className*属性，增加信息区块的自定义样式。
- 你的内容应当放置于叶子区块框架（不包含其它子层框架）里面。


## API

#### Layout props

| 参数 | 说明 | 类型| 默认值 |
| --- | ---| --- | --- |
| className | 用户可以增加className属性，自定义框架样式 | String | - |
| onChange | 窗口大小发生变化的时的回调,通知用户窗口改变 | Function | - |

#### Layout.Row props
参数 | 说明 | 类型| 默认值
----|------|----|----
className | 用户可以增加className属性，自定义行样式  | String|-
height | 规定行（横向）布局的高度，属性值可以为百分比或具体的像素值，不设置此属性，高度自适应 | Function|-

#### Layout.Column props
参数 | 说明 | 类型| 默认值
----|------|----|----
className | 用户可以增加className属性，自定义行样式  | String|-
width | 规定列（竖向）布局的宽度，属性值可以为百分比或具体的像素值，不设置此属性，宽度自适应 | Function|-


## 代码演示1
#### 基础布局（后台最常用布局框架）
##### 按百分比进行布局
组件使用时，定义某一行的属性*height*或是某一列的属性*width*值为百分比，其它进行自适应布局。

```
<Layout className="" onChange={}>
    <Layout.Row height="10%">
    </Layout.Row>
    <Layout.Row>
        <Layout.Column width="20%" className="percent-content-top">
        </Layout.Column>
        <Layout.Column className="percent-content-content">
        <!--内容区-->
        </Layout.Column>
    </Layout.Row>
</Layout>
```
##### 按像素值布局
组件使用时，定义某一行的属性*height*或是某一列的属性*width*值为具体像素值，其它进行自适应布局。

```
<Layout className="" onChange={}>
    <Layout.Row height="45px" className="percent-top">
    </Layout.Row>
    <Layout.Row>
     <Layout.Column width="20%" className="percent-content-top">
        </Layout.Column>
        <Layout.Column className="percent-content-content">
        <!--内容区-->
        </Layout.Column>
    </Layout.Row>
</Layout>
```
## 代码演示2
行为直接嵌套首层的复杂布局,此示例传入的*width*与*height*属性值为像素值。

```
<Layout>
    <Layout.Row height="200px" className="top">
    </Layout.Row>
    <Layout.Row className="middle"></Layout.Row>
    <Layout.Row className="content">
        <Layout.Column width="150px" className="content-top">
        </Layout.Column>
        <Layout.Column className="content-middle"></Layout.Column>
        <Layout.Column className="content-bottom"></Layout.Column>
    </Layout.Row>
    <Layout.Row height="100px" className="bottom"></Layout.Row>
</Layout>
```
## 代码演示3
列为直接嵌套首层的复杂布局，此示例传入的*width*与*height*属性值为百分比。

```
<Layout>
    <Layout.Column width="25%" className="content-top">
    </Layout.Column>
    <Layout.Column className="content-middle">
        <Layout.Row height="25%" className="top">
        </Layout.Row>
        <Layout.Row className="content"></Layout.Row>
        <Layout.Row height="30%" className="bottom">
        </Layout.Row>
    </Layout.Column>
    <Layout.Column className="content-bottom"></Layout.Column>
</Layout>
```













