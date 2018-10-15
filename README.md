# terraform-aws-s3-bucket
terraform module to create S3 bucket

Requirements
------------
- follow naming convention for S3
- logging bucket


Contributing
-------
- submit pull request and ask for review
- ensure you add tests in every changes
- issues submission is welcome, but don't guarantee immediate fix.
- there is no standard for contributing yet, so just submit as your preferred format

How to Use Examples
-------
1. Ensure you have `Go` and `dep` installed
   ```bash
   cd test
   ```
2. Check `test/s3_test.go` and `test/fixture/*.tf`, change accordingly with your needs
3. Run the test in your dev environment
   ```bash
   go test
   ```
4. Check whether your test `PASS` or `FAIL`
   ```bash
   TestS3Bucket 2018-10-15T11:32:53+07:00 command.go:96: Destroy complete! Resources: 7 destroyed.
   PASS
   ok      terraform-aws-s3-bucket/test    50.262s
   ```

Authors
-------

- [Rizki](https://github.com/rizkidoank)

License
-------

Apache 2 Licensed. See LICENSE for full details.