<template>
<div class="slds-card">
    
	<div class="slds-card__header slds-grid">
		<header class="slds-media slds-media_center slds-has-flexi-truncate">
			
			<div class="slds-media__figure">
				<span class="slds-icon_container slds-icon-standard-account" title="account">
					<svg class="slds-icon slds-icon_small" aria-hidden="true">
					<use xlink:href="/assets/icons/standard-sprite/svg/symbols.svg#account"></use>
					</svg>
					<span class="slds-assistive-text">Analysis Magic</span>
				</span>
			</div>
			<div class="slds-media__body">
				<h2 class="slds-card__header-title">
					<a href="javascript:void(0);" class="slds-card__header-link slds-truncate" title="Accounts">
					<span>Analysis Magic</span>
					</a>
				</h2>
				
			</div>

			<div class="slds-no-flex">
				   <button variant="primary" class="slds-button slds-button_brand">Search</button>
			</div>
			
		</header>
	</div>
	<hr style="margin: var(--lwc-spacingSmall,2rem) 0;"></hr>
	<div class="slds-card__body slds-card__body_inner">
			<header class="slds-media slds-media_center slds-has-flexi-truncate">
			
				<div class="slds-media__body">
				<h2 class="slds-card__header-title">
					<B>
					<span>Package Attributes</span></B>
					</a>
				</h2>
				</div>
			</header></br>
<table style="margin-left: -2%;"> 
	<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Carrier Postage Type </label>
		</td>
		
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
			  
			  <option value="All">All</option>
				<option>First Class</option>
				<option >First Class Indicia</option>
				<option >First Class Presort</option>
				<option >First Class, Old Stamps</option>
				<option >Non-Profit</option>
				<option >Non-Profit Indicia</option>
				<option >Non-profit Meter</option>
				<option >Non-Profit, big stamp</option>
				<option >Non-Profit, two Stamps</option>
				<option >Nonprofit Indicia</option>
				<option >Nonprofit Meter</option>
				<option >Presort First-Class</option>
				<option >Presorted First Class</option>
				<option >Unstamped RAE</option>
			</select>
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Carrier Size </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All</option>
				<option >#10</option>
				<option >#11</option>
				<option >#12</option>
				<option >#14</option>
				<option >10 x 13</option>
				<option >11 x 6</option>
				<option >6 x 10</option>
				<option >6 x 11</option>
				<option >6 x 4</option>
				<option >6 X 9</option>
				<option >6 x 9.5</option>
				<option >9 x 12</option>
				<option >9x12</option>
				<option >Executive</option>
				<option >Self</option>
			</select>
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Reply Postage Type </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All</option>
				<option >BRE</option>
				<option >First Class</option>
				<option >Non-Profit</option>
				<option >Unstamped RAE</option>
			</select>
		</td>
</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Double Sided Printing </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Signer </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All</option>
				<option >Alex Mooney</option>
				<option >Ann Coulter</option>
				<option >Bobby Jindal</option>
				<option >Cabot Phillips</option>
				<option >David Blair</option>
				<option >David Horowitz</option>
				<option >Ed Meese</option>
				<option >Greg Abbott</option>
				<option >Hayden Williams</option>
				<option >James Inhofe</option>
				<option >James O'Keefe</option>
				<option >Jerry Falwell</option>
				<option >Jim DeMint</option>
				<option >John Cornyn</option>
				<option >Joseph Coors</option>
				<option >Ken Cuccinelli</option>
				<option >Laura Ingraham</option>
				<option >Lawrence Jones</option>
				<option >Mark Levin</option>
				<option >Mark Meadows</option>
				<option >Michele Bachmann</option>
				<option >Michelle Malkin</option>
				<option >Mike Lee</option>
				<option >Mike Pence</option>
				<option >Morton Blackwell</option>
				<option >Nikki Haley</option>
				<option >Rand Paul</option>
				<option >Star Parker</option>
				<option >Sterling Beard</option>
				<option >Ted Cruz</option>
				<option >Tom Coburn</option>
				<option >Tom DeLay</option>
				<option >Yvonne Dean-Bailey</option>
			</select>
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Channel </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All</option>
				<option >Digital</option>
				<option >Mail</option>
				<option >Personal Solicitation</option>
				<option >Radio</option>
				<option >Telemarketing</option>
			</select>
		</td>
</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Purpose </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All</option>
				<option >Acquisition</option>
				<option >Cultivation</option>
				<option >Solicitation</option>
			</select>
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Detail Channel </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All</option>
				<option >Social</option>
				<option >Email</option>
				<option >High Dollar Mail</option>
				<option >Low Dollar Mail</option>
				<option >Search</option>
				<option >Event</option>
				<option >Organic</option>
				<option >Regional Development</option>
			</select>
		</td>

