<template>
  <div>
    <header-nav />
    <div class="d-flex justify-center login-container">
      <v-card width="350px" height="500px" elevation="5" class="ma-10"
        ><div class="login-header">LOGIN</div>
        <div class="pr-8 pl-8">
          <v-text-field
            v-model="user.userId"
            height="50px"
            placeholder="Id"
            filled
            rounded
            dense
            color="success"
          ></v-text-field>
          <v-text-field
            type="password"
            v-model="user.userPw"
            height="50px"
            placeholder="Password"
            filled
            rounded
            dense
            color="success"
          ></v-text-field>
        </div>
        <v-card-actions class="pr-8 pl-8 pb-8">
          <v-btn
            @click="userCheck"
            height="50px"
            width="100%"
            color="#019689"
            rounded
            class="white--text"
            >로그인</v-btn
          >
        </v-card-actions>
        <div class="text-center menu-btn">
          아이디 저장 |
          <router-link :to="{ name: 'Signup' }">회원가입</router-link> |
          <router-link :to="{ name: 'FindPw' }">비밀번호 찾기</router-link>
        </div>
      </v-card>
    </div>
  </div>
</template>
<script>
import { mapState, mapActions, mapMutations } from "vuex";
import HeaderNav from "../components/layout/HeaderNav.vue";
export default {
  name: "Login",
  components: {
    HeaderNav,
  },
  data() {
    return {
      user: {
        userId: null,
        userPw: null,
      },
    };
  },
  computed: {
    ...mapState("userStore", ["isLogin", "userInfo"]),
  },
  methods: {
    ...mapActions("userStore", ["userLogin", "getUserInfo"]),
    ...mapMutations("userStore", ["USER_LOGIN"]),
    ...mapActions("interestStore", ["getInterestHouse", "getInterestAreaUser"]),
    async userCheck() {
      await this.userLogin(this.user);

      if (this.isLogin) {
        await this.getUserInfo(this.user.userId);
        await this.getInterestHouse(this.user.userId);
        await this.getInterestAreaUser(this.user.userId);
        this.$router.push({ name: "Index" });
      } else {
        alert("아이디와 비밀번호를 확인해주세요");
        this.USER_LOGIN(false);
      }
    },
  },
};
</script>

<style scoped>
.menu-btn a {
  text-decoration: none;
  color: black;
}
.login-container {
  margin: 50px 0;
}
.login-header {
  padding: 60px 0 50px 0;
  text-align: center;
  font-size: 22px;
  font-weight: bold;
  color: #019689;
}
</style>
