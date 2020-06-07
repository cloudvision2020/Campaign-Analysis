<template>
  <div id="app">
    <CampaignAnalysis></CampaignAnalysis>
    <CampaignReport></CampaignReport>
  </div>
</template>

<script>

import CampaignAnalysis from './components/CampaignAnalysis'
import CampaignReport from './components/CampaignReport'

export default {
  name: 'App',
  components : {
    CampaignAnalysis,CampaignReport
  }
}
</script>

<style>
@import url('../node_modules/@salesforce-ux/design-system/assets/styles/salesforce-lightning-design-system.min.css');
</style>
