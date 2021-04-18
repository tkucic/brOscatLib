# brOscatLib

![LOGO](logo.png)
This repo is a port of the popular [Oscat lib](www.oscat.de) to the B&R Automation studio platform. The library contains all functions and function blocks that are in OscatBasic 3.31 library. At the moment, the library is a work in progress, the main porgrammatic porting has been done and some 1000 errors still remain before it can be compiled in Automation Studio. Depending on the ammount of contributers the library will be ported to completion. Initial port was done from Codesys version of Oscat lib by exporting to PLC OpenXml.

## Table of Contents

- [Documentation](#documentation)
- [Installation](#installation)
- [Contributing](#contributing)
- [Support + Feedback](#support--feedback)
- [License](#license)

## Documentation

Documentation of this project is not created yet. There are tools for programatic documentation generation of B&R projects but that is yet to be decided if that is necessary. There is a [quirks file](quirks.md) file that should be updated every time a new "quirk" between CODESYS and Automation studio has been found. For the time being the complete documentation can be found from www.oscat.de. English version of the documentation is located [here](https://www.tecomat.cz/uploads/files/sw/Mosaic/OSCAT/oscat_building100_en.pdf).

## Installation

- Prerequisite B&R Automation studio 4.9
- Add oscat libraries as references to a new project with "Add existing library" item from the toolbox

## Contributing

We appreciate feedback and contribution to this repo! Before you get started, please see the following:

- [contribution guidelines](CONTRIBUTING.md)
- [code of conduct guidelines](CODE-OF-CONDUCT.md)
- [This repo's contribution guide](CONTRIBUTING.md)

## Support + Feedback

Include information on how to get support. Consider adding:

- Use [Issues](issues) for code-level support
- Use [Community]() for usage, questions, specific cases

## License

[brOScat LICENSE](LICENSE)

[Oscat LICENSE](OSCAT_LICENSE)
