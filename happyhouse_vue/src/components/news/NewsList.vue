<template>
  <div>
    <v-container class="text-center mt-8">
      <h2>부동산 관련 뉴스</h2>
    </v-container>
    <div class="d-flex justify-center mt-8">
      <v-card max-width="660px" elevation="5">
        <v-list three-line class="news_list">
          <div v-for="(article, index) in news" :key="index">
            <news-list-row
              :article="article"
              :num="index"
              :detailLink="detailLink[index]"
            >
            </news-list-row>

            <v-divider
              v-if="index != news.length - 1"
              :key="index"
              inset
            ></v-divider>
          </div>
        </v-list>
      </v-card>
    </div>
  </div>
</template>

<script>
import NewsListRow from "@/components/news/NewsListRow.vue";
import http from "@/util/http-common.js";
export default {
  name: "NewsList",
  components: {
    NewsListRow,
  },
  data() {
    return {
      news: [],
      detailLink: [],
    };
  },
  created() {
    http
      .get("/news/list", {})
      .then((response) => {
        this.news = response.data.news;
        this.detailLink = response.data.detailLink;
      })
      .catch((error) => {
        console.log(error);
      });
  },
  computed: {
    // ...mapState(dealStore, ["houses", "avgPrice"]),
    // // houses() {
    // //   return this.$store.state.houses;
    // // },
  },
};
</script>

<style>
.news_list {
  display: block;
  list-style-type: disc;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  padding-inline-start: 40px;
  font-family: "Helvetica Neue", "Apple SD Gothic Neo", "Malgun Gothic",
    "맑은 고딕", Dotum, "돋움", sans-serif;
  font-size: 13px;
  letter-spacing: -1px;
  line-height: 24px;
  margin: 0;
  padding: 0;

  text-align: left;
  border-collapse: separate;
  text-indent: initial;
  border-spacing: 2px;
}
</style>
