<template>

  <div
    v-if="value > 0"
    class="d-ib"
  >
    <div
      ref="icon"
      class="d-ib vab"
    >
      <UiIcon class="coach-mat-icon">
        <mat-svg
          name="local_library"
          category="maps"
        />
      </UiIcon>
      <span
        v-if="isTopic"
        class="counter"
      >
        {{ $formatNumber(value) }}
      </span>
    </div>
    <KTooltip
      reference="icon"
      :refs="$refs"
    >
      {{ titleText }}
    </KTooltip>
  </div>

</template>


<script>

  import UiIcon from 'keen-ui/src/UiIcon';
  import KTooltip from 'kolibri.coreVue.components.KTooltip';

  export default {
    name: 'CoachContentLabel',
    components: {
      UiIcon,
      KTooltip,
    },
    props: {
      value: {
        type: Number,
        default: 0,
      },
      // Show number next to label if a topic
      isTopic: {
        type: Boolean,
        default: false,
      },
    },
    computed: {
      titleText() {
        if (this.isTopic) {
          return this.$tr('topicTitle', { count: this.value });
        }
        return this.$tr('coachResourceLabel');
      },
    },
    $trs: {
      coachResourceLabel: 'Coach resource',
      topicTitle:
        'Contains {count, number, integer} {count, plural, one {coach resource} other {coach resources}}',
    },
  };

</script>


<style lang="scss" scoped>

  @import '~kolibri.styles.theme';

  .vab {
    vertical-align: bottom;
  }

  .d-ib {
    display: inline-block;
  }

  .counter {
    font-size: 11px;
    vertical-align: inherit;
  }

  .coach-mat-icon.ui-icon {
    font-size: 16px;
    color: $core-status-progress;
  }

</style>
