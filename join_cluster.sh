#!/bin/bash

docker exec rabbitmq-ha-demo-rabbitmq2-1 rabbitmqctl stop_app
docker exec rabbitmq-ha-demo-rabbitmq2-1 rabbitmqctl join_cluster rabbitmq1@rabbitmq1
docker exec rabbitmq-ha-demo-rabbitmq2-1 rabbitmqctl start_app

docker exec rabbitmq-ha-demo-rabbitmq3-1 rabbitmqctl stop_app
docker exec rabbitmq-ha-demo-rabbitmq3-1 rabbitmqctl join_cluster rabbitmq1@rabbitmq1
docker exec rabbitmq-ha-demo-rabbitmq3-1 rabbitmqctl start_app
