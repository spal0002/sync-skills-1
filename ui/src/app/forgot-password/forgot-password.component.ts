import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { ApplicationService } from '../services/application.service';
import { ProfileService } from '../services/profile.service';
import { AuthenticationService } from '../services/authentication.service';
import { AlertService } from '../services/alert.service';
import { AppComponent } from '../app.component';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';


@Component({
  selector: 'app-forgot-password',
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.css']
})
export class ForgotPasswordComponent implements OnInit {
  model: any = {};
  form: FormGroup;
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private appComponent: AppComponent,
    private applicationService: ApplicationService,
    private authenticationService: AuthenticationService,
    private profileService: ProfileService,
    private formBuilder: FormBuilder,
    private alertService: AlertService) { }
  ngOnInit() {
    this.form = this.formBuilder.group({
      email: [null, [Validators.required]]
    });
  }

  sendPasswordLink() {
    this.applicationService.loading = true;
    this.model.type = "forget_password";
    this.authenticationService.forgotPassword(this.model)
      .subscribe(
        data => {
          if (data.success == true) {
            this.alertService.success(data.message);
            this.applicationService.loading = false;
          } else {
           
            this.alertService.error(data.message);
            this.applicationService.loading = false;
          }
        },
        error => {
          this.alertService.error(error);
          this.applicationService.loading = false;
        });
  }

}
