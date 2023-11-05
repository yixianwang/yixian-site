+++
title = 'System Design'
date = 2023-03-01T11:26:17-04:00
+++

Covered topics of system design
<!--more-->

## 4S analysis
- Scenario 场景
    - 说人话：需要设计哪些功能，设计得多牛
    - Ask/ Features/ QPS/ DAU/ Interfaces
        具体场景有哪些
        实际需求有什么
        详细流程怎么样
- Service 服务
    - 说人话：将大系统拆分为小服务
    - Split/ Application/ Module
        单体架构 X
        or 微服务 V
- Storage 存储
    - 说人话：数据如何存储与访问
    - Schema/ Data/ SQL/ NoSQL/ File System
        数据如何存储与访问
            1.select 为每个Service 选择存储结构
            2.Schema 细化表结构
    Note: 分布式事务distributed transaction
- Scale 升级
    - 说人话：解决缺陷，处理可能遇到的问题
    - Sharding/ Optimize/ Special Case
        如何优化系统
        加分项


Flash Sale & Booking System Design

    场景1：0点开始，限量100台，一人限购一台
    场景2: 微信抢红包














