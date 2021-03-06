Feature: Super admin select import content location
    Super admin needs to be able to select where to import content from Kolibri Studio, local network or attached drive 

  Background:
    Given I am signed in to Kolibri as Super admin, or a user with device permissions to import content
      And I am on *Device > Channels* page

  Scenario: Import content channels from Kolibri Studio
    Given the device has Internet connection available
    When I click on *Import* button
    Then I see *Select a source* modal
    When I select *Kolibri Studio* 
      And I click *Continue*
    Then I see the *Loading channels* message
      And I see the *Kolibri Studio* page with the list of available content *Channels*

  Scenario: Import content channels from local network
    Given the device has Internet connection available, or an access to another Kolibri server instance in the local network
    When I click on *Import* button
    Then I see *Select a source* modal
    When I select *Local network or internet* 
      And I click *Continue*
    Then I see *Select network address* modal
    When I click *New address*
    Then I see *New address* modal
    When I input the full network address and the network name
      And I click *Add*
    Then I see Kolibri trying to connect to the network
    # If the connection is established successfully
      And I see the snackbar confirmation that the address has been added
    # If the connection is not established
      And I see the error message *Could not connect to network
    # If there are several added networks
    When I select <network_name>
      And I click *Continue*
    Then I see the *Import from '<network_name>'* page with the list of available content *Channels* on the <network_name> local drive

  Scenario: Import content channels from attached drive
    Given there is a <drive> local drive attached to the device
    When I click on *Import* button
    Then I see *Select a source* modal
    When I select *Attached drive or memory card* 
      And I click *Continue*
    Then I see Kolibri searching for local drives
      And I see the *Select a drive* modal
    When I select <drive> local drive
      And I click *Continue*
    Then I see the *Import from '<drive>'* page with the list of available content *Channels* on the <drive> local drive

Examples:
| drive       | network_name  |
| Hard_Disc_1 | CasaPaco      |
| USB_Card_2  | CountryServer |