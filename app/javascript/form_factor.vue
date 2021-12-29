<template>
  <div class="field">
    <ul>
      <li v-for="(factor, index) in factors" :key="index">
        <input
          type="hidden"
          v-bind:name="`questionnaire_form[factors_attributes][${
            index + 1
          }][order]`"
          v-bind:id="`questionnaire_factors_attributes_${index + 1}_order`"
          v-bind:value="`${index + 1}`"
        />
        <label for="questionnaire_factors_attributes_0_名前">名前</label>
        <input
          type="text"
          v-bind:name="`questionnaire_form[factors_attributes][${
            index + 1
          }][name]`"
          v-bind:id="`questionnaire_factors_attributes_${index + 1}_name`"
          v-model="factors[index]"
        />
        <button
          type="button"
          v-on:click="deleteFactorForm(index)"
          v-if="index != 0"
        >
          削除
        </button>
      </li>
    </ul>
    <button type="button" v-on:click="addFactorForm()">因子を追加する</button>
  </div>
  <p>{{ this.order }}</p>
</template>

<script>
export default {
  data() {
    return {
      order: 1,
      factors: ["因子1"],
    };
  },
  methods: {
    addFactorForm() {
      this.order = this.order + 1;
      this.factors.push("因子" + this.order);
    },
    deleteFactorForm(index) {
      this.order = this.order - 1;
      this.factors.splice(index, 1);
    },
  },
};
</script>

<style scoped></style>
