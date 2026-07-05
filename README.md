# Object

Object is a PowerShell module for working with PowerShell objects.

## Prerequisites

- PowerShell with `Microsoft.PowerShell.PSResourceGet` available for `Install-PSResource`.
- The [PSModule framework](https://github.com/PSModule) is used for building, testing, and publishing the module.

## Installation

Install the module from the PowerShell Gallery:

```powershell
Install-PSResource -Name Object
Import-Module -Name Object
```

## Commands

- `Remove-Member` removes one or more properties from objects passed through the pipeline. Use `-PassThru` to return the modified object.

## Usage

Remove a property and return the modified object:

```powershell
$object = [PSCustomObject]@{
	Name = 'Ada'
	Age = 37
	City = 'London'
}

$object | Remove-Member -Name Age -PassThru
```

Remove multiple properties:

```powershell
$object | Remove-Member -Name Age, City -PassThru
```

## Examples

More usage examples are available in the [examples](examples) folder.

## Documentation

Command documentation is published at [psmodule.io/Object](https://psmodule.io/Object/).

## Contributing

Issues and pull requests are welcome. Please use the repository issue tracker to report bugs, request features, or discuss improvements.
