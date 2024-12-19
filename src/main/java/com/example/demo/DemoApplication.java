package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.TreeSet;
import java.util.Arrays;
import javax.imageio.ImageIO;

import java.util.logging.Logger;

@SpringBootApplication
public class DemoApplication {

    private static final Logger log = Logger.getLogger(DemoApplication.class.getName());

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

    @EventListener(ApplicationReadyEvent.class)
    public void onApplicationReady() {
        log.info("Available image formats: " + Arrays.stream(ImageIO.getReaderFormatNames())
                .map(String::toLowerCase)
                .collect(Collectors.joining(", ")));

        log.info("Going to sleep...");
        while (true) {
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
