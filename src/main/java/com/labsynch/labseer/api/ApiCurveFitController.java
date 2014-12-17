package com.labsynch.labseer.api;

import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

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
import com.labsynch.labseer.dto.FlagWellDTO;
import com.labsynch.labseer.dto.RawCurveDataDTO;
import com.labsynch.labseer.dto.TgDataDTO;
import com.wordnik.swagger.annotations.ApiOperation;

@Controller
@RequestMapping("api/v1/curvefit")
@Transactional
public class ApiCurveFitController {
	
	private static final Logger logger = LoggerFactory.getLogger(ApiCurveFitController.class);
	
	@ApiOperation(value="getFitDataByCurveId", notes="get fit data by curve id in format: [{\"curveid\":????????},{\"curveid\":????????}]")
	@Transactional
    @RequestMapping(value = "/fitdata", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> getFitDataByCurveId(@RequestBody List<CurveFitDTO> curveFitDTOs, @RequestParam(value = "format", required = false) String format) {
        try {
			Collection<CurveFitDTO> filledCurveFitDTOs = CurveFitDTO.getFitData(curveFitDTOs);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/json");
			if (format != null && (format.equalsIgnoreCase("csv") || format.equalsIgnoreCase("tsv"))) {
				String outFileString = CurveFitDTO.getCsvList(filledCurveFitDTOs, format);
			    return new ResponseEntity<String>(outFileString, headers, HttpStatus.OK);
			} else {
			    return new ResponseEntity<String>(CurveFitDTO.toJsonArray(filledCurveFitDTOs), headers, HttpStatus.OK);
			}
		} catch (Exception e) {
			String error = e.getMessage() + e.getStackTrace();
	    	logger.error("Caught error: "+error);
	    	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
    }
	
	@ApiOperation(value="getRawCurveDataByCurveId", notes="get raw data by curve ids provided as: [{\"curveid\":????????},{\"curveid\":????????}]")
	@Transactional
	@RequestMapping(value = "/rawdata", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<String> getRawCurveDataByCurveId(@RequestBody List<RawCurveDataDTO> rawCurveDataDTOs, @RequestParam(value = "format", required = false) String format) {
		try {
			Collection<RawCurveDataDTO> filledRawCurveDataDTOs = RawCurveDataDTO.getRawCurveData(rawCurveDataDTOs);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/json");
			if (format != null && (format.equalsIgnoreCase("csv") || format.equalsIgnoreCase("tsv"))) {
				String outFileString = RawCurveDataDTO.getCsvList(filledRawCurveDataDTOs, format);
			    return new ResponseEntity<String>(outFileString, headers, HttpStatus.OK);
			} else {
			    return new ResponseEntity<String>(RawCurveDataDTO.toJsonArray(filledRawCurveDataDTOs), headers, HttpStatus.OK);
			}
		} catch (Exception e) {
			String error = e.getMessage() + e.getStackTrace();
	    	logger.error("Caught error: "+error);
	    	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Transactional
	@RequestMapping(value = "/tgdata", method = RequestMethod.POST, headers = "Accept=application/json")
	public ResponseEntity<String> getTgDataByCurveId(@RequestBody List<TgDataDTO> tgDataDTOs, @RequestParam(value = "format", required = false) String format) {
		try {
			Collection<TgDataDTO> filledTgDataDTOs = TgDataDTO.getTgData(tgDataDTOs);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/json");
			if (format != null && (format.equalsIgnoreCase("csv") || format.equalsIgnoreCase("tsv"))) {
				String outFileString = TgDataDTO.getCsvList(filledTgDataDTOs, format);
			    return new ResponseEntity<String>(outFileString, headers, HttpStatus.OK);
			} else {
			    return new ResponseEntity<String>(TgDataDTO.toJsonArray(filledTgDataDTOs), headers, HttpStatus.OK);
			}
		} catch (Exception e) {
			String error = e.getMessage() + e.getStackTrace();
	    	logger.error("Caught error: "+error);
	    	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Transactional
    @RequestMapping(value = "/fitdata", method = RequestMethod.GET, headers = "Accept=application/json")
    public ResponseEntity<String> getFitDataByExperimentIdOrCodeName(@RequestParam(value = "experiment") String experimentIdOrCodeName, 
    		@RequestParam(value = "format", required = false) String format) {
        try {
			Collection<CurveFitDTO> curveFitDTOs = CurveFitDTO.getFitDataByExperiment(experimentIdOrCodeName);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/json");
			if (format != null && (format.equalsIgnoreCase("csv") || format.equalsIgnoreCase("tsv"))) {
				String outFileString = CurveFitDTO.getCsvList(curveFitDTOs, format);
			    return new ResponseEntity<String>(outFileString, headers, HttpStatus.OK);
			} else {
			    return new ResponseEntity<String>(CurveFitDTO.toJsonArray(curveFitDTOs), headers, HttpStatus.OK);
			}
		} catch (Exception e) {
			String error = e.getMessage() + e.getStackTrace();
	    	logger.error("Caught error: "+error);
	    	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
    }
	
	@Transactional
    @RequestMapping(value = "/rawdata", method = RequestMethod.GET, headers = "Accept=application/json")
    public ResponseEntity<String> getRawDataByExperimentIdOrCodeName(@RequestParam(value = "experiment") String experimentIdOrCodeName, 
    		@RequestParam(value = "format", required = false) String format) {
        try {
			Collection<RawCurveDataDTO> rawCurveDataDTOs = RawCurveDataDTO.getRawCurveDataByExperiment(experimentIdOrCodeName);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/json");
			if (format != null && (format.equalsIgnoreCase("csv") || format.equalsIgnoreCase("tsv"))) {
				String outFileString = RawCurveDataDTO.getCsvList(rawCurveDataDTOs, format);
			    return new ResponseEntity<String>(outFileString, headers, HttpStatus.OK);
			} else {
			    return new ResponseEntity<String>(RawCurveDataDTO.toJsonArray(rawCurveDataDTOs), headers, HttpStatus.OK);
			}
		} catch (Exception e) {
			String error = e.getMessage() + e.getStackTrace();
	    	logger.error("Caught error: "+error);
	    	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
    }
	
	@Transactional
    @RequestMapping(value = "/tgdata", method = RequestMethod.GET, headers = "Accept=application/json")
    public ResponseEntity<String> getTgDataByExperimentIdOrCodeName(@RequestParam(value = "experiment") String experimentIdOrCodeName, 
    		@RequestParam(value = "format", required = false) String format) {
        try {
			Collection<TgDataDTO> tgDataDTOs = TgDataDTO.getTgDataByExperiment(experimentIdOrCodeName);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/json");
			if (format != null && (format.equalsIgnoreCase("csv") || format.equalsIgnoreCase("tsv"))) {
				String outFileString = TgDataDTO.getCsvList(tgDataDTOs, format);
			    return new ResponseEntity<String>(outFileString, headers, HttpStatus.OK);
			} else {
			    return new ResponseEntity<String>(TgDataDTO.toJsonArray(tgDataDTOs), headers, HttpStatus.OK);
			}
		} catch (Exception e) {
			String error = e.getMessage() + e.getStackTrace();
	    	logger.error("Caught error: "+error);
	    	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
    }
	
	@Transactional
    @RequestMapping( method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> updateFitDataFromJson(@RequestBody List<CurveFitDTO> curveFitDTOs) {
	    try {
			CurveFitDTO.updateFitData(curveFitDTOs);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/json");
			return new ResponseEntity<String>(headers, HttpStatus.OK);
		} catch (Exception e) {
	    	String error = e.getMessage() + e.getStackTrace();
	    	logger.error("Caught error: "+error);
	    	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

    }
	
	@Transactional
    @RequestMapping(value = "/flagWells", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> updateWellFlags(@RequestBody List<FlagWellDTO> flagWellDTOs) {
	    try {
	    	FlagWellDTO.updateWellFlags(flagWellDTOs);
	    	HttpHeaders headers = new HttpHeaders();
		    headers.add("Content-Type", "application/json");
		    return new ResponseEntity<String>(headers, HttpStatus.OK);
	    } catch(Exception e) {
	    	String error = e.getMessage() + e.getStackTrace();
	    	logger.error("Caught error: "+error);
	    	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	    

    }
	
}
