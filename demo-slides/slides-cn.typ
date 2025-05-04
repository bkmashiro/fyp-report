#import "@preview/touying:0.6.1": *
#import themes.simple: *

#show: simple-theme.with(aspect-ratio: "16-9")

= SnapSphere

== 项目概述

=== 什么是SnapSphere

SnapSphere: 沉浸式照片体验

- 移动应用 + Web管理界面 + 后端服务
- 在增强现实(AR)环境中捕获和查看照片
- 用户可以发送评论和点赞
- Web界面用于管理场景和照片
- 提供RESTful和WebSocket API

=== 系统概念图

#figure(caption: "系统概念图")[
  #image("../images/demo/demo.png", width: 70%)
]

== 技术栈

=== 移动端

- Unity 6.0 + AR Foundation
- 使用C井语言开发
- ARCore (Android) / ARKit (iOS)
- 支持跨平台AR功能
- 云锚点(Cloud Anchor)集成
- 空间内容管理
- 实时用户交互

=== 前端

- Nuxt.js 3
- TypeScript
- Tailwind CSS
- Vue 3 with Composition API
- 服务器端渲染(SSR)
- 响应式设计
- 页面过渡动画

=== 后端

- NestJS
- TypeScript
- PostgreSQL (支持PostGIS空间数据)
- Redis
- Cloudflare、AWS、Google Cloud
- Hedera Hashgraph (区块链平台)
- RESTful API + WebSocket

== 关键技术实现

=== 云锚点 (Cloud Anchor)

- 固定在空间中的点，保持虚拟对象位置一致
- 捕捉本地环境特征（深度和颜色信息）
- 不依赖GPS，使用环境的独特视觉特征
- 定位精度误差小于10厘米
- 支持多用户在同一物理空间体验AR内容

=== 相对定位

- 室内环境下达到分米级精度
- 使用云锚点作为坐标系的原点(0,0,0)
- 建立独立于全球坐标的本地参考系
- 支持复杂的多用户交互
- 通过矩阵运算实现变换

=== 不可见水印

水印嵌入过程:
1. 颜色空间转换(RGB到YUV)
2. 多分辨率分析(DWT)
3. 基于块的处理(DCT)
4. 安全性和嵌入(SVD)
5. 重建

#figure(caption: "嵌入过程几乎不可见")[
  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    image("../images/p-hash/cat.jpg", width: 100%),
    image("../images/p-hash/cat_embed.png", width: 100%),
  )
]

=== 基于区块链的版权保护

#figure(caption: "区块链版权保护流程")[
  #image("../images/diagrams/blockchain-copyright-v1.svg", width: 90%)
]

关键特点:
- 隐私保护：原始图像不存储在链上
- 防篡改：不可变的所有权记录
- 高效验证：缓存快速所有权检查
- 分散存储：所有权记录存储在区块链上

=== 图像相似度搜索

感知哈希(Perceptual Hashing):
- 将图像哈希为固定长度的指纹
- 对常见的图像处理操作具有鲁棒性
- 相似图像具有相似的哈希值

图像相似度计算:
- 为每个图像生成64位哈希值
- 计算两个哈希值之间的汉明距离
- 距离越小，图像越相似
- 84%阈值判断图像相似性
- 92%阈值判断图像为副本

=== 零知识证明(ZKP)

- 允许一方向另一方证明语句为真，而不泄露额外信息
- 完整性：正确的签名和艺术哈希可生成有效证明
- 零知识特性：证明不会泄露签名哈希和艺术哈希
- 实用性：固定的证明大小，适用于区块链环境

== 系统特点

=== 移动应用

主要功能:
- 扫描和托管云锚点
- 查看AR内容
- 创建3D对象(照片和评论)
- 编辑3D对象(平移、旋转、缩放)

=== Web管理界面

主要功能:
- 用户登录/注册
- 场景管理
- 云锚点管理
- 照片管理
- 评论管理
- 标签管理
- 验证图像版权
- 零知识证明

=== 安全与隐私

- JWT身份验证
- 基于角色和属性的访问控制
- 区块链不可变记录
- 不可见水印技术
- 零知识证明
- 端到端加密
- 数据分区

== 总结

=== 项目成果

主要成就:
1. 创新技术集成
   - 无缝AR体验
   - 基于区块链的版权保护
   - 先进的不可见水印系统
   - 高效图像相似度搜索

2. 安全性和隐私性
   - 零知识证明实现
   - 防篡改内容保护
   - 隐私保护验证
   - 安全数据管理

3. 用户体验
   - 直观的AR交互
   - 响应式Web界面
   - 跨平台兼容性
   - 实时社交功能

=== 谢谢

感谢您的关注!

项目资源:
- 前端: https://github.com/bkmashiro/fyp-next
- 后端: https://github.com/bkmashiro/fyp-backend
- 演示应用: https://github.com/bkmashiro/fyp-next-unity
- 落地页: https://fl.yuzhes.com
- 产品演示: https://fyp.yuzhes.com
- 报告: https://github.com/bkmashiro/fyp-report
