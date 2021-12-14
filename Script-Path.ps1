# The line below creates a variable referencing to the current script path in the best accurate way.
$myDir = if ($PSScriptRoot) { $PSScriptRoot } elseif ($psise) { split-path $psise.ExistingFile.FullPath } elseif ($psEditor) { split-path $psEditor.GetEditorContext().ExistingFile.Path } # Get Script Running Path
