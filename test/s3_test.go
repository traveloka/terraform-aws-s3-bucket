package test

import (
	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestS3Bucket(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		TerraformDir: "fixture/",
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.Get(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	actual_region := terraform.Output(t, terraformOptions, "region")
	actual_bucket_name := terraform.Output(t, terraformOptions, "bucket_name")
	actual_bucket_acl := terraform.Output(t, terraformOptions, "acl")
	actual_sse_algorithm := terraform.Output(t, terraformOptions, "sse_algorithm")
	actual_logging_bucket := terraform.Output(t, terraformOptions, "logging_bucket")
	actual_versioning := terraform.Output(t, terraformOptions, "versioning_enabled")

	assert.Equal(t, "ap-southeast-1", actual_region)
	assert.Contains(t, actual_bucket_name, "tsi-archive-data")
	assert.Equal(t, "private", actual_bucket_acl)
	assert.Equal(t, "AES256", actual_sse_algorithm)
	assert.Equal(t, "sample-logging-test", actual_logging_bucket)
	assert.Equal(t, "True", actual_versioning)

	aws.AssertS3BucketExists(t, "ap-southeast-1", actual_bucket_name)
}
