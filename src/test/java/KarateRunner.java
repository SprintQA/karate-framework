package sprintqa;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import utils.Reporter;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;
import org.junit.Test;

/**
 * @author Tafseer Haider
 * @Dated 08/10/2020
 */

@KarateOptions(tags = { "~@ignore" }, features = "classpath:sprintqa")
public class KarateRunner {

    @Test
    public void testParallel() throws IOException {
        Results results = Runner.parallel(getClass(), 5, "target/surefire-reports");
        generateReport(results.getReportDir());
        Reporter.generateReportFile();
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
        // @SuppressWarnings("unchecked")
        ArrayList<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));

        Configuration config = new Configuration(new File("target"), "SprintQA Karate Framework");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();

        System.out.println("Cucumber report is located at: " + new File("").getAbsolutePath()
                + "\\target\\cucumber-html-reports\\overview-features.html");
    }
}
