// https://sourcegraph.com/github.com/gruntwork-io/terratest/-/blob/modules/aws/s3.go?L13

package aws

import (
	"github.com/gruntwork-io/terratest/modules/testing"
	"github.com/stretchr/testify/require"
)

// FindS3BucketWithTag finds the name of the S3 bucket in the given region with the given tag key=value.
func FindS3BucketWithTag(t testing.TestingT, awsRegion string, key string, value string) string {
	bucket, err := FindS3BucketWithTagE(t, awsRegion, key, value)
	require.NoError(t, err)

	return bucket

}
