package test

import (
	"fmt"
	"testing"
	"time"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformVarsTest(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		TerraformDir: "../",

		Vars: map[string]interface{}{
			"business_divsion": "InfraTeam",
			"environment":      "Flugel",
		},
	})

	// Run a Terraform init and apply with Terraform options
	terraform.InitAndApply(t, terraformOptions)

	//Run a Terraform Destroy and apply with the Terraform options
	defer terraform.Destroy(t, terraformOptions)

	publicIp := terraform.Output(t, terraformOptions, "public_ip")

	url := fmt.Sprintf("http://%s:8080", publicIp)

	http_helper.HttpGetWithRetry(t, url, nil, 200, "Made Terraform Module!", 30, 5*time.Second)

}
