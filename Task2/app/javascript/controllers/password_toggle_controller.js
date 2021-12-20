import { Controller } from "stimulus";

export default class extends Controller {

  static targets = ["unhide"]

  password(e) {
    console.log(this.unhideTarget.type)
    if (this.unhideTarget.type === "password") {
      e.target.classList.remove('bi-eye-slash');
      e.target.classList.add('bi-eye');
      this.unhideTarget.type = "text";
    } else {
      e.target.classList.remove('bi-eye');
      e.target.classList.add('bi-eye-slash');
      this.unhideTarget.type = "password";
    }
    
  }
}
