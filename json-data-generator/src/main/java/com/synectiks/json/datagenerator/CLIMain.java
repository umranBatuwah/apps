package com.synectiks.json.datagenerator;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TimeZone;
import java.io.InputStreamReader;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.lang.StringUtils;
import org.graylog2.gelfclient.GelfConfiguration;
import org.graylog2.gelfclient.GelfMessage;
import org.graylog2.gelfclient.GelfMessageBuilder;
import org.graylog2.gelfclient.GelfMessageLevel;
import org.graylog2.gelfclient.GelfTransports;
import org.graylog2.gelfclient.transport.GelfTransport;
import org.reflections.vfs.Vfs.Dir;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.synectiks.json.datagenerator.impl.JsonDataGeneratorImpl;
import com.synectiks.json.datagenerator.impl.NonCloseableBufferedOutputStream;

/**
 * Main class for command line interface
 */
public final class CLIMain {

    private static TimeZone DEFAULT_TIMEZONE = TimeZone.getDefault();

    public static String IP = "localhost";
	public static String PORT = "5057";
	public static String BASE_URL = "http://"+IP+":"+PORT+"/api";

    public static String DEV = "/HR/EMS/DEV";
    public static String PROD = "/HR/EMS/PROD";
    public static String STAGE = "/HR/EMS/STAGE";
    public static String TEST = "/HR/EMS/TEST";

    public static final String ENTER_JSON_TEXT = "Enter input json:\n\n ";
    public static String JSON_TO_KAFKA_URL = "http://localhost:9450/api/send-data-to-kafka";
    /**
     * default constructor
     */
    private CLIMain() {

    }

    private static Options buildOptions() {
        Options options = new Options();

        Option o = new Option("s", "sourceFile", true,
            "the source file.");
        o.setRequired(false);
        options.addOption(o);


        Option Dir = new Option("Dir", "Dir", true,
            "the source Directory.");
        o.setRequired(false);
        options.addOption(Dir);


        Option Env = new Option("Env", "Env", true,
            "Environment.");
        o.setRequired(false);
        options.addOption(Env);

        Option l  = new Option("l","location",true,"the directory location");
        l.setRequired(false);
        options.addOption(l);
        
        Option kafkaTopic = new Option("kafkaTopic", "kafkaTopic", true,
                "kafka topic.");
            o.setRequired(false);
            options.addOption(kafkaTopic);

        Option gelf = new Option("gelf", "gelf", true,
                "gelf message.");
            o.setRequired(false);
            options.addOption(gelf);
        
        Option gelfHost = new Option("ghost", "ghost", true,
                "gelf api server");
            o.setRequired(false);
            options.addOption(gelfHost);
            
        Option gelfPort = new Option("gport", "gport", true,
                "gelf api port");
            o.setRequired(false);
            options.addOption(gelfPort);
            
//        o = new Option("d", "destinationFile", true,
//            "the destination file.  Defaults to System.out");
//        o.setRequired(false);
//        options.addOption(o);

//        o = new Option("f", "functionClasses", true,
//            "additional function classes that are on the classpath "
//                + "and should be loaded");
//        o.setRequired(false);
//        o.setArgs(Option.UNLIMITED_VALUES);
//        options.addOption(o);
//
//
//        o = new Option("i", "interactiveMode", false,
//            "interactive mode");
//        o.setRequired(false);
//        options.addOption(o);
//
//        o = new Option("t", "timeZone", true,
//            "default time zone to use when dealing with dates");
//        o.setRequired(false);
//        options.addOption(o);

        return options;
    }

