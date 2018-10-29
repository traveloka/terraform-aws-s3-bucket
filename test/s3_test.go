package test

import (
	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestS3Bucket(t *testing.T) {
	t.Parallel()

	// set your expected values here
	expected_region := "ap-southeast-1"
	expected_bucket_prefix := "tsi-archive-data"
	expected_bucket_acl := "private"
	expected_sse_algorithm := "AES256"
	expected_logging_bucket := "sample-logging-test"
	expected_versioning_enabled := "True"

	// set test fixture directory, variables, etc
	terraformOptions := &terraform.Options{
		TerraformDir: "fixture/",
	}

	// terraform get, init, apply
	// destroy after assert done
	defer terraform.Destroy(t, terraformOptions)
	terraform.Get(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// get actual values from outputs
	actual_region := terraform.Output(t, terraformOptions, "region")
	actual_bucket_name := terraform.Output(t, terraformOptions, "bucket_name")
	actual_bucket_acl := terraform.Output(t, terraformOptions, "acl")
	actual_sse_algorithm := terraform.Output(t, terraformOptions, "sse_algorithm")
	actual_logging_bucket := terraform.Output(t, terraformOptions, "logging_bucket")
	actual_versioning := terraform.Output(t, terraformOptions, "versioning_enabled")

	// assert actual values with expected values
	assert.Equal(t, expected_region, actual_region)
	assert.Contains(t, actual_bucket_name, expected_bucket_prefix)
	assert.Equal(t, expected_bucket_acl, actual_bucket_acl)
	assert.Equal(t, expected_sse_algorithm, actual_sse_algorithm)
	assert.Equal(t, expected_logging_bucket, actual_logging_bucket)
	assert.Equal(t, expected_versioning_enabled, actual_versioning)
	aws.AssertS3BucketExists(t, expected_region, actual_bucket_name)
}
