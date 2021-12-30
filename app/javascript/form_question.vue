<template lang="pug">
h2.title.is-3 因子について*
p 質問に因子が２つ以上あるときには追加ボタンを押して、入力してください
p 因子が無い場合には変更する必要はありません
.field
  ul
    li(v-for='(factor, index) in factors' :key='index')
      input(type='hidden' v-bind:name='`questionnaire_form[factors_attributes][${\
            index + 1\
          }][order]`' v-bind:id='`questionnaire_factors_attributes_${index + 1}_order`' v-bind:value='`${index + 1}`')
      label(for='questionnaire_factors_attributes_0_名前') 名前
      input(type='text' v-bind:name='`questionnaire_form[factors_attributes][${\
            index + 1\
          }][name]`' v-bind:id='`questionnaire_factors_attributes_${index + 1}_name`' v-model='factors[index]')
      button(type='button' v-on:click='deleteFactorForm(index)' v-if='index != 0')
        | 削除
  button(type='button' v-on:click='addFactorForm()') 因子を追加する
p {{ this.order }}
h2.title.is-3 尺度について
.field
  p 質問の尺度を入力してください
  input(type='number' min='0' max='1' v-model='first_scale')
  print 〜
  input(type='number' min='1' max='99' v-model='last_scale')
  p 尺度名を入力してください
  p (例:4 やや当てはまる)
  ul
    li(v-for='(scale, index) in scales' :key='index')
      label 尺度名
      p {{ scales[index].scale }}
      input(type='text' v-model='scales[index].representation')
h2.title.is-3 質問の登録
p 質問内容を入力してください
p 質問内容をすべてコピーアンドペーストもしくは入力してください。
.field
  textarea.textarea(v-model='question')
p 現在入力されている質問の数は{{ questions.length }}個です。
p 入力された質問は以下の通りです。
p
  | その質問が逆転項目（質問点数を逆にして加算する項目）のときは"逆転項目"にチェックを入れてください。
p 因子がある場合にはプルダウンから該当する因子を選択してください。
ul
  li.columns(v-for='(question, index) in questions' :key='index')
    p.column {{index +1}}問目
    p.column.is-6 {{ question }}
    p.column 逆転項目
    input.column(type='checkbox' v-bind:name="`questionnaire_form[questions_attributes][${index}][reverse]`")
    select.column(v-bind:name="`questionnaire_form[questions_attributes][${index}][factor_id]`")
      option(v-for='(factor,index) in factors' :key='index' value=index) {{factors[index]}}
    input(v-for='(scale,index) in scales' :key='scale' v-bind:value='`${scale}`' type='hidden' v-bind:name="`questionnaire_form[questions_attributes][${this.questions.indexOf(question)}][scales_attributes][${index}][scale]`")
    input(v-for='(scale,index) in scales' :key='scale' v-bind:value='`${scales[index].representation}`' type='hidden' v-bind:name="`questionnaire_form[questions_attributes][[${this.questions.indexOf(question)}][scales_attributes][${index}][representation]`")
</template>

<script>
export default {
  data() {
    return {
      order: 1,
      factors: ["因子1"],
      first_scale: 1,
      last_scale: 2,
      scales: [
        { scale: 1, representation: "尺度1" },
        { scale: 2, representation: "尺度2" },
      ],
      question: "",
      questions: "",
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
  watch: {
    first_scale: function (newFirstScale) {
      if (newFirstScale === 0) {
        for (let scale = 0; scale < this.last_scale + 1; scale++) {
          if (this.scales[scale] === undefined) {
            this.scales.push({
              scale: scale,
              representation: "尺度" + (scale + 1),
            });
          }
          this.scales[scale].scale = scale;
        }
      } else if (newFirstScale === 1) {
        for (let scale = 0; scale < this.last_scale; scale++) {
          if (this.scales[scale] === undefined) {
            this.scales.push({
              scale: scale,
              representation: "尺度" + scale,
            });
          }
          this.scales[scale].scale = scale + 1;
          if (this.scales[scale + 1]) {
            console.log(scale);
            this.scales.pop();
          }
        }
      }
    },
    last_scale: function (newLastScale, oldLastScale) {
      if (newLastScale > oldLastScale) {
        for (let time = 0; time < newLastScale - oldLastScale; time++) {
          if (this.first_scale === 0) {
            const addScaleNum = time + this.scales.length;
            this.scales.push({
              scale: addScaleNum,
              representation: "尺度" + addScaleNum,
            });
          } else if (this.first_scale === 1) {
            const addScaleNum = time + this.scales.length + 1;
            this.scales.push({
              scale: addScaleNum,
              representation: "尺度" + addScaleNum,
            });
          }
        }
      } else if (newLastScale < oldLastScale) {
        for (let time = 0; time < oldLastScale - newLastScale; time++) {
          this.scales.pop();
        }
      }
    },
    question: function (newQuestion) {
      this.questions = newQuestion.split(/ \r\n|\n|\r/);
    },
  },
};
</script>

<style scoped></style>
