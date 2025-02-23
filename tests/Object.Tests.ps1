[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSReviewUnusedParameter', '',
    Justification = 'Required for Pester tests'
)]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute(
    'PSUseDeclaredVarsMoreThanAssignments', '',
    Justification = 'Required for Pester tests'
)]
[CmdletBinding()]
param()

Describe 'Object' {
    Context 'Function: Remove-Member' {
        It 'Removes a member from an object' {
            $object = [pscustomobject]@{ Name = 'Test'; Value = 'Value' }
            $object | Remove-Member -Name Value
            $object.PSObject.Properties | Should -Not -Contain 'Value'
        }

        It 'Removes multiple members from an object' {
            $object = [pscustomobject]@{ Name = 'Test'; Value = 'Value'; Other = 'Other' }
            $object | Remove-Member -Name Value, Other
            $object.PSObject.Properties | Should -Not -Contain 'Value'
            $object.PSObject.Properties | Should -Not -Contain 'Other'
        }
    }
}
