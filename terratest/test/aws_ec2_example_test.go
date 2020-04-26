
// NOTE:
// run ```dep ensure``` first before running ```go test -v -timeout 90m .```
// go test -v -timeout 90m .

package test
import "fmt"
import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/ using Terratest.
func TestAwsEc2Example(t *testing.T) {
	t.Parallel()
	ec2ModuleOptions := &terraform.Options{
		TerraformDir: "../examples/aws-ec2-example",
		NoColor: false,
	}
	terraform.InitAndApply(t, ec2ModuleOptions)

	// Run `terraform output` to get the values of output variables
	expectedEc2LenTest := terraform.OutputRequired(t, ec2ModuleOptions, "t_ec2_ids")
	fmt.Println(expectedEc2LenTest)

	// Verify that all output are not empty
	assert.NotEmpty(t, expectedEc2LenTest)
	defer terraform.Destroy(t, ec2ModuleOptions)
}