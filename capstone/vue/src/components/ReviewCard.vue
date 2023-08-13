<template>
  <section>
    <b-card class="list-reviews-card">
      <b-card-header>Game: {{ game.title }} </b-card-header>
      <!--game title -->
      <b-card-body class="body">
        <b-card-text> {{ item.reviewContent }} </b-card-text>
        <br />
        <b-card-text>
          Date:
          {{ new Date(item.reviewDateTime).toLocaleString("en", options) }}
        </b-card-text>
        <button
          class="btn btn-danger"
          v-b-modal="`${item.reviewContent}`"
          v-bind:key="item.reviewId"
        >
          Delete <b-icon icon="trash" />
        </button>

        <b-modal
          ok-variant="danger"
          ok-title="DELETE"
          cancel-title="CANCEL"
          @ok="deleteReview"
          v-bind:id="item.reviewContent"
        >
          Are you sure you want to delete This review?
        </b-modal>
      </b-card-body>
    </b-card>
  </section>
</template>

<script>
import gameService from "../services/GameService.js";
import ReviewService from "../services/ReviewService.js";
export default {
  props: ["item"],
  data() {
    return {
      gameId: this.$store.state.gameId,
      game: {
      },
      options: { year: "numeric", month: "long", day: "numeric" },
    };
  },
  methods: {
    getGameTitle() {
      gameService.getGame(this.gameId).then((response) => {
        this.game = response.data;
      });
    },
    deleteReview() {
      ReviewService.deleteReview(this.item.reviewId).then(() => {
        location.reload();
      });
    },
  },
  created() {
    this.getGameTitle();
  },
};
</script>

<style scoped>
</style>