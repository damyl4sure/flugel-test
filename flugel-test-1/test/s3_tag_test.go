package aws

import (
	"strings"
	"testing"

	//"github.com/aws/aws-sdk-go/aws"

	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/stretchr/testify/assert"
)

func TestGetS3BucketTags(t *testing.T) {
	t.Parallel()
	// Pre-defined values
	//bucket := "MyBucket"
	var tagName1 string = "Name"
	var tagValue1 string = "Flugel"
	var tagName2 string = "Owner"
	var tagValue2 string = "InfraTeam"
	// Make a copy of the terraform module to a temporary directory. This allows running multiple tests in parallel
	// against the same terraform module.
	// exampleFolder := test_structure.CopyTerraformFolderToTemp(t, "../", "../")

	region := aws.GetRandomStableRegion(t, nil, nil)
	id := random.UniqueId()
	logger.Logf(t, "Random values selected. Region = %s, Id = %s\n", region, id)
	s3BucketName := "gruntwork-terratest-" + strings.ToLower(id)

	// CreateS3Bucket(t, region, s3BucketName)
	// defer DeleteS3Bucket(t, region, s3BucketName)

	s3Client, err := aws.NewS3ClientE(t, region)
	if err != nil {
		t.Fatal(err)
	}

	_, err = s3Client.PutBucketTagging(&s3.PutBucketTaggingInput{
		Bucket: &s3BucketName,
		Tagging: &s3.Tagging{
			TagSet: []*s3.Tag{
				{
					Key:   aws.String("Key1"),
					Value: aws.string("Value1"),
				},
				{
					Key:   aws.string("Key2"),
					Value: aws.string("Value2"),
				},
			},
		},
	})
	if err != nil {
		t.Fatal(err)
	}

	actualTags := aws.GetS3BucketTags(t, region, s3BucketName)
	assert.True(t, actualTags["Key1"] == "Value1")
	assert.True(t, actualTags["Key2"] == "Value2")
	assert.True(t, actualTags["NonExistentKey"] == "")
}
