// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.labsynch.labseer.web;

import com.labsynch.labseer.domain.Author;
import com.labsynch.labseer.web.AuthorController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect AuthorController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AuthorController.showJson(@PathVariable("id") Long id) {
        Author author = Author.findAuthor(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (author == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(author.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AuthorController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<Author> result = Author.findAllAuthors();
        return new ResponseEntity<String>(Author.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> AuthorController.createFromJson(@RequestBody String json) {
        Author author = Author.fromJsonToAuthor(json);
        author.persist();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> AuthorController.createFromJsonArray(@RequestBody String json) {
        for (Author author: Author.fromJsonArrayToAuthors(json)) {
            author.persist();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> AuthorController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        Author author = Author.fromJsonToAuthor(json);
        if (author.merge() == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> AuthorController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (Author author: Author.fromJsonArrayToAuthors(json)) {
            if (author.merge() == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> AuthorController.deleteFromJson(@PathVariable("id") Long id) {
        Author author = Author.findAuthor(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (author == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        author.remove();
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByActivationKeyAndEmailAddress", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AuthorController.jsonFindAuthorsByActivationKeyAndEmailAddress(@RequestParam("activationKey") String activationKey, @RequestParam("emailAddress") String emailAddress) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Author.toJsonArray(Author.findAuthorsByActivationKeyAndEmailAddress(activationKey, emailAddress).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByEmailAddress", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AuthorController.jsonFindAuthorsByEmailAddress(@RequestParam("emailAddress") String emailAddress) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Author.toJsonArray(Author.findAuthorsByEmailAddress(emailAddress).getResultList()), headers, HttpStatus.OK);
    }
    
    @RequestMapping(params = "find=ByUserName", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> AuthorController.jsonFindAuthorsByUserName(@RequestParam("userName") String userName) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<String>(Author.toJsonArray(Author.findAuthorsByUserName(userName).getResultList()), headers, HttpStatus.OK);
    }
    
}
