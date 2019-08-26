# 网上销售系统
## 1.数据库设计
### 1.1.需求分析
#### 1.1.1.系统功能划分及其说明
网上销售系统要求提供包括商品信息管理、查询、订购、销售等功能的网上交易平台，对买家和卖家应提供不同的操作界面和使用权限。

1. 买家和卖家都可以看成是用户，所以对于所有用户而言，有以下功能模块：
    1. 注册：增加一名用户；  
    2. 登录：包括登录和退出；
    3. 用户信息管理：查询和修改用户信息；
    4. 余额管理：包括查询、充值和转账三个功能；
    5. 账单管理：记录用户的充值，购买、销售和转账等和资金流动有关的信息。用户可以查询和删除账单。   
2. 对于买家而言，有以下额外的功能模块：
    1. 商品查询：用户可以通过多种方式查询并且挑选网上商店出售的商品，通过在网上填写并确认订单的方式来购买商品。  
    2. 购物车管理：存放买家想买又没有决定买的商品。买家可以添加商品到购物车，删除购物车中的商品，购买购物车中的商品。  
    3. 买家订单管理：买家可查询和修改买家订单状态。  
3. 对于卖家而言，有以下额外的功能模块：
    1. 商店管理：开店，修改商店信息，删除商店；
    2. 商品管理：添加商品，修改商品信息，删除商品；
    3. 卖家订单管理：查看和修改订单状态。
#### 1.1.2.核心业务的业务流程图
本系统的核心业务是购物，购物的业务流程图如图3.1所示。  
![图3.1 购物的业务流程图](https://github.com/wangxinxinx/e_shopping/blob/master/images/3.1.png)

#### 1.1.4.数据流说明
分析得，该系统的数据流图如图3.2所示。
![图3.2 网上销售系统的数据流图](https://github.com/wangxinxinx/e_shopping/blob/master/images/3.2.png)  

### 1.2.概念设计
由需求分析可得该系统的E-R图如图3.3所示，由于属性较多，就没有在E-R图中画出属性。
![图3.3 网上销售系统的E-R图](https://github.com/wangxinxinx/e_shopping/blob/master/images/3.3.png)


## 2.系统总体设计
系统总体设计依据需求分析的结果提出系统的总体规划方案，从而为后续的详细设计提供合理的框架与环境。
### 2.1.系统模块划分方案
系统功能模块图如图4.1所示。
![图4.1 系统功能模块图](https://github.com/wangxinxinx/e_shopping/blob/master/images/4.1.png)


### 2.3.系统的开发与运行环境
IDE:eclipse  
web服务器：tomcat8  
前端：jsp  
后端：java  
数据库：mysql  

## 3.测试与分析
### 3.1.注册
用户注册界面如图6.1所示。先注册3个用户，以下测试中设定buy为买家，sell和sell2为卖家。然后手工录入一些数据，每个表的数据如图6.2-6.7所示，product表有32条记录，没有全部展现出来。

![图6.2 shop表数据](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.1.png)


![图6.3 user表数据](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.3.png)


![图6.4 indent表数据](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.4.png)


![图6.5 product表数据](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.5.png)


![图6.6 cart表数据](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.6.png)


![图6.7 bill表数据](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.7.png)


### 3.2.登录
登录界面如图6.8所示。buy用户登录后，商城主界面如图6.9所示。  
![图6.8 登录界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.8.png)


![图6.9 商城主界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.9.png)


### 3.3.用户模块
用户模块的下拉菜单如图6.10所示。个人资料界面如图6.11所示。修改密码界面如图6.12所示。已买到的商品界面如图6.13所示。购物车界面如图6.14所示。点退出后，主菜单如图6.15所示。
![图6.10 用户模块下拉菜单](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.10.png)

![图6.11 个人资料界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.11.png)

![图6.12 修改密码界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.12.png)

![图6.13 已买到的商品界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.13.png)

![图6.14 购物车界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.14.png)

![图6.15 用户退出后的菜单](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.15.png)

### 3.4.账户管理
账户管理模块的下拉菜单如图6.16所示。我的余额界面如图6.17所示。转账界面如图6.18所示。充值界面如图6.19所示。我的账单界面如图6.20所示。
![图6.16 账户管理模块下拉菜单](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.16.png)

![图6.17 我的余额界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.17.png)

![图6.18 转账界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.18.png)


![图6.19 充值界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.19.png)

![图6.20 我的账单界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.20.png)

### 3.5.卖家中心
先退出登录，然后sell用户登录。
卖家中心模块的下拉菜单如图6.21所示。我要开店界面如图6.22所示。我的商店界面如图6.23所示，从该界面点击进入商店进入商店主界面如图6.24所示。在商店主界面左侧点击编辑即可编辑商店信息，商店信息编辑界面如图6.25所示。在商店主界面点击添加商品，添加商品界面如图6.26所示。每个商品右侧可以选择编辑或删除，编辑商品界面如图6.27所示。订单管理界面如图6.28所示。
![图6.21 卖家中心模块的下拉菜单](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.21.png)

![图6.22 我要开店界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.22.png)


![图6.23 我的商店界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.23.png)

![图6.24 进入商店界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.24.png)


![图6.25 编辑商店界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.25.png)

![图6.26 添加商品界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.26.png)

![图6.27 编辑商品界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.27.png)

![图6.28 订单管理界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.28.png)

### 3.6.购物流程测试
买家在搜索框中输入“衬衫”，搜索得到的结果如图6.29所示，点击购买，购买界面如图6.30所示，再查看待发货的商品，如图6.31所示。卖家查看订单中待发货的商品，如图6.32所示，点击发货，出现买家的信息，如图6.33所示，卖家可根据买家信息给买家发货，点击确认发货，再查看已发货的商品如图6.34所示。买家查看已发货的商品如图6.35所示，买家收到商品后，点击确认收货，再查看交易成功的商品如图6.36所示。卖家查看交易成功的商品如图6.37所示。若买家对买到的商品不满意，可点击请求退款，查看退款中的商品如图6.38所示。卖家查看请求退款的商品如图6.39所示，卖家选择接受退款。买家查看交易取消的商品如图6.40所示，点击删除，即可删除该订单，如图6.41所示。最后查看买家和卖家在经过这些操作之后的账单如图6.42和6.43所示。

![图6.29 商城主界面的搜索功能](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.29.png)

![图6.30 购买商品界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.30.png)

![图6.31买家查看待发货的商品](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.31.png)

![图6.32 卖家查看待发货的商品](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.32.png)

![图6.33 卖家查看买家信息](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.33.png)

![图6.34 卖家查看已发货的商品](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.34.png)

![图6.35 买家查看已发货的商品](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.35.png)

![图6.36 买家查看交易成功的商品](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.36.png)

![图6.37 卖家查看交易成功的商品](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.37.png)

![图6.38 买家查看退款中的商品](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.38.png)

![图6.39 卖家查看请求退款的商品](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.39.png)

![图6.40 买家查看交易取消的商品](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.40.png)

![图6.41 买家删除订单后的界面](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.41.png)

![图6.42 卖家账单](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.42.png)

![图6.43 买家订单](https://github.com/wangxinxinx/e_shopping/blob/master/images/6.43.png)

