# Redis 示例命令
# 用于练习 Redis 基本操作

# =======================
# 1. String（字符串）
# =======================

# 设置键值对
SET username "zhangsan"

# 获取值
GET username

# 设置带过期时间的键（秒）
SET session:123 "logged_in" EX 7200

# 查看剩余生存时间（秒）
TTL session:123

# 自增（计数器）
INCR view_count

# 自减
DECR view_count

# =======================
# 2. Hash（哈希，对象存储）
# =======================

# 设置单个字段
HSET user:1001 name "zhangsan"

# 设置多个字段
HSET user:1001 email "zhang@example.com" age 25

# 获取单个字段
HGET user:1001 name

# 获取所有字段
HGETALL user:1001

# 获取多个指定字段
HMGET user:1001 name email

# 删除字段
HDEL user:1001 age

# 获取字段数量
HLEN user:1001

# =======================
# 3. List（列表，队列）
# =======================

# 从左侧推入（头部）
LPUSH queue "msg1" "msg2"

# 从右侧推入（尾部）
RPUSH queue "msg3" "msg4"

# 从左侧弹出（头部取出）
LPOP queue

# 从右侧弹出（尾部取出）
RPOP queue

# 获取列表长度
LLEN queue

# 获取指定范围的元素
LRANGE queue 0 -1

# =======================
# 4. Set（集合，去重）
# =======================

# 添加元素（自动去重）
SADD tags "js" "vue" "redis"

# 获取所有元素
SMEMBERS tags

# 判断元素是否存在
SISMEMBER tags "js"

# 删除元素
SREM tags "vue"

# 获取集合大小
SCARD tags

# 交集（共同好友）
SINTER follow:user1 follow:user2

# 并集（合并标签）
SUNION tags1 tags2

# 差集（A 有但 B 没有）
SDIFF tags1 tags2

# =======================
# 5. ZSet（有序集合，排行榜）
# =======================

# 添加元素（带分数）
ZADD leaderboard 100 "player1"
ZADD leaderboard 300 "player2"
ZADD leaderboard 200 "player3"

# 获取前 3 名（按分数升序）
ZRANGE leaderboard 0 2 WITHSCORES

# 获取前 3 名（按分数降序）
ZREVRANGE leaderboard 0 2 WITHSCORES

# 获取元素的排名
ZREVRANK leaderboard "player1"

# 获取元素的分数
ZSCORE leaderboard "player1"

# 删除元素
ZREM leaderboard "player3"

# 获取集合大小
ZCARD leaderboard

# =======================
# 6. 通用命令
# =======================

# 检查键是否存在
EXISTS username

# 删除键
DEL username

# 设置过期时间（秒）
EXPIRE cache:data 60

# 取消过期时间
PERSIST cache:data

# 查看键的类型
TYPE user:1001

# 列出所有键
KEYS *

# 列出匹配模式的键
KEYS user:*

# =======================
# 7. 持久化命令
# =======================

# 触发 RDB 快照（阻塞）
SAVE

# 触发 RDB 快照（后台）
BGSAVE

# 触发 AOF 重写
BGREWRITEAOF

# =======================
# 8. 事务命令
# =======================

# 开启事务
MULTI

# 执行命令（加入事务队列）
SET name "test"
INCR counter

# 提交事务
EXEC

# 取消事务
DISCARD

# =======================
# 9. 缓存场景命令
# =======================

# 缓存空结果（防穿透）
SET product:999999 "NULL" EX 60

# 互斥锁（防击穿）
SETNX product:1001_lock "1" EX 5

# 随机过期时间（防雪崩）
EXPIRE product:1001 3600
EXPIRE product:1002 3601
EXPIRE product:1003 3599

# 计数器（点赞/浏览量）
INCR article:1001:likes
INCRBY article:1001:views 10

# 分布式锁
SETNX lock:order:123 "locked" EX 30

# =======================
# 10. 集群命令
# =======================

# 查看集群信息
CLUSTER INFO

# 查看节点状态
CLUSTER NODES

# 查看槽分配
CLUSTER SLOTS

# 手动迁移槽
CLUSTER ADDSLOTS 0-5000
CLUSTER DELSLOTS 5000

# 设置从节点
CLUSTER REPLICATE <node-id>

# 故障转移（从节点提升为主）
CLUSTER FAILOVER

# 重新分片
CLUSTER MEET <ip> <port>
CLUSTER ADDSLOTS <slot>
