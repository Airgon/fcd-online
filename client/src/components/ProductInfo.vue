<template>
  <Card>
    <p slot="title">{{ product ? product.name : 'Просматриваемый товар' }}</p>
    <Label label="Артикул" :width="80">{{ product ? product.code : '-' }}</Label>
    <Label label="Цена" :width="80">{{ product ? product.price : '-' }} руб./шт.</Label>
    <Label label="Скидка" :width="80">{{ product ? product.discount * 100 : '-' }} %</Label>
    <Label label="Количество" :width="80">
      <Input class="ProductInfo__counter" v-model.number="amount" size="small" :disabled="!product">
          <Button slot="prepend" icon="md-remove" size="small" @click="amount--" :disabled="!product"/>
          <Button slot="append" icon="md-add" size="small" @click="amount++" :disabled="!product"/>
      </Input>
    </Label>
    <Label label="Сумма" :width="80" highlight>{{ sum }} Руб.</Label>
    <Label>
      <Button v-if="mode == 'add'" type="primary" shape="circle" @click="addNewBuy">Добавить</Button>
      <Button v-else-if ="mode == 'remove'" shape="circle" @click="">Удалить</Button>
    </Label>
  </Card>
</template>

<script>
import Buy from '../libs/Buy'

export default {
  props: {
    product: {
      type: Object,
      default: null
    },
    mode: {
      type: String,
      default: null
    }
  },
  data() {
    return {
      amount: 1
    }
  },
  computed: {
    sum() {
      return this.product
        ? (this.product.price * (1 - this.product.discount) * this.amount).toFixed(2)
        : '-'
    }
  },
  methods: {
    addNewBuy() {
      this.$emit('newBuy', new Buy(this.product, this.amount))
      this.amount = 1
    },
    removeBuy() {
      this.$emit('removeBuy', this.product)
    }
  }
}
</script>

<style>
.ProductInfo__counter input {
  text-align: center;
}
</style>
