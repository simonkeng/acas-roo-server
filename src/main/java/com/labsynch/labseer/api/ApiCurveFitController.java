package com.labsynch.labseer.api;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.supercsv.cellprocessor.ift.CellProcessor;
import org.supercsv.io.CsvBeanWriter;
import org.supercsv.io.ICsvBeanWriter;
import org.supercsv.prefs.CsvPreference;

import com.labsynch.labseer.domain.AnalysisGroupValue;
import com.labsynch.labseer.dto.AnalysisGroupValueDTO;
import com.labsynch.labseer.dto.CurveFitDTO;
import com.labsynch.labseer.dto.ExperimentSearchRequestDTO;

@Controller
@RequestMapping("api/v1/curvefit")
@Transactional
public class ApiCurveFitController {
	
	private static final Logger logger = LoggerFactory.getLogger(ApiCurveFitController.class);
	
	@Transactional
    @RequestMapping(value = "/fitdata", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> getFitDataByCurveId(@RequestBody String json, @RequestParam(value = "format", required = false) String format) {
        logger.debug("incoming json: " + json);
        Collection<CurveFitDTO> curveFitDTOs = CurveFitDTO.fromJsonArrayToCurveFitDTO(json);
        curveFitDTOs = CurveFitDTO.getFitData(curveFitDTOs);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (format != null && (format.equalsIgnoreCase("csv") || format.equalsIgnoreCase("tsv"))) {
        	String outFileString = CurveFitDTO.getCsvList(curveFitDTOs, format);
            return new ResponseEntity<String>(outFileString, headers, HttpStatus.OK);
        } else {
            return new ResponseEntity<String>(CurveFitDTO.toJsonArray(curveFitDTOs), headers, HttpStatus.OK);
        }
    }
	
	
}