</tr>
</table >
<hr style="margin: var(--lwc-spacingSmall,2rem) 0;"></hr>
<table>
<header class="slds-media slds-media_center slds-has-flexi-truncate">
			
				<div class="slds-media__body">
				<h2 class="slds-card__header-title">
					<B>
					<span>Appeal Details</span></B>
					</a>
				</h2>
				</div>
			</header></br>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Appeal Start Date </label>
		</td>
		<td style="width: 18%;text-align:left;">
		
			<input class="slds-select" type="date" v-model="date">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Appeal Id From </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-input" type="text" v-model="text">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Type </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All</option>
				<option >First Class</option>
				<option >First Class Indicia</option>
				<option >First Class Presort</option>
			</select>
		</td>
</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Appeal End Date </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" type="date" v-model="date">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Appeal Id To </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" type="text" v-model="text">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Appeal Id Like </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" type="text" v-model="text">
		</td>
</tr>

</table>

<hr style="margin: var(--lwc-spacingSmall,2rem) 0;"></hr>
<table>
<header class="slds-media slds-media_center slds-has-flexi-truncate">
			
				<div class="slds-media__body">
				<h2 class="slds-card__header-title">
					<B>
					<span>Options</span></B>
					</a>
				</h2>
				</div>
			</header></br>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Option </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All Donors</option>
				<option >Only New Donors</option>
				<option >Only Existing Donors</option>
				<option >Donors Lapsed 6+ Months</option>
				<option >Donors Lapsed 12+ Months</option>
				<option >Donors Lapsed 18+ Months</option>
				<option >Donors Lapsed 24+ Months</option>
			</select>
		</td>
		
	
</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Do Not Repeat Header Row</label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Calculate Doubling Time </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Upgrade Analysis </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		

</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Show Future Gifts </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Exclude Postage Discount </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Future Gift Start Date </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" type="date" v-model="date">
		</td>
		

</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Show Percentage in Gift </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Show Target Ratio </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Future Gift End Date </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		

</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Gift Channel </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All</option>
				<option >Digital</option>
				<option >Telemarketing</option>
				<option >Mail</option>
				<option >In-Person</option>
			</select>
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">UTM Campaign </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" type="text" v-model="text">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">UTM Content </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" type="text" v-model="text">
		</td>
		

</tr>
<tr style="height: 42px;">
		
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">UTM Medium </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" type="text" v-model="text">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">UTM Source </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" type="text" v-model="text">
		</td>
		

</tr>
</table>
<hr style="margin: var(--lwc-spacingSmall,2rem) 0;"></hr>
<table>

<header class="slds-media slds-media_center slds-has-flexi-truncate">
			
				<div class="slds-media__body">
				<h2 class="slds-card__header-title">
					<B>
					<span>Sorting & Filtering</span></B>
					</a>
				</h2>
				</div>
			</header></br>

<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Sort By </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >--None--</option>
				<option >In/Out</option>
				<option >Response Rate</option>
				<option >Avg. Gift</option>
				<option >Total Cost</option>
				<option >Cost / Piece</option>
				<option >Net Cost / Donor</option>
				<option ># of Gifts</option>
			</select>
		</td>
		
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Include Existing Donor</label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All Donors</option>
				<option >Only New Donors</option>
				<option >Only Existing Donors</option>
				<option >Donors Lapsed 6+ Months</option>
				<option >Donors Lapsed 12+ Months</option>
				<option >Donors Lapsed 18+ Months</option>
				<option >Donors Lapsed 24+ Months</option>
			</select>
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Initial Gift Size </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" placeholder=">=" type="Number" v-model="checked">
		</td>
		

</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
		</td>
		<td style="width: 18%;text-align:left;">
		</td>
		<td style="width: 15%;text-align:right;">
		</td>
		<td style="width: 18%;text-align:left;">
		</td>
		<td style="width: 15%;text-align:right;">
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" placeholder="<=" type="Number" v-model="checked">
		</td>
		

</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Subtotal By </label>
		</td>
		<td style="width: 18%;text-align:left;">
			<select class="slds-select" name="movie" id="movie" v-model="movie">
				<option >All Donors</option>
				<option >Only New Donors</option>
				<option >Only Existing Donors</option>
				<option >Donors Lapsed 6+ Months</option>
				<option >Donors Lapsed 12+ Months</option>
				<option >Donors Lapsed 18+ Months</option>
				<option >Donors Lapsed 24+ Months</option>
			</select>
		</td>
		
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Estimated Costs</label>
		</td>
		<td style="width: 18%;text-align:left;">
			<input type="checkbox" v-model="checked">
		</td>
		<td style="width: 15%;text-align:right;">
			<label class="slds-form-element__label slds-no-flex" for="movie">Initial Gift Date Range </label>
			
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" placeholder=">=" type="date" v-model="date">
		</td>
		

</tr>
<tr style="height: 42px;">
		<td style="width: 15%;text-align:right;">
		</td>
		<td style="width: 18%;text-align:left;">
		</td>
		<td style="width: 15%;text-align:right;">
		</td>
		<td style="width: 18%;text-align:left;">
		</td>
		<td style="width: 15%;text-align:right;">
		</td>
		<td style="width: 18%;text-align:left;">
			<input class="slds-select" placeholder="<=" type="date" v-model="date">
		</td>
		

</tr>
</table>	
</div>
</div>
</template> 