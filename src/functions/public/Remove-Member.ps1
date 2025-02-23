function Remove-Member {
    <#
        .SYNOPSIS
        Removes specified members (properties) from an object.

        .DESCRIPTION
        The Remove-Member function removes specified members (properties) from objects passed through the pipeline.
        If the specified properties exist, they are removed; otherwise, a verbose message is displayed.
        When the -PassThru switch is used, the modified object is returned.

        .EXAMPLE
        $obj = [PSCustomObject]@{Name="John"; Age=30; City="New York"}
        $obj | Remove-Member -Name "Age" -PassThru

        Output:
        ```powershell
        Name  City
        ----  ----
        John  New York
        ```

        Removes the "Age" property from the PSCustomObject and returns the modified object.

        .OUTPUTS
        PSCustomObject

        .NOTES
        The modified object without the specified properties, if -PassThru is used.

        .LINK
        https://psmodule.io/Object/Functions/Remove-Member
    #>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
        'PSUseShouldProcessForStateChangingFunctions', '',
        Justification = 'Sets text in memory'
    )]
    [CmdletBinding()]
    param(
        # Accept input from the pipeline.
        [Parameter(Mandatory, ValueFromPipeline)]
        [System.Object] $InputObject,

        # Specify one or more member names to remove.
        [Parameter(Mandatory)]
        [string[]] $Name,

        # When specified, output the modified object.
        [Parameter()]
        [switch] $PassThru
    )

    process {
        foreach ($obj in $InputObject) {
            foreach ($member in $Name) {
                if ($obj.PSObject.Properties[$member]) {
                    $null = $obj.PSObject.Properties.Remove($member)
                } else {
                    Write-Verbose "Property '$member' not found on object of type $($obj.GetType().FullName)."
                }
            }
            if ($PassThru) {
                # Only output the object if -PassThru is used.
                $obj
            }
        }
    }
}
