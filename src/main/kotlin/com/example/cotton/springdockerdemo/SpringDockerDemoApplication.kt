package com.example.cotton.springdockerdemo

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SpringDockerDemoApplication

fun main(args: Array<String>) {
    runApplication<SpringDockerDemoApplication>(*args)
}
