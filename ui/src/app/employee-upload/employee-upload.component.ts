import { Component, OnInit } from '@angular/core';
import { ProfileService } from '../services/profile.service';
import { Http, Headers, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs';
import { ApplicationService } from '../services/application.service';
import { AlertService } from '../services/alert.service';
import { EmployeeRequest } from '../requests/employee.request';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-employee-upload',
  templateUrl: './employee-upload.component.html',
  styleUrls: ['./employee-upload.component.css']
})
export class EmployeeUploadComponent implements OnInit {


  empFile: FileList;
  empData: any = {};
  constructor(
    private profileService: ProfileService,
    private employeeRequest: EmployeeRequest,
    private alertService: AlertService,
    private router: Router,
    private applicationService: ApplicationService,
    private http: Http
  ) { }

  ngOnInit() {
    this.profileService.setActive('uploademployee');
  }

  fileChange(event) {
    this.empFile = event.target.files;
  }


  uploadData(event) {
    if (confirm("Are you sure you want to replace employees information")) {
      this.applicationService.loading = true;
      event.preventDefault();
      let fileList: FileList = this.empFile;
      if (fileList.length > 0) {
        let file: File = fileList[0];
        let formData: FormData = new FormData();
        formData.append('EmpData', file, file.name);
        formData.append('type', 'uploadEmployees');
        this.employeeRequest.uploadData(formData)
          .subscribe(
            data => {
              this.applicationService.loading = false;
              if (data.success == true) {
                this.alertService.success('Employee Details updated successfully');
                setTimeout(() => {
                  this.router.navigate(['./employee']);
                }, 2000);
              } else {
                this.applicationService.loading = false;
                this.alertService.error(data.message);
              }
            },
            error => {
              this.applicationService.loading = false;
              this.alertService.error(error);
            });
      }
    }
  }
}