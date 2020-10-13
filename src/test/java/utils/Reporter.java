package utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Paths;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * @author Tafseer Haider
 * @Dated 08/10/2020
 */
public class Reporter {
    private static final String reportDirectory = "target/surefire-reports";

    public static void generateReportFile() throws IOException {
        try (Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("report.json"), "utf-8"))) {
            writer.write(concatFiles().toString());
        }
        System.out.println("Success!!!! :)");
    }

    private static JSONArray concatFiles() throws IOException {
        JSONArray combinedArray = new JSONArray();
        for (File file : getFiles()) {
            String content = new String(Files.readAllBytes(Paths.get(file.getPath())));
            JSONObject jsonContent = new JSONArray(content).getJSONObject(0);
            combinedArray.put(jsonContent);
        }
        return combinedArray;
    }

    private static File[] getFiles() {
        File dir = new File(reportDirectory);
        return dir.listFiles((directory, name) -> name.toLowerCase().endsWith(".json"));
    }

}
