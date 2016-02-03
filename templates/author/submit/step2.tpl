{**
 * templates/author/submit/step2.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 2 of author article submission.
 *
 *}
{assign var="pageTitle" value="author.submit.step2"}
{include file="author/submit/submitHeader.tpl"}

<form method="post" action="{url op="saveSubmit" path=$submitStep}" enctype="multipart/form-data">
<input type="hidden" name="articleId" value="{$articleId|escape}" />
{include file="common/formErrors.tpl"}

<div id="uploadInstructions" class="block">
<p>To upload a proposal, complete the following steps.
<ul>
	<li>On this page, click Browse (or Choose File) which opens a Choose File window for locating the file on the hard drive of your computer.</li>
<li>Locate the file you wish to submit and highlight it.</li>
<li>Click Open on the Choose File window, which places the name of the file on this page.</li>
<li>Click Upload on this page, which uploads the file from the computer to the journal's web site and renames it following the journal's conventions.</li>
<li>Once the submission is uploaded, click Save and Continue at the bottom of this page.</li>
</ul>
</p>

</div>

{if $journalSettings.supportPhone}
	{assign var="howToKeyName" value="author.submit.howToSubmit"}
{else}
	{assign var="howToKeyName" value="author.submit.howToSubmitNoPhone"}
{/if}

<p>{translate key=$howToKeyName supportName=$journalSettings.supportName supportEmail=$journalSettings.supportEmail supportPhone=$journalSettings.supportPhone}</p>

<div class="separator"></div>

<div id="submissionFile" class="block">
<h3>{translate key="author.submit.submissionFile"}</h3>
<table class="data" width="100%">
{if $submissionFile}
<tr valign="top">
	<td width="30%" class="label">{translate key="common.fileName"}</td>
	<td width="70%" class="value"><a href="{url op="download" path=$articleId|to_array:$submissionFile->getFileId()}">{$submissionFile->getFileName()|escape}</a></td>
</tr>
<tr valign="top">
	<td width="30%" class="label">{translate key="common.originalFileName"}</td>
	<td width="70%" class="value">{$submissionFile->getOriginalFileName()|escape}</td>
</tr>
<tr valign="top">
	<td width="30%" class="label">{translate key="common.fileSize"}</td>
	<td width="70%" class="value">{$submissionFile->getNiceFileSize()}</td>
</tr>
<tr valign="top">
	<td width="30%" class="label">{translate key="common.dateUploaded"}</td>
	<td width="70%" class="value">{$submissionFile->getDateUploaded()|date_format:$datetimeFormatShort}</td>
</tr>
{else}
<tr valign="top">
	<td colspan="2" class="nodata">{translate key="author.submit.noSubmissionFile"}</td>
</tr>
{/if}
</table>
</div>

<div class="separator"></div>

<div id="addSubmissionFile" class="block">
<table class="data" width="100%">
<tr>
	<td width="30%" class="label">
		{if $submissionFile}
			{fieldLabel name="submissionFile" key="author.submit.replaceSubmissionFile"}
		{else}
			{fieldLabel name="submissionFile" key="author.submit.uploadSubmissionFile"}
		{/if}
	</td>
	<td width="70%" class="value">
		<input type="file" class="uploadField" name="submissionFile" id="submissionFile" /> <input name="uploadSubmissionFile" type="submit" class="button" value="{translate key="common.upload"}" />
		{if $currentJournal->getSetting('showEnsuringLink')}<a class="action" href="javascript:openHelp('{get_help_id key="editorial.sectionEditorsRole.review.blindPeerReview" url="true"}')">{translate key="reviewer.article.ensuringBlindReview"}</a>{/if}
	</td>
</tr>
</table>
</div>

<div class="separator"></div>

<p><input type="submit"{if !$submissionFile} onclick="return confirm('{translate|escape:"jsparam" key="author.submit.noSubmissionConfirm"}')"{/if} value="{translate key="common.saveAndContinue"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="confirmAction('{url page="author"}', '{translate|escape:"jsparam" key="author.submit.cancelSubmission"}')" /></p>

</form>

{include file="common/footer.tpl"}

