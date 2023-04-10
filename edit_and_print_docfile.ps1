param (
	[string]
	[Parameter(Mandatory, Position=0)]
	$Template = "no path",
	[string]
	[Parameter(Mandatory, Position=1)]
	$Result = "no path",
	[string[]]
	[Parameter(Position=2, ValueFromRemainingArguments)]
	$ReplacePairs
	)
	
"- POWERSHELL:" 
"-- Path to template: $Template"
"-- Path to result: $Result"


"-- Starting Microsoft Word"
$Word = New-Object -ComObject Word.Application
$Word.Visible = $False

"-- Opening template"
$doc = $word.Documents.Open($Template)


"-- Start of editing"
for ($i = 0; $i -lt $ReplacePairs.Count; $i++)
	{	
		"---- bookmark: $($ReplacePairs[$i])"
		$Word.ActiveDocument.Bookmarks.Item($ReplacePairs[$i]).Select()
		$i++
		"---- value: $($ReplacePairs[$i])"
		$Word.Selection.Text = $ReplacePairs[$i]
	}

"-- Saving result"
$doc.SaveAs($Result)
$doc.close()



"-- Init printing process"

Start-Process -FilePath $Result -Verb print 


"-- Quiting Microsoft Word"
$Word.Quit()
