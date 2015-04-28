<center>
	<h3>Daily Activity Report</h3>
	<table id='detailpanel_1' cellpadding="4" width="100%" border="1">
		<tr>
			<td width='30%' scope="row">
				<b># of properties in Escrow</b>
			</td>
			<td width='30%' scope="row">
				{$ESCROW_COUNT}
			</td>
			<td width='30%'  >
				<b># of properties on market</b>
			</td>
			<td width='30%' scope="row">
				{$MARKETING_COUNT}
			</td>
			<td width='30%' scope="row">
				<b># of properties sold</b>
			</td>
			<td width='30%' scope="row">
				{$SOLD_COUNT}
			</td>
		</tr>
		<tr>
			<td width='12.5%' scope="row">
				<b>New Today</b>
			</td>
			<td width='12.5%' scope="row">
				{$ESCROW_ADDED}
			</td>
			<td width='37.5%'  >
				<b>New Today</b>
			</td>
			<td width='12.5%' scope="row">
				{$MARKETING_ADDED}
			</td>
			<td width='12.5%' scope="row">
				<b>New Today</b>
			</td>
			<td width='12.5%' scope="row">
				{$SOLD_ADDED}
			</td>
		</tr>
		<tr>
			<td width='12.5%' scope="row">
				<b># of offers made</b>
			</td>
			<td width='12.5%' scope="row">
				{$OFFER_MADE}
			</td>
		</tr>
	</table>
	<br/>
	<br/>
	<table id='detailpanel_1' width="100%" border="1" cellpadding="4">
		<tr>
			<td width="15%" scope="row"><b>Diedre</b></td>
			<td width="12%" scope="row">&nbsp;&nbsp;</td>
			<td width="15%" scope="row">&nbsp;&nbsp;</td>
			<td width="15%" scope="row">&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b>Tasks Completed</b></td>
			<td width="12%" scope="row"><b>Priority</b></td>
			<td width="15%" scope="row"><b>Due Date</b></td>
			<td width="15%" scope="row"><b>Related To</b></td>
		</tr>
			{if !empty($DIEDRE_TASKS)}
				{foreach from=$DIEDRE_TASKS key=val item=task}
					<tr width="15%" scope="row"><td>{$task.name}</td><td width="12%" scope="row">{$task.priority}</td><td width="15%" scope="row">{$task.date_due}</td><td width="15%" scope="row">{$task.parent_type}</td></tr>
				{/foreach}
			{/if}
	</table>
		<br/>
	<br/>
	<table id='detailpanel_1' width="100%" border="1" cellpadding="4">
		<tr>
			<td width="15%" scope="row"><b>Shanna</b></td>
			<td width="12%" scope="row">&nbsp;&nbsp;</td>
			<td width="15%" scope="row">&nbsp;&nbsp;</td>
			<td width="15%" scope="row">&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b>Tasks Completed</b></td>
			<td width="12%" scope="row"><b>Priority</b></td>
			<td width="15%" scope="row"><b>Due Date</b></td>
			<td width="15%" scope="row"><b>Related To</b></td>
		</tr>
			{if !empty($SHANNA_TASKS)}
				{foreach from=$SHANNA_TASKS key=val item=task}
					<tr width="15%" scope="row"><td>{$task.name}</td><td width="12%" scope="row">{$task.priority}</td><td width="15%" scope="row">{$task.date_due}</td><td width="15%" scope="row">{$task.parent_type}</td></tr>
				{/foreach}
			{/if}
	</table>
	<br/><br/>
	<table id='detailpanel_1' width="100%" border="1" cellpadding="4">
		<tr>
			<td width="15%" scope="row"><b>Diedre</b></td>
			<td width="12%" scope="row">&nbsp;&nbsp;</td>
			<td width="15%" scope="row">&nbsp;&nbsp;</td>
			<td width="15%" scope="row">&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b>Tasks Not Completed</b></td>
			<td width="12%" scope="row"><b>Priority</b></td>
			<td width="15%" scope="row"><b>Due Date</b></td>
			<td width="15%" scope="row"><b>Related To</b></td>
		</tr>
			{if !empty($DIEDRE_UNCOMPLETEDTASKS)}
				{foreach from=$DIEDRE_UNCOMPLETEDTASKS key=val item=task}
					<tr width="15%" scope="row"><td>{$task.name}</td><td width="12%" scope="row">{$task.priority}</td><td width="15%" scope="row">{$task.date_due}</td><td width="15%" scope="row">{$task.parent_type}</td></tr>
				{/foreach}
			{/if}
	</table>
	<br/><br/>
	<table id='detailpanel_1' width="100%" border="1" cellpadding="4">
		<tr>
			<td width="15%" scope="row"><b>Shanna</b></td>
			<td width="12%" scope="row">&nbsp;&nbsp;</td>
			<td width="15%" scope="row">&nbsp;&nbsp;</td>
			<td width="15%" scope="row">&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b>Tasks Not Completed</b></td>
			<td width="12%" scope="row"><b>Priority</b></td>
			<td width="15%" scope="row"><b>Due Date</b></td>
			<td width="15%" scope="row"><b>Related To</b></td>
		</tr>
			{if !empty($SHANNA_UNCOMPLETEDTASKS)}
				{foreach from=$SHANNA_UNCOMPLETEDTASKS key=val item=task}
					<tr width="15%" scope="row"><td>{$task.name}</td><td width="12%" scope="row">{$task.priority}</td><td width="15%" scope="row">{$task.date_due}</td><td width="15%" scope="row">{$task.parent_type}</td></tr>
				{/foreach}
			{/if}
	</table>
	<br/><br/>
	<table id='detailpanel_1' width="100%" border="1" cellpadding="4">
		<tr>
			<td width="15%" scope="row">&nbsp;&nbsp;</td>
			<td width="15%" scope="row"><b>Diedre</b></td>
			<td width="15%" scope="row"><b>Shanna</b></td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b># of Sellers Contacted Today</b></td>
			<td width="15%" scope="row">{$DIEDRESELLERSCONTACTED}</td>
			<td width="15%" scope="row">{$SHANNASELLERSCONTACTED}</td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b>Called</b></td>
			<td width="15%" scope="row">{$DIEDRESELLERSCALL}</td>
			<td width="15%" scope="row">{$SHANNASELLERSCALL}</td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b>Emailed</b></td>
			<td width="15%" scope="row">{$DIEDRESELLERSEMAIL}</td>
			<td width="15%" scope="row">{$SHANNASELLERSEMAIL}</td>
		</tr>
		<tr>
			<td width="15%" scope="row">&nbsp;</td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b># of Buyers Contacted Today</b></td>
			<td width="15%" scope="row">{$DIEDREBUYERSCONTACTED}</td>
			<td width="15%" scope="row">{$SHANNABUYERSCONTACTED}</td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b>Called</b></td>
			<td width="15%" scope="row">{$DIEDREBUYERSCALL}</td>
			<td width="15%" scope="row">{$SHANNABUYERSCALL}</td>
		</tr>
		<tr>
			<td width="15%" scope="row"><b>Emailed</b></td>
			<td width="15%" scope="row">{$DIEDREBUYERSEMAIL}</td>
			<td width="15%" scope="row">{$SHANNABUYERSEMAIL}</td>
		</tr>
	</table>
</center>