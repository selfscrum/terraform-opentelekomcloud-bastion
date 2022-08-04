package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformBastion(t *testing.T) {
	t.Parallel()
	// retryable errors in terraform testing.

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/simple_bastion", VarFiles: []string{"../../assets/test-secret.tfvars"},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, "public_ip")
	public_ip := output
	assert.NotEqual(t, "", public_ip)
	assert.Regexp(t, "[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+", public_ip)

	output = terraform.Output(t, terraformOptions, "private_ip")
	private_ip := output
	assert.NotEqual(t, "", private_ip)
	assert.Regexp(t, "[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+", private_ip)

	output = terraform.Output(t, terraformOptions, "security_group_id")
	assert.NotEqual(t, "", output)

}
