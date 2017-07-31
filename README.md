# dew_set

## 开发

### 创建初始化数据
```ruby
# 创建.env文件通过.env.sample
rails init:dotenv
# 创建database.yml文件通过database.yml.sample
rails init:database
# 创建数据库
rails db:setup
# 创建数据表
rails db:migrate
```

### 运行guard服务
```ruby
guard
```
