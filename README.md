# fflib-templates
A command line tool to generate Apex templates based on the Apex Enterprise Patterns (FFLIB)

**Table of content:**
- [Installation](#installation)
- [Generating templates](#how-to-generate-templates)
  - [Creating domains](#generating-a-domain-class)
  - [Creating selectors](#generating-a-selector-class)
  - [Creating services](#generating-a-service-class)
  - [How to create a domain, selector and service all at once](#generating-a-domain-selector-and-service-class)

## Installation

### Linux / 
```bash
wget -o ~/.local/bin/sft https://github.com/wimvelzeboer/fflib-templates/releases/download/v0.1.2/sft
chmod +x ~/.local/bin/sft
```

### Windows

[https://github.com/wimvelzeboer/fflib-templates/releases/download/v0.1.2/sft.exe](https://github.com/wimvelzeboer/fflib-templates/releases/download/v0.1.2/sft.exe)

Download the file to a folder that is either added in the PATH or add the folder to it. 

## How to generate templates

### Generating a domain class
**Usage:**
```bash
sft create domain [OPTIONS] --name <DOMAIN_NAME> --type <SOBJECTTYPE>
```

**Options:**

-a, --api <API_VERSION>   Sets the api version, defaults to: 62.0

-n, --name <DOMAIN_NAME>  Sets the base name of the domain (append it with '.class' for DTOs)

-t, --type <SOBJECTTYPE>  Sets the (S)ObjectType

-s, --suffix <SUFFIX>     Sets an optional suffix for the class name

-p, --prefix <PREFIX>     Sets an optional prefix for the class name

-h, --help                Print help

**Example:**
```bash
sft create domain --name Accounts --type Account
```
This creates the following files:
- [Accounts.cls](../force-app/main/default/classes/domains/Accounts.cls)
- [Accounts.cls-meta.xml](../force-app/main/default/classes/domains/Accounts.cls-meta.xml)
- [IAccounts.cls](../force-app/main/default/classes/domains/interfaces/IAccounts.cls)
- [IAccounts.cls-meta.xml](../force-app/main/default/classes/domains/interfaces/Accounts.cls-meta.xml)
- [AccountsTest.cls](../force-app/tests/apex/classes/domains/AccountsTest.cls)
- [AccountsTest.cls-meta.xml](../force-app/tests/apex/classes/domains/AccountsTest.cls-meta.xml)


### Generating a Selector class
**Usage:**
```bash
sft create selector [OPTIONS] --name <DOMAIN_NAME> --type <SOBJECTTYPE>
```

**Options:**

-a, --api <API_VERSION>   Sets the api version, defaults to: 62.0

-n, --name <DOMAIN_NAME>  Sets the base name of the domain (append it with '.class' for DTOs)

-t, --type <SOBJECTTYPE>  Sets the (S)ObjectType

-s, --suffix <SUFFIX>     Sets an optional suffix for the class name

-p, --prefix <PREFIX>     Sets an optional prefix for the class name

-h, --help                Print help

**Example:**
```bash
sft create selector --name Accounts --type Account
```
This creates the following files:
- [AccountsSelector.cls](../force-app/main/default/classes/selectors/AccountsSelector.cls)
- [AccountsSelector.cls-meta.xml](../force-app/main/default/classes/selectors/AccountsSelector.cls-meta.xml)
- [IAccountsSelector.cls](../force-app/main/default/classes/selectors/interfaces/IAccountsSelector.cls)
- [IAccountsSelector.cls-meta.xml](../force-app/main/default/classes/selectors/interfaces/IAccountsSelector.cls-meta.xml)
- [AccountsSelectorTest.cls](../force-app/tests/apex/classes/selectors/AccountsSelectorTest.cls)
- [AccountsSelectorTest.cls-meta.xml](../force-app/tests/apex/classes/selectors/AccountsSelectorTest.cls-meta.xml)


### Generating a Service class
**Usage:**
```bash
sft create service [OPTIONS] --name <DOMAIN_NAME> --type <SOBJECTTYPE>
```

**Options:**

-a, --api <API_VERSION>   Sets the api version, defaults to: 62.0

-n, --name <DOMAIN_NAME>  Sets the base name of the domain (append it with '.class' for DTOs)

-t, --type <SOBJECTTYPE>  Sets the (S)ObjectType

-s, --suffix <SUFFIX>     Sets an optional suffix for the class name

-p, --prefix <PREFIX>     Sets an optional prefix for the class name

-h, --help                Print help

**Example:**
```bash
sft create service --name Accounts --type Account
```
This creates the following files:
- [AccountsService.cls](../force-app/main/default/classes/services/AccountsService.cls)
- [AccountsService.cls-meta.xml](../force-app/main/default/classes/services/AccountsService.cls-meta.xml)
- [IAccountsService.cls](../force-app/main/default/classes/services/interfaces/IAccountsService.cls)
- [IAccountsService.cls-meta.xml](../force-app/main/default/classes/services/interfaces/IAccountsService.cls-meta.xml)
- [AccountsServiceImpl.cls](../force-app/main/default/classes/services/implementations/AccountsServiceImpl.cls)
- [AccountsServiceImpl.cls-meta.xml](../force-app/main/default/classes/services/implementations/AccountsServiceImpl.cls-meta.xml)
- [AccountsServiceTest.cls](../force-app/tests/apex/classes/services/AccountsServiceTest.cls)
- [AccountsServiceTest.cls-meta.xml](../force-app/tests/apex/classes/services/AccountsServiceTest.cls-meta.xml)
- [AccountsServiceImplTest.cls](../force-app/tests/apex/classes/services/AccountsServiceImplTest.cls)
- [AccountsServiceImplTest.cls-meta.xml](../force-app/tests/apex/classes/services/AccountsServiceImplTest.cls-meta.xml)


### Generating a Domain, Selector and Service class

**Usage:**
```bash
sft create base [OPTIONS] --name <DOMAIN_NAME> --type <SOBJECTTYPE>
```

**Options:**

-a, --api <API_VERSION>   Sets the api version, defaults to: 62.0

-n, --name <DOMAIN_NAME>  Sets the base name of the domain (append it with '.class' for DTOs)

-t, --type <SOBJECTTYPE>  Sets the (S)ObjectType

-s, --suffix <SUFFIX>     Sets an optional suffix for the class name

-p, --prefix <PREFIX>     Sets an optional prefix for the class name

-h, --help                Print help

**Example:**
```bash
sft create base --name Accounts --type Account
```