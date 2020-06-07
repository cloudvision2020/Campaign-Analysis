<template>
	<div id="campReportDiv">
		<article class="slds-card" style="max-width: 100%; overflow: auto;">
			<div class="slds-card__header slds-grid">
				<header class="slds-media slds-media_center slds-has-flexi-truncate">
				<div class="slds-media slds-media_center slds-has-flexi-truncate">
					<div class="slds-media__figure">
						<span class="slds-icon_container slds-icon-standard-account" title="account">
							<svg class="slds-icon slds-icon_small" aria-hidden="true">
								<use xlink:href="/assets/icons/standard-sprite/svg/symbols.svg#account">
								</use>
							</svg>
						</span>
						</div>
					<div class="slds-media__body slds-truncate">
						<h2>
							<span class="slds-text-heading_small">
								Campaign Analysis 
							</span>
						</h2>
					</div>
				</div>
				</header>
			</div>
		    <div class="slds-card__body">
			<div class="slds-scrollable_x" style="height:100%;max-height:400px;overflow: auto;">
		 
				<table class="slds-table slds-table_bordered slds-table--header-fixed">
					<tr style="background-color: #c8d1e0;">
						<th> <div class="">Row No.</div></th>
						<th><div class="">Campaign ID</div></th>
						<th><div class="">List Name</div></th>
						<th><div class="">Select</div></th>
						<th><div class=""># Solicited</div></th>
						<th><div class="">Start Date</div></th>
						<th><div class=""># of Gifts</div></th>
						<th><div class="">$ Amount of Gifts</div></th>
						<th><div class="">Response Rate</div></th>
						<th><div class="">Avg. Gift</div></th>
						<th><div class="">In / Out</div></th>
						<th><div class="">Total Cost</div></th>
						<th><div class="">Cost / Piece</div></th>
						<th><div class="">Net Cost / Donor</div></th>
						<th><div class="">$1,000+ Donors</div></th>
						<th><div class="">$500-$999 Donors</div></th>
						<th><div class="">$250-$499 Donors</div></th>
						<th><div class="">$100-$249 Donors</div></th>
						<th><div class="">$59-$99 Donors</div></th>
						<th><div class="">$25-$49 Donors</div></th>
						<th><div class="">$1-$24 Donors</div></th>
						<th><div class="">Signer</div></th>
						<th><div class="">Carrier Postage</div></th>
						<th><div class="">Carrier Size</div></th>
						<th><div class="">Reply Postage</div></th>
						<th><div class="">Double Sided</div></th>
						<th><div class="">Channel</div></th>
						<th><div class="">Detail Channel</div></th>
					</tr>
				   
						<tr v-for="data in campData">
							<td></td>
							<td>{{data.CampaignID}}</td>
							<td>{{data.ListName}}</td>
							<td>{{data.Select}}</td>
							<td>{{data.Solicited}}</td>
							<!--<td>{campaign.Total_Number_of_Donations_Received__c}</td>-->
							<td>{{data.StartDate}}</td>
							<td>{{data.gift}}</td>
							<td>{{data.AmountofGifts}}</td>
							<td>{{data.ResponseRate}}
							</td>
							<td>{{data.AvgGift}}</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							<td>
								{{data.AmountofGifts}}
							</td>
							
						</tr>
				    </table>
				</div>
			</div>	
		</article>
	</div>
</template>

 <script src="https://unpkg.com/vue@2.5.16/dist/vue.js"></script>
	   
		<script type="text/javascript">
			export default {
            data() {
                return {
                    campData:[ 
                        { "CampaignID": "CZA200XL", "ListName": "Multis", "Select":"Multis", "Solicited": "81", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":300.00, "ResponseRate":247, "AvgGift":150},
						{ "CampaignID": "CZA200XS", "ListName": "Multis", "Select":"Multis", "Solicited": "90", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":50.00, "ResponseRate":125, "AvgGift":50},
                        { "CampaignID": "CZA200AA", "ListName": "Multis", "Select":"Multis", "Solicited": "91", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":300.00, "ResponseRate":247, "AvgGift":150},
						{ "CampaignID": "CZA200BB", "ListName": "Multis", "Select":"Multis", "Solicited": "92", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":50.00, "ResponseRate":125, "AvgGift":50},
                        { "CampaignID": "CZA200CC", "ListName": "Multis", "Select":"Multis", "Solicited": "93", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":300.00, "ResponseRate":247, "AvgGift":150},
						{ "CampaignID": "CZA200DD", "ListName": "Multis", "Select":"Multis", "Solicited": "83", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":50.00, "ResponseRate":125, "AvgGift":50},
                        { "CampaignID": "CZA200EE", "ListName": "Multis", "Select":"Multis", "Solicited": "84", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":300.00, "ResponseRate":247, "AvgGift":150},
						{ "CampaignID": "CZA200EF", "ListName": "Multis", "Select":"Multis", "Solicited": "85", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":50.00, "ResponseRate":125, "AvgGift":50},
                        { "CampaignID": "CZA200GH", "ListName": "Multis", "Select":"Multis", "Solicited": "86", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":300.00, "ResponseRate":247, "AvgGift":150},
						{ "CampaignID": "CZA200IJ", "ListName": "Multis", "Select":"Multis", "Solicited": "89", "StartDate":'2014-12-09', "gift":2, "AmountofGifts":50.00, "ResponseRate":125, "AvgGift":50}
                        ]
                    }
               }
            }
 </script>

 <style scoped>
	   
		table {
			counter-reset: rowNumber;
		}

		table tr:not(:first-child) {
			counter-increment: rowNumber;
		}

		table tr td:first-child::before {
			content: counter(rowNumber);
			min-width: 1em;
			margin-right: 0.5em;
		}
 </style>