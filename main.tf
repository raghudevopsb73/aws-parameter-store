resource "aws_ssm_parameter" "params" {
  count     = length(var.params)
  name      = var.params[count.index].name
  type      = var.params[count.index].type
  value     = var.params[count.index].value
  overwrite = true
  key_id    = "f0a71b80-90c3-4da1-a189-b4b95e9764e8"
}

variable "params" {
  default = [
    { name = "roboshop.dev.frontend.catalogue_url", value = "https://catalogue-dev.rdevopsb73.online/", type = "String" },
    { name = "roboshop.dev.frontend.user_url", value = "https://user-dev.rdevopsb73.online/", type = "String" },
    { name = "roboshop.dev.frontend.cart_url", value = "https://cart-dev.rdevopsb73.online/", type = "String" },
    { name = "roboshop.dev.frontend.payment_url", value = "https://payment-dev.rdevopsb73.online/", type = "String" },
    { name = "roboshop.dev.frontend.shipping_url", value = "https://shipping-dev.rdevopsb73.online/", type = "String" },

    { name = "roboshop.dev.cart.redis_host", value = "redis-dev.rdevopsb73.online", type = "String" },
    { name = "roboshop.dev.cart.catalogue_host", value = "catalogue-dev.rdevopsb73.online", type = "String" },
    { name = "roboshop.dev.cart.catalogue_port", value = "8080", type = "String" },

    { name = "roboshop.dev.catalogue.mongo", value = "true", type = "String" },

    { name = "roboshop.dev.payment.cart_host", value = "cart-dev.rdevopsb73.online", type = "String" },
    { name = "roboshop.dev.payment.cart_port", value = "8080", type = "String" },
    { name = "roboshop.dev.payment.user_host", value = "user-dev.rdevopsb73.online", type = "String" },
    { name = "roboshop.dev.payment.user_port", value = "8080", type = "String" },
    { name = "roboshop.dev.payment.amqp_host", value = "rabbitmq-dev.rdevopsb73.online", type = "String" },
    { name = "roboshop.dev.payment.amqp_user", value = "roboshop", type = "String" },
    { name = "roboshop.dev.shipping.cart_endpoint", value = "cart-dev.rdevopsb73.online:8080", type = "String" },
    { name = "roboshop.dev.shipping.db_host", value = "mysql-dev.rdevopsb73.online", type = "String" },
    { name = "roboshop.dev.user.mongo", value = "true", type = "String" },
    { name = "roboshop.dev.user.redis_host", value = "redis-dev.rdevopsb73.online", type = "String" },
    { name = "roboshop.dev.user.mongo_url", value = "mongodb://mongodb-dev.rdevopsb73.online:27017/users", type = "String" },
    { name = "roboshop.dev.mysql.username", value = "roboshop", type = "String" },
    { name = "roboshop.dev.docdb.username", value = "roboshop", type = "String" },
    { name = "roboshop.dev.rabbitmq.amqp_user", value = "roboshop", type = "String" },

    ### Passwords will be never part of git repos, Usually in organizations we create them nanually. Meaning whom ever have access they will provision these secrets in parameter store.
    { name = "roboshop.dev.payment.amqp_pass", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.dev.rabbitmq.amqp_pass", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.dev.mysql.password", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.dev.docdb.password", value = "roboshop123", type = "SecureString" },
    { name = "roboshop.dev.catalogue.mongo_url", value = "mongodb://roboshop:roboshop123@docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com:27017/catalogue?tls=true&replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false", type = "SecureString" },
    { name = "roboshop.dev.catalogue.docdb_endpoint", value = "docdb-dev.cluster-cbvsbeoyxek4.us-east-1.docdb.amazonaws.com", type = "String" },

  ]
}

