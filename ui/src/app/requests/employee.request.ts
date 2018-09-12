import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions, Response, ResponseContentType } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import * as FileSaver from 'file-saver';
import 'rxjs/add/operator/map';
@Injectable()
export class EmployeeRequest {


    constructor(private http: Http) { }

    getEmployees(employee) {
        return this.http.post('http://localhost/sync_skills_api/employees.php', employee)
            .map((response: Response) => {
                return response.json();
            });
    }

    getById(id: number) {
        return this.http.get('/api/users/' + id, this.jwt()).map((response: Response) => response.json());
    }

    create(employee) {
        return this.http.post('http://localhost/sync_skills_api/employees.php', employee)
            .map((response: Response) => {
                return response.json();
            });
    }

    update(employee) {
        return this.http.put(`http://localhost/sync_skills_api/employees.php`, employee)
            .map((response: Response) => {
                return response.json();
            });
    }

    uploadData(employee) {
        return this.http.post(`http://localhost/sync_skills_api/employees.php`, employee)
            .map((response: Response) => {
                return response.json();
            });
    }

    downloadEmpData(employee) {
        return this.http.post(`http://localhost/sync_skills_api/employees.php`, employee, { responseType: ResponseContentType.Blob })
            .map(
            (res: any) => {
                let blob = res.blob();
                var d = new Date();
                let filename = 'employee_data_'+d.getTime()+'.xlsx';
                FileSaver.saveAs(blob, filename);
            }
            );
    }


    deleteEmployee(employee) {
        return this.http.post('http://localhost/sync_skills_api/employees.php', employee)
            .map((response: Response) => {
                return response.json();
            });
    }

    // private helper methods

    // private jwt() {
    //     // create authorization header with jwt token
    //     let currentUser = JSON.parse(localStorage.getItem('currentUser'));
    //     if (currentUser && currentUser.token) {
    //         let headers = new Headers({ 'Authorization': 'Bearer ' + currentUser.token });
    //         return new RequestOptions({ headers: headers });
    //     }
    // }

    private jwt() {
        let headers = new Headers();
        headers.append('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8;multipart/form-data');
        headers.append('Accept', 'application/json');
        //let options = new RequestOptions({ headers: headers });
        return new RequestOptions({ headers: headers });
    }
}