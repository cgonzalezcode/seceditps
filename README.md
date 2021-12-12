# SecEditPS

## Installation

Download the module to a location in your `$env:PSModulePath`. Then run the following to import the module.

This module will also need to be run with elevated permissions.

```powershell
Import-Module SecEditPS
```

## Usage

The two most common functions a user would need in this module are `Get-SecEditProperty` and `Set-SecEditProperty`.

Running `Get-SecEditProperty` will return all properties that are currently available or configurable.  You can also specify a particular property you wish to return.

```powershell
> Get-SecEditProperty -Property "NewGuestName"

Name                           Value
----                           -----
NewGuestName                   "Guest"
```

If you wish to change a value of a property, use `Set-SecEditProperty`.  If the property does not exist, use the `-Force` flag to create it.

```powershell
> Set-SecEditProperty -Property NewGuestName -Value "Guest2"

Name                           Value
----                           -----
NewGuestName                   "Guest2"
```

## Contributing

Feel free to dive in! Open an issue or submit PRs.

Standard Readme follows the Contributor Covenant Code of Conduct.

## License

[MIT](https://choosealicense.com/licenses/mit/)
