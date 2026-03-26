# main.tf



# AWS Provider

provider "aws" {

  region = "us-east-1"

}



# Azure Provider

provider "azurerm" {

  features {}

}



# Create an AWS EC2 instance

resource "aws_instance" "iot_server" {

  ami           = "ami-0c55b159cbfafe1f0"

  instance_type = "t2.micro"



  tags = {

    Name = "IoT-Server"

  }

}



# Create an Azure IoT Hub

resource "azurerm_resource_group" "iot_group" {

  name     = "IoTResourceGroup"

  location = "East US"

}



resource "azurerm_iothub" "iot_hub" {

  name                = "MyIoTHub"

  resource_group_name = azurerm_resource_group.iot_group.name

  location            = azurerm_resource_group.iot_group.location

  sku {

    name     = "S1"

    capacity = 1

  }

}