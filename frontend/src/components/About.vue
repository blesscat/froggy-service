<template lang="pug">
el-container.page3
  transition(name="fade" @after-leave="redirect")
    el-row.about-main(type="flex" align="middle" justify="center" v-show="showMainContent")
      el-col.about-title-wrapper(:span=22)
        .about-title 公開透明。
      el-col.about-content-wrapper(:span=22)
        el-row(type="flex" align="middle" justify="center")
          el-col.noScrollbar(:span=13 :sm="24" :xs="24" style="height: 100%;")
            article
              .about-content
                span 我們都知道，這是一個已經喊了十幾年的口號，但時間過去了，政治，仍然是一件跟人心一樣複雜的事。
                br
                br
                span 市議員選舉前，我揭露了商業電視台業配新聞的真相，也開啟了「民主開箱」的這條路。
                br
                span 過去我們所認為的選民服務，可能不外乎就是一個字「喬」——搶床位、喬事情，我想問的是：民意代表的專業在哪裡？有為大眾發揮監督的功能嗎？
                br
                br
                span 這個「選服魔鏡號」是我的政見之一，只要你生活在台北市，你的意見、你覺得政府該做而沒做好、或是不知道該請誰幫忙的，都可以找我們協助。
                br
                br
                span 但，只關乎個人利益的，我們不碰；不屬於民代職權的，我們不做！
                br
                span 我的團隊會在收到案件後進行隱私處理，並在第一時間向全體市民公布：一個市議員，到底做了什麼、又應該做些什麼？
                br
                br
                span 這是「民主開箱」第一步，未來四年，我們繼續前進！
                br
            img.signImg(:src="froggySignUrl")
          el-col.hidden-xs-only(:span=10 :offset=1)
            img.froggyServantImg(:src="froggyservantUrl")
  BottomGameDialog(:title="aboutTitle")
  transition(name="fade")
    .darkBackground(v-show="showMainContent")
</template>

<script>
import BottomGameDialog from './BottomGameDialog.vue'
export default {
  name: 'About',
  components: { BottomGameDialog },
  data: function () {
    return {
      showMainContent: false,
      aboutTitle: ['「選民魔鏡號，市民看得到！」－台北市議員邱威傑市民服務系統⋯⋯'],
      froggyservantUrl: 'https://storage.googleapis.com/froggy-service/frontend/images/about/froggy_servant.png',
      froggySignUrl: 'https://storage.googleapis.com/froggy-service/frontend/images/about/froggy_sign.png'
    }
  },
  mounted () {
    this.showMainContent = true
  },
  methods: {
    toggleLeaveAnimation: function (destination) {
      this.showMainContent = false
    },
    redirect: function () {
      let direction = this.$store.state.redirectTo
      this.$router.push(direction)
    }
  },
  props: ['lorem']
}
</script>

<style lang="sass" scoped>
@import '@/assets/css/style.sass'

.page3
  background-image: linear-gradient(#EFCACD, #DE8F95, #C480A2, #B69FC6, #A2CEE5, #FFFFFF)
  background-position: center
  background-size: contain
  background-repeat: no-repeat
  overflow: hidden
  height: 100%
  width: 100%
  flex-direction: column

.el-row
  width: 100%

.darkBackground
  position: absolute
  z-index: 2
  height: 100%
  width: 100%
  background-image: linear-gradient(rgba(255,255,255,0),rgba(61,78,87,0.8),rgba(0,0,0,0.9), rgba(0,0,0,1),rgba(0,0,0,1))
  background-position: center
  background-size: contain
  background-repeat: no-repeat

.about-main
  z-index: 5
  flex: $flex_mainContentPart
  flex-direction: column
  flex-shrink: 0
  @media screen and (max-width: $break_small)
    flex: $flex_small_mainContentPart
.row-dialog
  z-index: 5
  flex: $flex_dialogPart
  @media screen and (max-width: $break_small)
    flex: $flex_small_dialogPart

.about-title-wrapper
  color: white
  font-size: 2em
  min-height: 100px
  // margin: 0
  .about-title
    padding: 30px 0 0 0
.about-content-wrapper
  display: flex

article
  .about-content
    color: white
    span
      font-size: 1em
.signImg
  width: 150px

.froggyServantImg
  width: 100%
  transform: scale(1.5) translate3d(-5px ,50px,0)
.text-center
  text-align: center

.footer-row
  margin: auto auto 0 auto
  height: 50px
  .footer
    font-size: 12px
    bottom: 0
    text-align: center
    color: white

.noScrollbar
  overflow: scroll
  overflow: -moz-scrollbars-none
  -ms-overflow-style: none
  &::-webkit-scrollbar
      width: 0 !important
</style>
