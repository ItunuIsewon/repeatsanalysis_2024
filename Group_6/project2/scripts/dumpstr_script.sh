dumpSTR  \
    --vcf AFR_calls.vcf.gz \
    --out AFR_calls_filtered \
    --vcftype hipstr \
    --hipstr-min-call-Q 0.9 \
    --hipstr-min-call-DP 10