    /**
     * main method for command line interface
     * @param args arguments for command line interface
     * @throws IOException if there is an error reading from the input or writing to the output
     * @throws JsonDataGeneratorException if there is an error running the json data converter
     * @throws ParseException if the cli arguments cannot be parsed
     * @throws ClassNotFoundException if the addition classes passed in with -f cannot be found
     */
    @SuppressWarnings("checkstyle:linelength")
    public static void main(final String[] args) throws IOException, JsonDataGeneratorException, ParseException, ClassNotFoundException {
//        try {
//            TimeZone.setDefault(DEFAULT_TIMEZONE);
            Options options = buildOptions();
            CommandLineParser parser = new DefaultParser();
//            HelpFormatter help = new HelpFormatter();
//            help.setOptionComparator(new OptionComparator(Arrays.asList("s", "d", "f", "i", "t")));

//            CommandLine cmd = null;
            try {
            	CommandLine cmd = parser.parse(options, args);

                String source = cmd.getOptionValue("s");
//                if (source == null) {
//                    throw new ParseException("Missing required option: -s");
//                }
                File sourceFile = new File(source);
                if (!sourceFile.exists()) {
                    throw new FileNotFoundException(source + " cannot be found");
                }
                String Env = cmd.getOptionValue("Env");

                String location = cmd.getOptionValue("l");
        
                
                String kafkaTopic = cmd.getOptionValue("kafkaTopic");
                if(!StringUtils.isBlank(kafkaTopic)) {
//                	throw new ParseException("Missing required option: -kafkaTopic");
                
	                File tempDestinationFile = new File(System.getProperty("java.io.tmpdir")+"/"+sourceFile.getName()+".json");
	        		String jsonString = generateRandomData(sourceFile, tempDestinationFile);
	        		ResponseEntity<String> response = uploadDataToKafka(jsonString, tempDestinationFile, sourceFile.getName(), kafkaTopic);
	                if(tempDestinationFile.exists()) {
	                	tempDestinationFile.delete();
	                }
                }
        
                String Dir = cmd.getOptionValue("Dir");
                if(!StringUtils.isBlank(Dir)){
                    List<File> fil =listFilesUsingFileWalkAndVisitor(source);
                    for(File file : fil){
                        fileReader(file);
                    }
                }
           
                // if(Env == "Dev"){
                //     String locat = source+DEV;
                //     if(!StringUtils.isBlank(Dir)){
                //         List<File> fil =listFilesUsingFileWalkAndVisitor(locat);
                //         for(File file : fil){
                //             fileReader(file);
                //         }
                //     }
                //   }else if(Env == "Prod"){
                //     String locat = source+PROD;
                //     if(!StringUtils.isBlank(Dir)){
                //         List<File> fil =listFilesUsingFileWalkAndVisitor(locat);
                //         for(File file : fil){
                //             fileReader(file);
                //         }
                //     }
                //   } if(Env == "Stage"){
                //     String locat = source+STAGE;
                //     if(!StringUtils.isBlank(Dir)){
                //         List<File> fil =listFilesUsingFileWalkAndVisitor(locat);
                //         for(File file : fil){
                //             fileReader(file);
                //         }
                //     }
                //   } if(Env == "Test"){
                //     String locat = source+TEST;
                //     if(!StringUtils.isBlank(Dir)){
                //         List<File> fil =listFilesUsingFileWalkAndVisitor(locat);
                //         for(File file : fil){
                //             fileReader(file);
                //         }
                //     }
                //   }


                // if (cmd.hasOption("Dir")) {
                //    List<File> fil =listFilesUsingFileWalkAndVisitor(source);
                //          for(File file : fil){
                //             fileReader(file);
                //          }
                //   }
                
                
                String gelf = cmd.getOptionValue("gelf");
                if(!StringUtils.isBlank(gelf)) {
                	System.out.println("Sending GELF TCP messages to logmanger");
                	String ghost = cmd.getOptionValue("ghost");
                	String gport = cmd.getOptionValue("gport");
                	if(StringUtils.isBlank(ghost)) {
                		throw new ParseException("Missing gelf server address: -ghost");
                	}
                	if(StringUtils.isBlank(gport)) {
                		throw new ParseException("Missing gelf server port: -gport");
                	}
                	File tempDestinationFile = new File(System.getProperty("java.io.tmpdir")+"/"+sourceFile.getName()+".json");
	        		String jsonString = generateRandomData(sourceFile, tempDestinationFile);
	        		
                	JsonArray ary = new Gson().fromJson(jsonString, JsonArray.class);
                	
                	for(JsonElement je: ary) {
                		JsonObject jo = je.getAsJsonObject();
                		String name = jo.get("name").getAsString();
                		System.out.println("msg: "+name);
                		GelfMessageBuilder gmBuilder = new GelfMessageBuilder(name, ghost).level(GelfMessageLevel.INFO);
                		GelfMessage message = gmBuilder.build();
                		getGelfTransport(ghost, Integer.parseInt(gport)).send(message);
                	}
                	
            		
            		System.out.println("GELF TCP messages successfully delivered to host : "+ghost+", port : "+gport);
                }
                
//        		System.out.println(tempDestinationFile.getAbsolutePath());
//                boolean interactiveMode = cmd.hasOption('i');
//
//                if (interactiveMode) {
//                    System.out.println(ENTER_JSON_TEXT);
//                    try (InputStream inputStream = new TimeoutInputStream(System.in,
//                        1, TimeUnit.SECONDS);
//                         OutputStream outputStream = new NonCloseableBufferedOutputStream(
//                             System.out)) {
//                        IOUtils.write("\n\n\n\n\n", outputStream);
//                        JsonDataGenerator jsonDataGenerator = new JsonDataGeneratorImpl();
//                        jsonDataGenerator.generateTestDataJson(inputStream, outputStream);
//                    }
//
//                    System.exit(0);
//                }

                
//                String[] functionClasses = cmd.getOptionValues("f");
//                String timeZone = cmd.getOptionValue("t");

//                if (timeZone != null) {
//                    TimeZone.setDefault(TimeZone.getTimeZone(timeZone));
//                }
                
//                String destination = cmd.getOptionValue("d");
//                File destinationFile = destination != null ? new File(destination) : null;
//                if (destination != null && destinationFile.exists()) {
//                	destinationFile.delete();
////                    throw new IOException(destination + " already exists");
//                }

//                if (functionClasses != null) {
//                    for (String functionClass : functionClasses) {
//                        FunctionRegistry.getInstance().registerClass(Class.forName(functionClass));
//                    }
//                }

            } catch (ParseException e) {
                System.err.println(e.getMessage());
//                help.printHelp(CLIMain.class.getName(), options, true);
                throw e;
            }
//        } finally {
//            TimeZone.setDefault(DEFAULT_TIMEZONE);
//        }
            catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

     }
     public static void fileReader(File jsonPath){
		try {
			BufferedReader br = new BufferedReader(new FileReader(jsonPath));
		
			String output;
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println(output);
			}
	  }catch (MalformedURLException e) {
		  e.printStackTrace();
	  }catch (IOException e) {
		  e.printStackTrace();
	   }

	}

    // public static void testGetApi(File jsonPath) {



	// 	String API_END_POINT = BASE_URL + "/create-test-sd-data?jsonFilePath="+jsonPath;
	// 	HttpURLConnection conn = null;
	//   	try {
	// 		  	URL url = new URL(API_END_POINT);
	// 			conn = (HttpURLConnection) url.openConnection();
	// 			conn.setRequestMethod("GET");
	// 			conn.setRequestProperty("Accept", "application/json");
					
	// 			if (conn.getResponseCode() != 200) {
	// 				throw new RuntimeException("Failed : HTTP error code : "
	// 						+ conn.getResponseCode());
	// 			}
	// 			BufferedReader br = new BufferedReader(new FileReader(jsonPath));
			
	// 			String output;
	// 			System.out.println("Output from Server .... \n");
	// 			while ((output = br.readLine()) != null) {
	// 				System.out.println(output);
	// 			}
	// 	  }catch (MalformedURLException e) {
	// 		  e.printStackTrace();
	// 	  }catch (IOException e) {
	// 		  e.printStackTrace();
	// 	   }
    //        finally {
	// 		 if(conn != null) {
	// 			conn.disconnect();
	// 		 }
	// 	  }
	
	// 	}
    

	private static String generateRandomData(File sourceFile, File tempDestinationFile)
			throws JsonDataGeneratorException, IOException, FileNotFoundException {
		tempDestinationFile.deleteOnExit();
		String jsonString = "";
		JsonDataGenerator jsonDataGenerator = new JsonDataGeneratorImpl();
		try (InputStream inputStream = new FileInputStream(sourceFile);
		     OutputStream outputStream = tempDestinationFile != null
		             ? new FileOutputStream(tempDestinationFile)
		         : new NonCloseableBufferedOutputStream(System.out)) {
		    jsonString = jsonDataGenerator.generateTestDataJson(inputStream, outputStream);
		    System.out.println(jsonString);
		}
		return jsonString;
	}

    public static List<File> listFilesUsingFileWalkAndVisitor(String dir) throws IOException {
		Set<String> fileList = new HashSet<>();
		List<File> fl = new ArrayList<>();
		Files.walkFileTree(Paths.get(dir), new SimpleFileVisitor<Path>() {
			@Override
			public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) {
				if (!Files.isDirectory(file)) {
					fileList.add(file.getFileName().toString());
					fl.add(file.toFile());
				}
				return FileVisitResult.CONTINUE;
			}
		});
		
		return fl;
	}


    private static ResponseEntity<String> uploadDataToKafka(String jsonString, File tempDestinationFile, String entity, String kafkaTopic) throws IOException {
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.MULTIPART_FORM_DATA);
    	MultiValueMap<String, Object> body = new LinkedMultiValueMap<>();
    	body.add("file", getTempOutputFile(jsonString, entity));
    	
    	HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(body, headers);
    	
    	RestTemplate restTemplate = new RestTemplate();
    	
    	ResponseEntity<String> response = restTemplate.postForEntity(JSON_TO_KAFKA_URL+"?kafkaTopic="+kafkaTopic, requestEntity, String.class);
    	System.out.println(response);
    	return response;
    }
    
    public static FileSystemResource getTempOutputFile(String jsonString, String entity) throws IOException {
        Path tempFile = Files.createTempFile(entity, ".json");
        Files.write(tempFile, jsonString.getBytes());
        System.out.println("uploading: " + tempFile);
        File file = tempFile.toFile();
        file.deleteOnExit();
        return new FileSystemResource(file);
    }
    
    /**
     * helper {@link Comparator} to wort arguments in help
     */
    private static class OptionComparator implements Comparator<Option> {
        private final List<String> orderList;

        OptionComparator(final List<String> orderList) {
            this.orderList = orderList;
        }


        @Override
        public int compare(final Option o1, final Option o2) {
            int index1 = orderList.indexOf(o1.getOpt());
            int index2 = orderList.indexOf(o2.getOpt());
            return index1 - index2;
        }
    }

    public static GelfConfiguration getGelfConfiguration(String host, int port) {
		return new GelfConfiguration(new InetSocketAddress(host, port))
        .transport(GelfTransports.TCP)
        .queueSize(512)
        .connectTimeout(5000)
        .reconnectDelay(1000)
        .tcpNoDelay(true)
        .sendBufferSize(32768);
	}
    
    public static GelfTransport getGelfTransport(String host, int port) {
		return GelfTransports.create(getGelfConfiguration(host, port));
	}
}
